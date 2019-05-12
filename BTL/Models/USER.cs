namespace BTL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("USER")]
    public partial class USER
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public USER()
        {
            XuatKhoes = new HashSet<XuatKho>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int UserID { get; set; }
        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Yêu cầu nhập mật khẩu")]
        [StringLength(15)]
        public string Password { get; set; }
        [Display(Name = "Tên tài khoản")]
        [Required(ErrorMessage = "Yêu cầu nhập Tên tài khoản")]
        [StringLength(50)]
        public string UserName { get; set; }
        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Yêu cầu nhập mật khẩu")]
        [StringLength(13)]
        public string SDT { get; set; }

        [StringLength(30)]
        public string email { get; set; }

        [StringLength(50)]
        public string DiaChi { get; set; }

        [StringLength(200)]
        public string PasswordSalt { get; set; }

        public int? GroupID { get; set; }

        public bool Status { get; set; }

        public virtual UserGroup UserGroup { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<XuatKho> XuatKhoes { get; set; }
    }
}
