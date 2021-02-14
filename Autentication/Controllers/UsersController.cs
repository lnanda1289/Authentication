using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Authentication.Filters;
using Authentication.Models;

namespace Authentication.Controllers
{
    public class UsersController : Controller
    {
        private DBAuthenticationEntities db = new DBAuthenticationEntities();

        [Filters.Authorization(idOperation: 2)]
        public ActionResult Index(string sortOrder, string searchName, string searchRol)
        {
            ViewBag.UserSortParm = String.IsNullOrEmpty(sortOrder) ? "user_desc" : "";
            ViewBag.RolSortParm = sortOrder == "Rol" ? "rol_desc" : "Rol";
            var users = db.Users.Include(u => u.Roles);
            if (!String.IsNullOrEmpty(searchName))
            {
                users = users.Where(s => s.User.Contains(searchName)
                                       || s.Roles.Name.Contains(searchName));
            }
            if (!String.IsNullOrEmpty(searchRol))
            {
                users = users.Where(s => s.User.Contains(searchRol)
                                       || s.Roles.Name.Contains(searchRol));
            }
            switch (sortOrder)
            {
                case "user_desc":
                    users = users.OrderByDescending(u => u.User);
                    break;
                case "Rol":
                    users = users.OrderBy(s => s.Roles.Name);
                    break;
                case "rol_desc":
                    users = users.OrderByDescending(s => s.Roles.Name);
                    break;
                default:
                    users = users.OrderBy(s => s.User);
                    break;
            }
            return View(users.ToList());
        }

        // GET: Users/Details/5
        [Filters.Authorization(idOperation: 2)]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Users users = db.Users.Find(id);
            if (users == null)
            {
                return HttpNotFound();
            }
            return View(users);
        }

        // GET: Users/Create
        [Filters.Authorization(idOperation: 5)]
        public ActionResult Create()
        {
            ViewBag.IdRol = new SelectList(db.Roles, "Id", "Name");
            return View();
        }

        // POST: Users/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Filters.Authorization(idOperation: 5)]
        public ActionResult Create([Bind(Include = "Id,User,Password,CompletNames,Address,Phone,Email,Age,IdRol")] Users users)
        {
            if (ModelState.IsValid)
            {
                db.Users.Add(users);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdRol = new SelectList(db.Roles, "Id", "Name", users.IdRol);
            return View(users);
        }

        // GET: Users/Edit/5
        [Filters.Authorization(idOperation: 4)]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Users users = db.Users.Find(id);
            if (users == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdRol = new SelectList(db.Roles, "Id", "Name", users.IdRol);
            return View(users);
        }

        // POST: Users/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Filters.Authorization(idOperation: 4)]
        public ActionResult Edit([Bind(Include = "Id,User,Password,CompletNames,Address,Phone,Email,Age,IdRol")] Users users)
        {
            if (ModelState.IsValid)
            {
                db.Entry(users).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdRol = new SelectList(db.Roles, "Id", "Name", users.IdRol);
            return View(users);
        }

        // GET: Users/Delete/5
        [Filters.Authorization(idOperation: 6)]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Users users = db.Users.Find(id);
            if (users == null)
            {
                return HttpNotFound();
            }
            return View(users);
        }

        // POST: Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Filters.Authorization(idOperation: 6)]
        public ActionResult DeleteConfirmed(int id)
        {
            Users users = db.Users.Find(id);
            db.Users.Remove(users);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
