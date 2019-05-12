using BTL.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL.Common;

namespace BTL.DAO
{
    public class UserDAO
    {
        ApplicationDbContext db = null;
        private static UserDAO instance;
        static object key = new object();
        public static UserDAO Instance
        {
            get
            {
                if (instance == null)
                {
                    lock (key)//bất đồng bộ , chiếm dụng tài nguyên....
                    {
                        instance = new UserDAO();
                    }
                }
                return instance;
            }
        }
        public UserDAO() { db = new ApplicationDbContext(); }
        public long Insert(USER entity)
        {
            db.USERs.Add(entity);
            db.SaveChanges();
            return entity.UserID;
        }
        public long InsertForFacebook(USER entity)
        {
            var user = db.USERs.SingleOrDefault(x => x.UserName == entity.UserName);
            if(user == null)
            {
                db.USERs.Add(entity);
                db.SaveChanges();
                return entity.UserID;
            }
            else 
                return user.UserID;
        }
        public bool Update(USER entity)
        {
            try
            {
                db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }

        public IEnumerable<USER> ListAllPaging(string searchString, int page, int pageSize,int Group)
        {
            IQueryable<USER> model = db.USERs.Where(x => x.GroupID ==Group);
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString) || x.email.Contains(searchString));
            }

            return model.OrderByDescending(x => x.UserID).ToPagedList(page, pageSize);
        }

        public USER GetByID(string userName)
        {
            return db.USERs.SingleOrDefault(x => x.UserName == userName);
        }
        public USER ViewDetail(int id)
        {
            return db.USERs.Find(id);
        }
        public int Login(string userName, string passWordSalt, bool isLoginAdmin = false)
        {
            var result = db.USERs.SingleOrDefault(x => x.UserName == userName);
            if(result == null)
            {
                return 0;
            }
            else
            {
                if(isLoginAdmin == true)
                {
                    if(result.GroupID == CommonConstants.ADMIN_GROUP || result.GroupID == CommonConstants.MOD_GROUP)
                    {
                        if (result.Status == false)
                            return -1;
                        else
                        {
                            if (result.PasswordSalt == passWordSalt)
                                return 1;
                            else
                                return -2;
                        }
                    }
                    else
                    {
                        return -3;
                    }
                }
                else
                {
                    if (result.Status == false)
                        return -1;
                    else
                    {
                        if (result.PasswordSalt == passWordSalt)
                            return 3;
                        else
                            return -2;
                    }
                }
            }
        }
        public bool ChangeStatus(long id)
        {
            var user = db.USERs.Find(id);
            user.Status = !user.Status;
            db.SaveChanges();
            return user.Status;
        }
        public bool Delete(int id)
        {
            try
            {
                var user = db.USERs.Find(id);
                db.USERs.Remove(user);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool CheckUserName(string userName)
        {
            return db.USERs.Count(x => x.UserName == userName) > 0;
        }
        public bool CheckEmail(string email)
        {
            return db.USERs.Count(x => x.email == email) > 0;
        }
    }
}