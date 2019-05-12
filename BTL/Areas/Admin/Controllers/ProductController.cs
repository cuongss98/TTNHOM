using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
//using System.Web.Script.Serialization;
using System.Xml.Linq;
using BTL.Areas.Admin.Controllers;
using BTL.DAO;
using BTL.Models;

namespace BTL.Areas.Admin.Controllers
{
    public class ProductController : BaseController
    {
        // GET: Admin/Product
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductDAO();
            var model = dao.ListAllpaging(searchString, page, pageSize);

            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }
        [HttpGet]
        //[HasCredential(RoleID = "EDIT_USER")]
        public ActionResult Edit(int id)
        {
            var sanPham = new ProductDAO().ViewDetail(id);
            return View(sanPham);
        }

        [HttpPost]
        //[HasCredential(RoleID = "EDIT_USER")]
        public ActionResult Edit(SanPham sanPham)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDAO();

                var result = dao.Update(sanPham);
                if (result)
                {
                    SetAlert("Sửa sản phẩm thành công", "success");
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật sản phẩm không thành công");
                }
            }
            return View("Index");
        }
        public JsonResult LoadImages(int sanPhamID)
        {
            ProductDAO dao = new ProductDAO();
            var sanPham = dao.ViewDetail(sanPhamID);
            var anhSanPham = sanPham.HinhAnh;
            XElement xImages = XElement.Parse(anhSanPham);
            List<string> listImagesReturn = new List<string>();

            foreach (XElement element in xImages.Elements())
            {
                listImagesReturn.Add(element.Value);
            }
            return Json(new
            {
                data = listImagesReturn
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        //[HasCredential(RoleID = "ADD_USER")]
        public ActionResult Create(SanPham sanPham)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDAO();

                long id = dao.Insert(sanPham);
                if (id > 0)
                {                  
                    SetAlert("Thêm user thành công", "success");
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm sản phẩm không thành công");
                }
            }
            return View("Index");
        }
        [HttpDelete]
        //[HasCredential(RoleID = "DELETE_USER")]
        public ActionResult Delete(int id)
        {
            new ProductDAO().Delete(id);

            return RedirectToAction("Index");
        }

        //public JsonResult SaveImages(long id, string images)
        //{
        //    JavaScriptSerializer serializer = new JavaScriptSerializer();
        //    var listImages = serializer.Deserialize<List<string>>(images);

        //    XElement xElement = new XElement("Images");

        //    foreach (var item in listImages)
        //    {
        //        var subStringItem = item.Substring(21);
        //        xElement.Add(new XElement("Image", subStringItem));
        //    }
        //    ProductDAO dao = new ProductDao();
        //    try
        //    {
        //        dao.UpdateImages(id, xElement.ToString());
        //        return Json(new
        //        {
        //            status = true
        //        });
        //    }
        //    catch (Exception ex)
        //    {
        //        return Json(new
        //        {
        //            status = false
        //        });
        //    }

        //}
        public void SetViewBag(int? selectedId = null)
        {
            var dao = new DanhMucSanPhamDAO();
            ViewBag.DanhMucSanphamID = new SelectList(dao.ListAll(), "DanhMucSanPhamID", "TenDanhMucSanPham", selectedId);
        }
    }
}