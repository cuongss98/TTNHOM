namespace BTL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietXuatKho")]
    public partial class ChiTietXuatKho
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ChiTietXuatKhoID { get; set; }

        public int? XuatKhoID { get; set; }

        public int? SanPhamID { get; set; }

        public int? SoLuong { get; set; }

        [Column(TypeName = "money")]
        public decimal? TongTien { get; set; }

        public virtual SanPham SanPham { get; set; }

        public virtual XuatKho XuatKho { get; set; }
    }
}
