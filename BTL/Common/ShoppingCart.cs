using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL.Models;
namespace BTL.Common
{
    public class ShoppingCart
    {
        public List<ShoppingCartItem> lstItems = new List<ShoppingCartItem>();
        public void Add(int ID)
        {
            var obj= lstItems.Where(x => x.SanPhamID == ID).SingleOrDefault();
            if(obj!=null)
            {
                obj.SoLuong += 1;
            }
            else
            {
                ApplicationDbContext _context = new ApplicationDbContext();
                var item = _context.SanPhams.Find(ID);
                ShoppingCartItem shopping = new ShoppingCartItem();
                shopping.HinhAnh = item.HinhAnh;
                shopping.TenSanPham = item.TenSanPham;
                shopping.SoLuong = 1;
                shopping.Giá = item.Giá;
                shopping.SanPhamID = item.SanPhamID;
                lstItems.Add(shopping);
            }
        }
        public void Delete(int ID)
        {
            var item = lstItems.Where(x => x.SanPhamID == ID).SingleOrDefault();
            if(item!=null)
            {
                if(item.SoLuong>1)
                {
                    item.SoLuong = item.SoLuong - 1;
                }
                else
                {
                    lstItems.Remove(item);
                }
            }
        }
        public void EmtyCart()
        {
            lstItems.Clear();
        }
        public decimal? TongTien()
        {
            decimal? sum = 0;
            foreach(ShoppingCartItem x in lstItems)
            {
                sum += x.ThanhTien();
            }
            return sum;
        }
    }
}