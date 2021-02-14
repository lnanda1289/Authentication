using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Authentication.Controllers
{
    public class ErrorController : Controller
    {
        // GET: Error
        public ActionResult Error(String message)
        {
            ViewBag.Error = message;
            return View();
        }
    }
}