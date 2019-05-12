using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL.Common;
using BTL.Models;
namespace BTL.Controllers
{
    public class HomeController : Controller
    {
        private ApplicationDbContext _context;
        public  HomeController()
        {
            _context = new ApplicationDbContext();
        }
        public void createSessionCart()
        {
            var sessionCart = new ShoppingCart();
            Session.Add(CommonConstant.CartSession, sessionCart);
        }
        public ActionResult Index()
        {
            var sessioncart =(ShoppingCart)Session[CommonConstant.CartSession];
            if(sessioncart == null)
            {
                createSessionCart();
            }
            var DsSanPham = _context.SanPhams;
            return View(DsSanPham);
        }
        public ActionResult LienHe()
        {
            return View();
        }
        //[HttpGet]
        public ActionResult ChiTietSanPham(int Id)
        {
            SanPham sp = _context.SanPhams.Find(Id);
            return View(sp);
        }
        public ActionResult DatHang()
        {
            return View();
        }
        public ActionResult ThanhToan()
        {
            return View();
        }
        [ChildActionOnly]
        public ActionResult DanhMuc()
        {
            var dsDanhMuc = _context.DanhMucs;
            return PartialView(dsDanhMuc);
        }
        public ActionResult TimKiemTheoDanhMuc(int Id)
        {
            var models = _context.SanPhams.Where(x => x.DanhMucID == Id).ToList();
            return View("Index", models);
        }
        [HttpPost]
        public ActionResult TimKiem(string searchString)
        {
            if(string.IsNullOrEmpty(searchString))
            {
                return RedirectToAction("Index","Home");
            }
            var obj = _context.SanPhams.Where(x => x.TenSanPham.Contains(searchString)).ToList();
            return View("Index", obj);
        }
    }
}