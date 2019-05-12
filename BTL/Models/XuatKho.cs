namespace BTL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("XuatKho")]
    public partial class XuatKho
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public XuatKho()
        {
            ChiTietXuatKhoes = new HashSet<ChiTietXuatKho>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int XuatKhoID { get; set; }

        public int? UserID { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayXuat { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietXuatKho> ChiTietXuatKhoes { get; set; }

        public virtual USER USER { get; set; }
    }
}
