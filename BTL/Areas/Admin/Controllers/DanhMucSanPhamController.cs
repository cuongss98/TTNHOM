using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL.Common;
using BTL.DAO;
using BTL.Models;

namespace BTL.Areas.Admin.Controllers
{
    public class DanhMucSanPhamController : BaseController
    {
        // GET: Admin/DanhMucSanPham
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new DanhMucSanPhamDAO();
            var model = dao.ListAllPaging(searchString, page, pageSize);

            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var danhMucSanPham = new DanhMucSanPhamDAO().ViewDetail(id);
            return View(danhMucSanPham);
        }

        [HttpPost]
        public ActionResult Edit(DanhMuc danhMucSanPham)
        {
            if (ModelState.IsValid)
            {
                var dao = new DanhMucSanPhamDAO();

                var result = dao.Update(danhMucSanPham);
                if (result)
                {
                    SetAlert("Sửa danh mục sản phẩm thành công", "success");
                    return RedirectToAction("Index", "DanhMucSanPham");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật danh mục sản phẩm không thành công");
                }
            }
            return View("Index");
        }
   
        [HttpPost]
        public ActionResult Create(DanhMuc danhMucSanPham)
        {
            if (ModelState.IsValid)
            {
                var currentCulture = Session[CommonConstant.CurrentCulture];           
                var id = new DanhMucSanPhamDAO().Insert(danhMucSanPham);
                if (id > 0)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", StaticResources.Resources.InsertCategoryFailed);
                }
            }
            return View(danhMucSanPham);
        }
        [HttpDelete]
        //[HasCredential(RoleID = "DELETE_USER")]
        public ActionResult Delete(int id)
        {
            new DanhMucSanPhamDAO().Delete(id);

            return RedirectToAction("Index");
        }
    }
}