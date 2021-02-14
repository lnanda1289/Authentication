using Authentication.Filters;
using Authentication.Models;
using System.Web.Mvc;


namespace Authentication.Controllers
{
    public class HomeController : Controller
    {
        [Authorization(idOperation:1)]
        public ActionResult Index()
        {
            Users user = (Users)Session["User"];
            return View(user);
        }

        [Authorization(idOperation: 1)]
        public ActionResult About()
        {
            ViewBag.Message = "Gestión de acceso";
            return View();
        }

        [Authorization(idOperation: 1)]
        public ActionResult Contact()
        {
            ViewBag.Message = "Luisa Fernanda Mosquera";
            return View();
        }
    }
}