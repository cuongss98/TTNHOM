using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL.ViewModel
{
    public class SanPhamViewModel
    {
        public int SanPhamID { set; get; }
        public string AnhSanPham { set; get; }
        public string MaSanPham { set; get; }
        public string TenSanPham { set; get; }
        public decimal? GiaSanPham { set; get; }
        public string TenDanhMucSanPham { set; get; }      
    }
}