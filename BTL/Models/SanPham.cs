namespace BTL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            ChiTietNhapKhoes = new HashSet<ChiTietNhapKho>();
            ChiTietXuatKhoes = new HashSet<ChiTietXuatKho>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SanPhamID { get; set; }

        public int? DanhMucID { get; set; }

        public int? KhuyenMaiID { get; set; }

        [StringLength(50)]
        [Display(Name="Tên Sản Phẩm")]
        public string TenSanPham { get; set; }

        [StringLength(30)]
        public string HinhAnh { get; set; }

        [Column(TypeName = "money")]
        [Display(Name ="Giá")]
        public decimal? Giá { get; set; }

        [StringLength(100)]
        public string Model { get; set; }

        [StringLength(50)]
        public string CPU { get; set; }

        [StringLength(50)]
        public string CPUSpeed { get; set; }

        [StringLength(50)]
        public string HDisk { get; set; }

        [StringLength(50)]
        [Display(Name ="Kích Thước Màn")]
        public string KickThuocMan { get; set; }

        [StringLength(50)]
        [Display(Name = "Độ Phân Giải")]
        public string DoPhanGiai { get; set; }
        [Display(Name = "Trọng Lượng")]
        public double? TrongLuong { get; set; }

        [StringLength(50)]
        public string Ram { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietNhapKho> ChiTietNhapKhoes { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietXuatKho> ChiTietXuatKhoes { get; set; }

        public virtual DanhMuc DanhMuc { get; set; }

        public virtual KhuyenMai KhuyenMai { get; set; }
    }
}
