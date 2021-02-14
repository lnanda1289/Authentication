using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Authentication.Models;

namespace Authentication.Filters
{
    [AttributeUsage(AttributeTargets.Method, AllowMultiple = false)]
    public class Authorization : AuthorizeAttribute
    {
        private Users user;
        private int idOperation;

        public Authorization(int idOperation)
        {
            this.idOperation = idOperation;
        }
        /// <summary>
        /// Funcion encargada de autorizar al usuario logeado el uso de una
        /// operación segun el rol que este tenga y los permisos dados al mismo
        /// </summary>
        /// <param name="filterContext"></param>
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            string nameOperation = String.Empty;

            user = (Users)HttpContext.Current.Session["User"];
            if (user != null)
            {
                using (DBAuthenticationEntities db = new DBAuthenticationEntities())
                {
                    var permissionsList = from p in db.Permissions
                                          where p.IdRol == user.IdRol && p.IdOperation == idOperation
                                          select p;
                    if (permissionsList.ToList().Count() == 0)
                    {
                        var operation = db.Operations.Find(idOperation);
                        string message = "Usted no esta autorizado para " + operation.Name;
                        filterContext.Result = new RedirectResult("/Error/Error?message=" + message);
                    }
                }
            }
        }
    }
}