using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL.Common;
using BTL.Models;
namespace BTL.Controllers
{
    public class ShopCartController : Controller
    {
       
        public void createSessionCart()
        {
            var sessionCart = new ShoppingCart();
            Session.Add(CommonConstant.CartSession, sessionCart);
            
        }
        public ActionResult Index()
        {
          var  session = (ShoppingCart)Session[CommonConstant.CartSession];
            if (session==null)
            {
                createSessionCart();
            }
            return View(session);
        }
        public ActionResult ThemSp(int id)
        {
           var session = (ShoppingCart)Session[CommonConstant.CartSession];
            if (session==null)
            {
                createSessionCart();
            }
            session.Add(id);
            return RedirectToAction("Index", "Home");
        }
        public ActionResult XoaSp(int id)
        {
            var session = (ShoppingCart)Session[CommonConstant.CartSession];
            if (session == null)
            {
                createSessionCart();
            }
            session.Delete(id);
            return RedirectToAction("Index", "ShopCart");
        }
        public ActionResult ThanhToan()
        {
            var sessionCart = (ShoppingCart)Session[CommonConstant.CartSession];
            var sessionUser = (UserLogin)Session[CommonConstant.USER_SESSION];
            ApplicationDbContext context = new ApplicationDbContext();
            List<ChiTietXuatKho> lstXuatKho = new List<ChiTietXuatKho>();
            foreach(ShoppingCartItem x in sessionCart.lstItems)
            {
                ChiTietXuatKho chiTietXuatKho = new ChiTietXuatKho();
                chiTietXuatKho.ChiTietXuatKhoID = 0;
                chiTietXuatKho.SanPhamID = x.SanPhamID;
                chiTietXuatKho.SoLuong = x.SoLuong;
                chiTietXuatKho.TongTien = x.ThanhTien();
                lstXuatKho.Add(chiTietXuatKho);
            }
            XuatKho xuatKho = new XuatKho()
            {
                XuatKhoID = 0,
                UserID = (int)sessionUser.UserID,
                ChiTietXuatKhoes = lstXuatKho,
                NgayXuat = DateTime.UtcNow
            };
            context.XuatKhoes.Add(xuatKho);
            context.SaveChanges();
            context.Dispose();
            sessionCart.EmtyCart();
            return RedirectToAction("Index", "Home");
        }
    }
}