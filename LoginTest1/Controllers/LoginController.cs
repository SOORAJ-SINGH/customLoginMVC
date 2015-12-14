using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace LoginTest1.Controllers
{
    public class LoginController : Controller
    {
        RoleDbContext db = new RoleDbContext();
        // GET: Login
        public ActionResult Index(string username,string password)
        {
            if (username != null && password != null)
            {
                var user = db.Tbl_User.Where(x => x.UserName == username && x.Password == password).ToList();
                
                if (user != null)
                {
                    if (user.Count == 1)
                    {
                        FormsAuthentication.SetAuthCookie(username, true);
                        return RedirectToAction("Home", "Login");
                    }
                }
            }
            return View();
        }

        [Authorize(Roles ="Admin")]
        public ActionResult Admin()
        {
            return View();
        }

        [Authorize(Roles = "Admin,PC")]
        public ActionResult Home()
        {
            return View();
        }



        public void Logout()
        {
            FormsAuthentication.SignOut();

            //Session.Clear();  // This may not be needed -- but can't hurt
            //Session.Abandon();

            //// Clear authentication cookie
            //HttpCookie rFormsCookie = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            //rFormsCookie.Expires = DateTime.Now.AddYears(-1);
            //Response.Cookies.Add(rFormsCookie);

            //// Clear session cookie 
            //HttpCookie rSessionCookie = new HttpCookie("ASP.NET_SessionId", "");
            //rSessionCookie.Expires = DateTime.Now.AddYears(-1);
            //Response.Cookies.Add(rSessionCookie);

            FormsAuthentication.RedirectToLoginPage();
        }
    }
}