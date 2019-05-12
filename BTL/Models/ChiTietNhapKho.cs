namespace BTL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietNhapKho")]
    public partial class ChiTietNhapKho
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ChiTietNhapKhoID { get; set; }

        public int? NhapKhoID { get; set; }

        public int? SanPhamID { get; set; }

        public int? SoLuong { get; set; }

        public virtual NhapKho NhapKho { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
