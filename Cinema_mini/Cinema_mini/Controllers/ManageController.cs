using System;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Cinema_mini.Services;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Cinema_mini.Models;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Web.Script.Serialization;

namespace Cinema_mini.Controllers
{
    public class ManageController : Controller
    {
        //quản lý vé
        #region quản lý vé
        public ViewResult Ticket_Management()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                //get type ticket
                var list_type_tick = db.Cinema_TypeTick.ToList();
                ViewBag.list_tt = list_type_tick;
                //get room
                var list_room = db.Cinema_Room.ToList();
                ViewBag.list_r = list_room;
                //get showtime
                var list_stime = db.Cinema_Showtime.ToList();
                ViewBag.list_st = list_stime;
                return View();
            }
        }

        public string Get_ticket_data()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                var ticket = db.get_ticket.ToList();
                string json = JsonConvert.SerializeObject(ticket, Formatting.Indented,
                                new JsonSerializerSettings()
                                {
                                    ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                                });
                return json;
            }
        }


        public string delete_ticket()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                Services_1 msg = new Services_1();
                string json_return = "";
                int id_tick = Int32.Parse(Request.Form["id_ticket"].ToString());
                var check = db.Cinema_Ticket.Where(r => r.id == id_tick).SingleOrDefault();
                if (check != null)
                {
                    db.Cinema_Ticket.Remove(check);
                    db.SaveChanges();
                    msg.code = 0;
                    msg.msg = "Thanh cong";
                }
                else
                {
                    msg.code = 1;
                    msg.msg = "Xoa that bai";
                }
                json_return = JsonConvert.SerializeObject(msg);
                return json_return;
            }
        }

        //public string get_ticket_by_id()
        //{
        //    using (CinemaEntities db = new CinemaEntities())
        //    {
        //        string json = "";
        //        Services_1 msg = new Services_1();
        //        string id = Request.Form["id_ticket"].ToString();
        //        int id_tick = Int32.Parse(id);
        //        var ticket = db.Cinema_Ticket.Where(r => r.id == id_tick).SingleOrDefault();
        //        if (ticket != null)
        //        {
        //            json = JsonConvert.SerializeObject(ticket, Formatting.Indented,
        //                          new JsonSerializerSettings()
        //                          {
        //                              ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
        //                          });
        //        }
        //        else
        //        {
        //            msg.code = 1;
        //            msg.msg = "ticket khong ton tai";
        //            json = JsonConvert.SerializeObject(msg, Formatting.Indented,
        //                          new JsonSerializerSettings()
        //                          {
        //                              ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
        //                          });
        //        }
        //        return json;
        //    }
        //}
        #endregion

        #region quản lý phim

        public ViewResult Film_Management()
        {
            Get_NeededIn4();
            return View();
        }

        //get all needed info
        public void Get_NeededIn4()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                //type film
                var list_typefilm = db.Cinema_TypeFilm.ToList();
                ViewBag.typefilm = list_typefilm;

            }
        }

        public string Get_film_data()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                var film = db.View_get_film_data.ToList();
                string json_result = JsonConvert.SerializeObject(film, Formatting.Indented,
                                new JsonSerializerSettings()
                                {
                                    ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                                });
                return json_result;
            }
        }

        public string get_info_film()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                string json_result = "";
                Services_1 msg = new Services_1();
                int id_film = Int32.Parse(Request.Form["id_film"]);
                var film = db.Cinema_Film.Where(r => r.id == id_film).SingleOrDefault();
                if (film != null)
                {
                    json_result = JsonConvert.SerializeObject(film, Formatting.Indented,
                                new JsonSerializerSettings()
                                {
                                    ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                                });
                }
                return json_result;
            }
        }

        public string Save_film()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                Services_1 msg = new Services_1();
                int id = Int32.Parse(Request.Form["id_film"]);
                string des_film = Request.Form["des"];
                string name_film = Request.Form["name"];
                var type_film = Request.Form["type_film"].ToCharArray();
                List<int> typefilm_list = new List<int>();
                string temp = ""; //luu ten type film
                string temp2 = "";                   // luu id type film
                foreach (var item in type_film)
                {
                    int n = 0;
                    string Char = item.ToString();
                    if (Int32.TryParse(Char, out n))
                    {
                        int result = Int32.Parse(Char);
                        typefilm_list.Add(result);
                    }
                }
                foreach (var item in typefilm_list)
                {
                    var name_typefilm = db.Cinema_TypeFilm.Where(r => r.id == item).SingleOrDefault();
                    if (name_typefilm != null)
                    {
                        temp += name_typefilm.name + ",";
                        temp2 += item + ",";
                    }
                }
                var film = db.Cinema_Film.Where(r => r.id == id).SingleOrDefault();
                if (film != null)
                {
                    film.name = name_film;
                    film.id_type_film = temp2;
                    film.name_type_film = temp;
                    db.SaveChanges();
                    msg.code = 1;
                    msg.msg = "Luu thanh cong film " + name_film;
                }
                else
                {
                    Cinema_Film film_added = new Cinema_Film();
                    film_added.name = name_film;
                    film_added.id_type_film = temp2;
                    film_added.name_type_film = temp;
                    film_added.created_date = DateTime.Now;
                    film_added.description = des_film;
                    db.Cinema_Film.Add(film_added);
                    db.SaveChanges();
                    msg.code = 1;
                    msg.msg = "Luu thanh cong film " + name_film;
                }
                string json_result = JsonConvert.SerializeObject(msg, Formatting.Indented,
                                new JsonSerializerSettings()
                                {
                                    ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                                }); ;
                return json_result;
            }
        }

        public string delete_film()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                Services_1 msg = new Services_1();
                string json_return = "";
                int id_film = Int32.Parse(Request.Form["id_film"].ToString());
                var check = db.Cinema_Film.Where(r => r.id == id_film).SingleOrDefault();
                if (check != null)
                {
                    db.Cinema_Film.Remove(check);
                    db.SaveChanges();
                    msg.code = 0;
                    msg.msg = "Thanh cong";
                }
                else
                {
                    msg.code = 1;
                    msg.msg = "Xoa that bai";
                }
                json_return = JsonConvert.SerializeObject(msg);
                return json_return;
            }
        }
        #endregion

        #region quản lý thực phẩm

        public ViewResult Popcorn_Magement()
        {
            //Get_NeededIn4_Pop();
            return View();
        }

        public string Get_pop_data()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                var film = db.View_get_pop_data.ToList();
                string json_result = JsonConvert.SerializeObject(film, Formatting.Indented,
                                new JsonSerializerSettings()
                                {
                                    ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                                });
                return json_result;
            }
        }

        public string get_info_pop()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                string json_result = "";
                Services_1 msg = new Services_1();
                int id_pop = Int32.Parse(Request.Form["id_pop"]);
                var pop = db.Cinema_Popcorn.Where(r => r.id == id_pop).SingleOrDefault();
                if (pop != null)
                {
                    json_result = JsonConvert.SerializeObject(pop, Formatting.Indented,
                                new JsonSerializerSettings()
                                {
                                    ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                                });
                }
                return json_result;
            }
        }

        public string delete_pop()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                Services_1 msg = new Services_1();
                string json_return = "";
                int id_pop = Int32.Parse(Request.Form["id_pop"].ToString());
                var check = db.Cinema_Popcorn.Where(r => r.id == id_pop).SingleOrDefault();
                if (check != null)
                {
                    db.Cinema_Popcorn.Remove(check);
                    db.SaveChanges();
                    msg.code = 0;
                    msg.msg = "Thanh cong";
                }
                else
                {
                    msg.code = 1;
                    msg.msg = "Xoa that bai";
                }
                json_return = JsonConvert.SerializeObject(msg);
                return json_return;
            }
        }

        public string Save_pop()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                Services_1 msg = new Services_1();
                int id = Int32.Parse(Request.Form["id_pop"]);
                string des_pop = Request.Form["des"];
                int ammount = Int32.Parse(Request.Form["amm"]);
                string name_pop = Request.Form["name"];
                var pop = db.Cinema_Popcorn.Where(r => r.id == id).SingleOrDefault();
                if (pop != null)
                {
                    pop.name = name_pop;
                    pop.ammount = ammount;
                    pop.description = des_pop;
                    db.SaveChanges();
                    msg.code = 1;
                    msg.msg = "Luu thanh cong film " + name_pop;
                }
                else
                {
                    Cinema_Popcorn pop_added = new Cinema_Popcorn();
                    pop_added.name = name_pop;
                    pop_added.ammount = ammount;
                    pop_added.description = des_pop;
                    db.Cinema_Popcorn.Add(pop_added);
                    db.SaveChanges();
                    msg.code = 1;
                    msg.msg = "Luu thanh cong film " + name_pop;
                }
                string json_result = JsonConvert.SerializeObject(msg, Formatting.Indented,
                                new JsonSerializerSettings()
                                {
                                    ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                                }); ;
                return json_result;
            }
        }

        //private void Get_NeededIn4_Pop()
        //{
        //    using (CinemaEntities db = new CinemaEntities())
        //    {
        //        var data = db.View_get_pop_data.ToList();
        //        ViewBag.pop = data;
        //    }
        //}

        #endregion

        #region quản lý nhân viên

        public ViewResult Staff_Management()
        {
            Get_type_staff();
            return View();
        }

        private void Get_type_staff()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                //get all needed info
                //type staff
                var list_typestaff = db.Cinema_Type_Staff.ToList();
                ViewBag.typestaff = list_typestaff;
            }
        }

        public string Get_staff_data()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                var film = db.View_get_staff.ToList();
                string json_result = JsonConvert.SerializeObject(film, Formatting.Indented,
                                new JsonSerializerSettings()
                                {
                                    ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                                });
                return json_result;
            }
        }

        public string Get_staff2_data()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                var film = db.View_get_staff_info.ToList();
                string json_result = JsonConvert.SerializeObject(film, Formatting.Indented,
                                new JsonSerializerSettings()
                                {
                                    ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                                });
                return json_result;
            }
        }

        public string get_info_staff()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                string json_result = "";
                Services_1 msg = new Services_1();
                int id_staff = Int32.Parse(Request.Form["id_staff"]);
                var staff = db.Cinema_Staff.Where(r => r.id == id_staff).SingleOrDefault();
                if (staff != null)
                {
                    json_result = JsonConvert.SerializeObject(staff, Formatting.Indented,
                                new JsonSerializerSettings()
                                {
                                    ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                                });
                }
                return json_result;
            }
        }

        public string delete_staff()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                Services_1 msg = new Services_1();
                string json_return = "";
                int id_staff = Int32.Parse(Request.Form["id_staff"].ToString());
                var check = db.Cinema_Staff.Where(r => r.id == id_staff).SingleOrDefault();
                if (check != null)
                {
                    check.status = "Deactived";
                    db.SaveChanges();
                    msg.code = 0;
                    msg.msg = "Thanh cong";
                }
                else
                {
                    msg.code = 1;
                    msg.msg = "Xoa that bai";
                }
                json_return = JsonConvert.SerializeObject(msg);
                return json_return;
            }
        }

        public string Save_staff()
        {
            using (CinemaEntities db = new CinemaEntities())
            {
                Services_1 msg = new Services_1();
                int id = Int32.Parse(Request.Form["id_staff"]);
                int type_staff = Int32.Parse(Request.Form["type_staff"]);
                int phone = Int32.Parse(Request.Form["phone"]);
                string address = Request.Form["address"];
                string name_staff = Request.Form["name"];
                var staff = db.Cinema_Staff.Where(r => r.id == id).SingleOrDefault();
                if (staff != null)
                {
                    staff.name = name_staff;
                    staff.phone = phone;
                    staff.type_staff = type_staff;
                    staff.address = address;
                    staff.status = "Active";
                    db.SaveChanges();
                    msg.code = 1;
                    msg.msg = "Luu thanh cong nhân viên " + name_staff;
                }
                else
                {
                    Cinema_Staff staff_added = new Cinema_Staff();
                    staff_added.name = name_staff;
                    staff_added.phone = phone;
                    staff_added.type_staff = type_staff;
                    staff_added.address = address;
                    staff_added.status = "Active";
                    db.Cinema_Staff.Add(staff_added);
                    db.SaveChanges();
                    msg.code = 1;
                    msg.msg = "Luu thanh cong nhân viên " + name_staff;
                }
                string json_result = JsonConvert.SerializeObject(msg, Formatting.Indented,
                                new JsonSerializerSettings()
                                {
                                    ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                                }); ;
                return json_result;
            }
        }


        #endregion

        #region quản lý công

        public ViewResult WKP_Management() { return View(); }

        #endregion
    }
}