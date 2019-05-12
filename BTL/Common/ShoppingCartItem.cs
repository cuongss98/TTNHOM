using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BTL.Common
{
    public class ShoppingCartItem
    {
        [Key]
        public int SanPhamID { get; set; }
        [StringLength(50)]
        public string TenSanPham { get; set; }

        [StringLength(30)]
        public string HinhAnh { get; set; }

        [Column(TypeName = "money")]
        public decimal? Giá { get; set; }
        public int SoLuong { get; set; }
        public decimal? ThanhTien()
        {
            return SoLuong * Giá;
        }
    }
}