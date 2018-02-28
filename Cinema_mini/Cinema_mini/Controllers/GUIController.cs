using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Mvc;
using Cinema_mini.Models;
using Cinema_mini.Services;
using System.Data.SqlClient;
using System.Data.Entity.Validation;
using Newtonsoft.Json;
using System.Security.Cryptography;
using System.Text;

namespace Cinema_mini.Controllers
{
    public class GUIController : Controller
    {
        // GET: GUI
        public ActionResult Index()
        {
            return View();
        }

        public string Check_login()
        {
            string username = Request.Form["urs"];
            string pass = Request.Form["pass"];

            //MD5//
            MD5 md5 = new MD5CryptoServiceProvider();
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(pass));
            byte[] pass_md5 = md5.Hash;

            StringBuilder strBuilder = new StringBuilder();
            for (int i = 0; i < pass_md5.Length; i++)
            {
                //change it into 2 hexadecimal digits
                //for each byte
                strBuilder.Append(pass_md5[i].ToString("x2"));
            }
            string pass_md5f = strBuilder.ToString();
            //END MD5//
            Services_1 msg = new Services_1();
            string json_return = "";
            using (CinemaEntities db = new CinemaEntities())
            {
                try
                {
                    DateTime dt = new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Local);//from 1970/1/1 00:00:00 to now
                    DateTime dtNow = DateTime.Now;
                    TimeSpan result = dtNow.Subtract(dt);
                    int seconds = Convert.ToInt32(result.TotalSeconds);
                    var check = db.Cinema_User.Where(a => a.username == username && a.pass == pass_md5f).SingleOrDefault();
                    if (check != null)
                    {
                        var check_info_expire = db.Cinema_TrackingLogin.Where(a => a.username == username).SingleOrDefault();
                        if (check_info_expire != null) // co ton tai trong TrackingLogin
                        {
                            check_info_expire.name = username + "_" + seconds;
                            check_info_expire.time_created = DateTime.Now;
                            check_info_expire.duration_expired = DateTime.Now.AddMinutes(15);
                            db.SaveChanges();
                            msg.msg = "Cap nhat thanh cong";
                        }
                        else
                        {
                            Cinema_TrackingLogin newCheck_info = new Cinema_TrackingLogin();
                            newCheck_info.name = username + "_" + seconds;
                            newCheck_info.time_created = DateTime.Now;
                            newCheck_info.duration_expired = DateTime.Now.AddMinutes(15);
                            newCheck_info.username = username;
                            db.Cinema_TrackingLogin.Add(newCheck_info);
                            db.SaveChanges();
                            msg.msg = "Them thanh cong";
                        }
                        msg.code = 1;
                        json_return = JsonConvert.SerializeObject(msg);
                        return json_return;
                    }
                    else
                    {
                        msg.code = 0;
                        msg.msg = "Tài khoản không tồn tại";
                        json_return = JsonConvert.SerializeObject(msg);
                        return json_return;
                    }
                }
                catch (DbEntityValidationException e)
                {
                    foreach (var eve in e.EntityValidationErrors)
                    {
                        Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                            eve.Entry.Entity.GetType().Name, eve.Entry.State);
                        foreach (var ve in eve.ValidationErrors)
                        {
                            Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                                ve.PropertyName, ve.ErrorMessage);
                        }
                    }
                    throw;
                }
            }
        }

        public ViewResult Show_error()
        {
            ViewBag.msg = Request.QueryString["msg"];
            return View();
        }

        public ViewResult Main()
        {
            try
            {
                if (Request.QueryString["u"] == null)
                {
                    return View("Index");
                }
                else
                {
                    string username = Request.QueryString["u"].ToString();
                    using (CinemaEntities db = new CinemaEntities())
                    {
                        var check = db.Cinema_TrackingLogin.Where(a => a.username == username && a.duration_expired > DateTime.Now).SingleOrDefault();
                        if (check != null)
                        {
                            //neu ton tai, tuc la no van con thoi gian luu giu thong tin dang nhap
                            return View();
                        }
                        else return View("Index");
                    }
                }
            }
            catch (Exception e)
            {                                  
                return View("Show_error");
            }
        }

    }
}