using BTL.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL.Models;
namespace BTL.DAO
{
    public class DanhMucSanPhamDAO
    {
        ApplicationDbContext db = null;
        private static DanhMucSanPhamDAO instance;
        static object key = new object();
        public static DanhMucSanPhamDAO Instance
        {
            get
            {
                if (instance == null)
                {
                    lock (key)//bất đồng bộ , chiếm dụng tài nguyên....
                    {
                        instance = new DanhMucSanPhamDAO();
                    }
                }
                return instance;
            }
        }
        public DanhMucSanPhamDAO()
        {
            db = new ApplicationDbContext();
        }
        public long Insert(DanhMuc danhMucSanPham)
        {
            db.DanhMucs.Add(danhMucSanPham);
            db.SaveChanges();
            return danhMucSanPham.DanhMucID;
        }

        public bool Update (DanhMuc entity)
        {
            try
            {
                var danhMucSanPham = db.DanhMucs.Find(entity.DanhMucID);
                db.Entry(entity).State = System.Data.Entity.EntityState.Modified;   
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
                var danhMucSanPham = db.DanhMucs.Find(id);
                db.DanhMucs.Remove(danhMucSanPham);
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public IEnumerable<DanhMuc> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<DanhMuc> model = db.DanhMucs;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenDanhMuc.Contains(searchString));

            }
            return model.OrderByDescending(x => x.DanhMucID).ToPagedList(page, pageSize);
        }

        public List<DanhMuc> ListAll()
        {
            return db.DanhMucs.ToList();
        }

        public DanhMuc ViewDetail(long id)
        {
            return db.DanhMucs.Find(id);
        }
    }
}