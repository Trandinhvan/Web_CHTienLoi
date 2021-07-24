using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QL_ThietBiTinHoc.Models
{
    public class GioHang
    {
        DBThietBiDataContext db = new DBThietBiDataContext();

        public int MaThietBi { get; set; }

        public string TenThietBi { get; set; }

        public string sAnhBia { get; set; }

        public int sGiaBan { get; set; }

        public int sSoLuong { get; set; }

        public int sThanhTien
        {
            get { return sSoLuong * sGiaBan; }
        }

        public GioHang(string mtb)
        {  
            int ma = int.Parse(mtb);
            MaThietBi = ma;
            ThietBi tb = db.ThietBis.FirstOrDefault(t => t.MaThietBi == ma);
            TenThietBi = tb.TenThietBi;
            sAnhBia = tb.AnhBia;
            sGiaBan = int.Parse(tb.GiaBan.ToString());
            sSoLuong = 1;
        }
    }
}