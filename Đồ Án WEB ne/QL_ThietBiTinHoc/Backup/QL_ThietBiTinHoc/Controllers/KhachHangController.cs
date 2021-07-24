using QL_ThietBiTinHoc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QL_ThietBiTinHoc.Controllers
{
    public class KhachHangController : Controller
    {
        //
        // GET: /KhachHang/

        DBThietBiDataContext db = new DBThietBiDataContext();

        public ActionResult DangKyVaDangNhap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangKy(FormCollection fc, KhachHang kh)
        {
            kh.HoTen = fc["hoten"];
            var ngaysinh = String.Format("{0:dd/MM/yyyy}", fc["ngaysinh"]);
            kh.NgaySinh = DateTime.Parse(ngaysinh);
            kh.GioiTinh = fc["gioitinh"];
            kh.DienThoai = fc["dienthoai"];
            kh.Email = fc["email"];
            kh.DiaChi = fc["diachi"];
            kh.TaiKhoan = fc["taikhoandangky"];
            kh.MatKhau = fc["matkhaudangky"];
            db.KhachHangs.InsertOnSubmit(kh);
            db.SubmitChanges();
            return RedirectToAction("DangKyVaDangNhap","KhachHang");
        }

        [HttpPost]
        public ActionResult DangNhap(FormCollection fc)
        {
            var tendn = fc["taikhoandangnhap"];
            var matkhau = fc["matkhaudangnhap"];
            if (string.IsNullOrEmpty(tendn))
            {
                ViewData["Loi"] = "Phải nhập tên đăng nhập";
            }
            else if (string.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi"] = "Phải nhập mật khẩu";
            }
            
            else
            {
                KhachHang kh = db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == tendn && n.MatKhau == matkhau);
                if (kh != null)
                {
                    Session["Taikhoan"] = kh;
                    return RedirectToAction("DanhSachThietBi", "Home");
                }
                else
                {
                    ViewData["Loi"] = "Tên đăng nhập hoặc mật khẩu không đúng";
                    return View("DangKyVaDangNhap");
                }
            }
            return View("DangKyVaDangNhap");
        }

        public ActionResult DangXuat()
        {
            Session["Taikhoan"] = null;
            return RedirectToAction("Index", "Home");
        }
    }
}
