using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL.Models;
using BTL.ViewModel;

namespace BTL.DAO
{
    public class ProductDAO
    {
        ApplicationDbContext db = null;
        private static ProductDAO instance;
        static object key = new object();
        public static ProductDAO Instance
        {
            get
            {
                if (instance == null)
                {
                    lock (key)//bất đồng bộ , chiếm dụng tài nguyên....
                    {
                        instance = new ProductDAO();
                    }
                }
                return instance;
            }
        }
        public ProductDAO()
        {
            db = new ApplicationDbContext();
        }

        public long Insert(SanPham entity)
        {
            db.SanPhams.Add(entity);
            db.SaveChanges();
            return entity.SanPhamID;
        }
        public List<string> ListName(string keyword)
        {
            return db.SanPhams.Where(x => x.TenSanPham.Contains(keyword)).Select(x => x.TenSanPham).ToList();
        }
        public IEnumerable<SanPham> ListAllpaging (string searchString, int page, int pageSize)
        {
            IQueryable<SanPham> model = db.SanPhams;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenSanPham.Contains(searchString));
            }
            return model.OrderByDescending(x => x.TenSanPham).ToPagedList(page, pageSize);
        }

        /// <summary>
        /// Get list product by category
        /// </summary>
        /// <param name="sanPhamID"></param>
        /// <returns></returns>
        public List<SanPhamViewModel> ListByCategoryId(int danhMucSanPhamID, ref int totalRecord, int pageIndex = 1, int pageSize = 2)
        {
            totalRecord = db.SanPhams.Where(x => x.SanPhamID == danhMucSanPhamID).Count();
            var model = (from a in db.SanPhams
                         join b in db.DanhMucs
                         on a.DanhMucID equals b.DanhMucID
                         where a.DanhMucID == danhMucSanPhamID
                         select new
                         {
                             TenDanhMucSanPham = b.TenDanhMuc,                         
                             SanPhamID = a.SanPhamID,
                             AnhSanPham = a.HinhAnh,
                             TenSanPham = a.TenSanPham,
                             GiaSanPham = a.Giá
                         }).AsEnumerable().Select(x => new SanPhamViewModel()
                         {
                             TenDanhMucSanPham = x.TenDanhMucSanPham,                       
                             SanPhamID = x.SanPhamID,
                             AnhSanPham = x.AnhSanPham,
                             TenSanPham = x.TenSanPham,                         
                             GiaSanPham = x.GiaSanPham,
                         });
            //return model.OrderByDescending(x => x.DanhMucID).ToPagedList(page, pageSize);
            model.OrderByDescending(x => x.TenSanPham).Skip((pageIndex - 1) * pageSize).Take(pageSize);
            return model.ToList();
        }
        public List<SanPhamViewModel> Search(string keyword, ref int totalRecord, int pageIndex = 1, int pageSize = 2)
        {
            totalRecord = db.SanPhams.Where(x => x.TenSanPham == keyword).Count();
            var model = (from a in db.SanPhams
                         join b in db.DanhMucs
                         on a.DanhMucID equals b.DanhMucID
                         where a.TenSanPham.Contains(keyword)
                         select new
                         {
                             TenDanhMucSanPham = b.TenDanhMuc,
                             SanPhamID = a.SanPhamID,
                             AnhSanPham = a.HinhAnh,
                             TenSanPham = a.TenSanPham,
                             GiaSanPham = a.Giá
                         }).AsEnumerable().Select(x => new SanPhamViewModel()
                         {
                             TenDanhMucSanPham = x.TenDanhMucSanPham,                   
                             SanPhamID = x.SanPhamID,
                             AnhSanPham = x.AnhSanPham,
                             TenSanPham = x.TenSanPham,
                             GiaSanPham = x.GiaSanPham
                         });
            model.OrderByDescending(x => x.TenSanPham).Skip((pageIndex - 1) * pageSize).Take(pageSize);
            return model.ToList();
        }
        /// <summary>


        public bool Update(SanPham entity)
        {   
            try
            {
                var obj = db.SanPhams.Find(entity.SanPhamID);
                obj.TenSanPham = entity.TenSanPham;
                obj.CPU = entity.CPU;
                obj.DoPhanGiai = entity.DoPhanGiai;
                obj.KickThuocMan = entity.KickThuocMan;
                obj.TrongLuong = entity.TrongLuong;
                obj.Giá = entity.Giá;
                db.Entry(obj).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool Delete(int id)
        {
            try
            {
                var sanPham = db.SanPhams.Find(id);
                db.SanPhams.Remove(sanPham);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public SanPham ViewDetail(int sanPhamID)
        {
            return db.SanPhams.Find(sanPhamID);
        }
    }
}