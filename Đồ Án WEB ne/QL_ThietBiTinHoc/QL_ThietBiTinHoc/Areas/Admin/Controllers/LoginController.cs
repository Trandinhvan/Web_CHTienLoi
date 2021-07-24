
using QL_ThietBiTinHoc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QL_ThietBiTinHoc.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Admin/Login/
        DBThietBiDataContext db = new DBThietBiDataContext();

        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangNhap(FormCollection fc)
        {            
            var tenDN = fc["username"];
            var matKhau = fc["pass"];
            if (string.IsNullOrEmpty(tenDN))
            {
                ViewBag.ThongBao = "Phải nhập tên đăng nhập";
            }
            else if (string.IsNullOrEmpty(matKhau))
            {
                ViewBag.ThongBao = "Phải nhập mật khẩu";
            }
            else
            {
                 _TK_Admin Ad = db._TK_Admins.SingleOrDefault(n => n.Username == tenDN && n.Password == matKhau);
                if (Ad != null)
                {
                    ViewBag.ThongBao = "Chúc mừng đăng nhập thành công";
                    Session["Taikhoan"] = tenDN;
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
                    //return RedirectToAction("Index","Login");
                    return View("Index");
                }
            }
            return View();
        }
    }
}
