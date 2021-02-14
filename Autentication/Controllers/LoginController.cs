using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Authentication.Models;

namespace Authentication.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Users objUser)
        {
            if (ModelState.IsValid)
            {
                using (DBAuthenticationEntities db = new DBAuthenticationEntities())
                {
                    var obj = db.Users.Where(a => a.User.Equals(objUser.User) && a.Password.Equals(objUser.Password)).FirstOrDefault();
                    if (obj != null)
                    {
                        obj.Roles = db.Roles.Find(obj.IdRol);
                        Session["User"] = obj;
                        Session["UserName"] = obj.CompletNames +", "+obj.Roles.Name+ ", "+ obj.User;
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        ViewBag.Error = "Verifique su usuario y contraseña";
                    }
                }
            }
            return View(objUser);
        }

        public ActionResult Logout()
        {
            Session["User"] = null;
            Session["UserName"] = "";
            return RedirectToAction("Login");
        }
    }
}