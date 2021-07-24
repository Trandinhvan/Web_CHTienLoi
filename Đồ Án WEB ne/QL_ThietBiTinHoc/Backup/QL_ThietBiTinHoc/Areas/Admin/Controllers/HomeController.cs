using QL_ThietBiTinHoc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using System.IO;
namespace QL_ThietBiTinHoc.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Admin/Home/
        DBThietBiDataContext db = new DBThietBiDataContext();

        public ActionResult Index(int ? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 20;
            return View(db.ThietBis.ToList().OrderBy(n=>n.MaThietBi).ToPagedList(pageNumber,pageSize));
        }

        [HttpGet]
        public ActionResult ThemThietBiMoi()
        {
            ViewBag.MaLoai = new SelectList(db.Loais.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX");
            return View();
        }

        [HttpPost]
        public ActionResult ThemThietBiMoi(ThietBi thietbi, HttpPostedFileBase fileupload)
        {
            var filename = Path.GetFileName(fileupload.FileName);
            var path = Path.Combine(Server.MapPath("~/Content/images/"), filename);
            if (System.IO.File.Exists(path))
            {
                ViewBag.Thongbao = "Hình ảnh đã tồn tại";
            }
            else
            {
                fileupload.SaveAs(path);
            }
            ViewBag.MaLoai = new SelectList(db.Loais.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX");
            return View();
        }

        //[HttpPost]
        //[ValidateInput(false)]
        //public ActionResult ThemThietBiMoi(ThietBi thietbi, HttpPostedFileBase fileUpload)
        //{
        //    ViewBag.MaLoai = new SelectList(db.Loais.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
        //    ViewBag.MaNSX = new SelectList(db.NhaSanXuats.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX");
        //    if (fileUpload == null)
        //    {
        //        ViewBag.Thongbao = "Vui lòng chọN ảnh bìa";
        //        return View();
        //    }
        //    else
        //    {
        //        if (ModelState.IsValid)
        //        {
        //            var filename = Path.GetFileName(fileUpload.FileName);
        //            var path = Path.Combine(Server.MapPath("~/Content/images/"), filename);
        //            if (System.IO.File.Exists(path))
        //            {
        //                ViewBag.Thongbao = "Hình ảnh đã tồn tại";
        //            }
        //            else
        //            {
        //                fileUpload.SaveAs(path);
        //            }
        //            thietbi.AnhBia = filename;
        //            db.ThietBis.InsertOnSubmit(thietbi);
        //            db.SubmitChanges();
        //        }
        //        return RedirectToAction("Index");
        //    }
        //}

    }
}
