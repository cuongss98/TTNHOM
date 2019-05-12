using BTL.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL.Areas.Admin.Controllers
{
    public class AdminController : BaseController
    {
        // GET: Admin/Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult LogOut()
        {
            Session[CommonConstant.Admin_SESSION] = null;
            return RedirectToAction("index");
        }
    }
}