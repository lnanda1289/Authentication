using System.Web;
using System.Web.Mvc;
using Authentication.Controllers;
using Authentication.Models;

namespace Authentication.Filters
{
    public class VerifyAccess : ActionFilterAttribute
    {
        private Users oUsuario;

        /// <summary>
        /// Valida que el usuario haya iniciado sesión para acceder al sitio, de lo contrario
        /// lo regresa a la vista de inicio de sesión
        /// </summary>
        /// <param name="filterContext"></param>
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            base.OnActionExecuting(filterContext);
            oUsuario = (Users) HttpContext.Current.Session["User"];
            if(oUsuario == null)
            {
                if(filterContext.Controller is LoginController == false)
                {
                    filterContext.HttpContext.Response.Redirect("/Login/Login");
                }
            }
        }
    }
}