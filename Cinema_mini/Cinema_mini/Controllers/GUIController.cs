using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Cinema_mini.Controllers
{
    public class GUIController : Controller
    {
        // GET: GUI
        public ActionResult Index()
        {
            return View();
        }
        public ViewResult Main()
        {
            return View();
        }
    }
}