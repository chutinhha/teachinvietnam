using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace tjadmin.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Welcome to TeachinVietnam Admin Area!";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
