using QL_ThietBiTinHoc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using PagedList;
using PagedList.Mvc;
namespace QL_ThietBiTinHoc.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
         DBThietBiDataContext db = new DBThietBiDataContext();
      
        public ActionResult Index()
        {
            List<SanPham> lst = db.SanPhams.ToList();
            return View(lst);
        }
        //public List<ThietBi> LayThietBiMoi(int count)
        //{
        //    return db.ThietBis.OrderByDescending(a => a.NgayCapNhat).Take(count).ToList();
        //}
        public ActionResult DanhSachThietBi()//int ? page
        {
            //int pageSize = 6;
            //int pageNum = (page ?? 1);
            //List<ThietBi> lst = db.ThietBis.ToList();
            //int i = 0;
            //for (i = 1; i <= lst.Count(); i++)
            //{
            //}
            //var tbm = LayThietBiMoi(i);
            //return View(tbm.ToPagedList(pageNum, pageSize));
            List<SanPham> lst = db.SanPhams.OrderBy(s => s.GiaBan).ToList();
            return View(lst);
        }

        public ActionResult ChiTietThietBi(string ma)
        {
            int mtb = int.Parse(ma);
            List<SanPham> lst = db.SanPhams.ToList();
            SanPham tb = lst.FirstOrDefault(t => t.MaSanPham == mtb);
            return View(tb);
        }

        public ActionResult DanhMucLoai()
        {
            List<Loai> lst = db.Loais.ToList();
            return PartialView(lst);
        }

        public ActionResult DanhMucNhaSanXuat()
        {
            List<NhaSanXuat> lst = db.NhaSanXuats.ToList();
            return PartialView(lst);
        }

        public ActionResult HienThiThietBiTheoLoai(string ma)
        {
            int maloai = int.Parse(ma);
            List<SanPham> lst = db.SanPhams.ToList();
            List<SanPham> lst2 = lst.Where(t => t.MaLoai == maloai).ToList();
            return View("DanhSachThietBi", lst2);
        }

        public ActionResult HienThiThietBiTheoNSX(string ma)
        {
            int mansx = int.Parse(ma);
            List<SanPham> lst = db.SanPhams.ToList();
            List<SanPham> lst2 = lst.Where(t => t.MaNSX == mansx).ToList();
            return View("DanhSachThietBi", lst2);
        }

        public ActionResult GioiThieu()
        {
            return View();
        }
        [HttpPost]
        public ActionResult TimKiem(FormCollection fc)
        {
            var tukhoa = fc["timkiem"];
            List<SanPham> lst = db.SanPhams.ToList();
            List<SanPham> lst2 = lst.Where(t => t.TenSanPham.Contains(tukhoa) == true).ToList();
            return View("DanhSachThietBi", lst2);
        }

        public ActionResult TinTuc()
        {
            return View();
        }

        public ActionResult LienHe()
        {
            return View();
        }
    }
}
