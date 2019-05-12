namespace BTL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ADMIN")]
    public partial class ADMIN
    {
        [Key]
        [StringLength(10)]
        public string TenDangNhap { get; set; }

        [StringLength(50)]
        public string Password { get; set; }

        public int? RoleID { get; set; }

        public virtual Role Role { get; set; }
    }
}
