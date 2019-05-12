namespace BTL.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext()
            : base("name=ApplicationDbContext")
        {
        }

        public virtual DbSet<ADMIN> ADMINs { get; set; }
        public virtual DbSet<ChiTietNhapKho> ChiTietNhapKhoes { get; set; }
        public virtual DbSet<ChiTietXuatKho> ChiTietXuatKhoes { get; set; }
        public virtual DbSet<DanhMuc> DanhMucs { get; set; }
        public virtual DbSet<KhuyenMai> KhuyenMais { get; set; }
        public virtual DbSet<NhapKho> NhapKhoes { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<SanPham> SanPhams { get; set; }
        public virtual DbSet<USER> USERs { get; set; }
        public virtual DbSet<UserGroup> UserGroups { get; set; }
        public virtual DbSet<XuatKho> XuatKhoes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ADMIN>()
                .Property(e => e.TenDangNhap)
                .IsFixedLength();

            modelBuilder.Entity<ChiTietXuatKho>()
                .Property(e => e.TongTien)
                .HasPrecision(19, 4);

            modelBuilder.Entity<DanhMuc>()
                .Property(e => e.TenDanhMuc)
                .IsFixedLength();

            modelBuilder.Entity<SanPham>()
                .Property(e => e.TenSanPham)
                .IsFixedLength();

            modelBuilder.Entity<SanPham>()
                .Property(e => e.HinhAnh)
                .IsFixedLength();

            modelBuilder.Entity<SanPham>()
                .Property(e => e.Giá)
                .HasPrecision(19, 4);

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.ChiTietXuatKhoes)
                .WithOptional(e => e.SanPham)
                .HasForeignKey(e => e.XuatKhoID);

            modelBuilder.Entity<USER>()
                .Property(e => e.Password)
                .IsFixedLength();

            modelBuilder.Entity<USER>()
                .Property(e => e.SDT)
                .IsFixedLength();

            modelBuilder.Entity<USER>()
                .Property(e => e.email)
                .IsFixedLength();

            modelBuilder.Entity<UserGroup>()
                .Property(e => e.GroupName)
                .IsFixedLength();

            modelBuilder.Entity<UserGroup>()
                .HasMany(e => e.USERs)
                .WithOptional(e => e.UserGroup)
                .HasForeignKey(e => e.GroupID);
        }
    }
}
