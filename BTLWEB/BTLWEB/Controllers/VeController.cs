using BTLWEB.Data;
using BTLWEB.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace BTLWEB.Controllers
{
    public class VeController : Controller
    {
        private readonly RapPhimContext _context;


        public VeController(RapPhimContext context)
        {
            _context = context;
        }
        public IActionResult QlVe()
        {

            if (User.Identity.IsAuthenticated && User.IsInRole("USER"))
            {   
                string tenDangNhap = User.Identity.Name;

                var Ves = _context.Ves
                .Where(v => v.TaiKhoans.TenDangNhap == tenDangNhap)
                .Include(v => v.LichChieus)
                .Include(v=>v.Ghes)
                .Include(v => v.RapPhims)
                .Include(v => v.TaiKhoans)
                .ToList();

                return View(Ves);

            }
            else
            if(User.Identity.IsAuthenticated && User.IsInRole("MANAGA"))
            {
                return StatusCode(403, "Dùng nick user đi, nick này dùng để xóa bọn user thôi");
            }
            else
            {
                return StatusCode(403, "Bạn không có quyền truy cập trang này.");
            }

        }
        public IActionResult CreateVe()
        {
            if (User.Identity.IsAuthenticated && User.IsInRole("USER"))
            {
                 string tenDangNhap = User.Identity.Name;
                ViewBag.TaiKhoan =tenDangNhap;

                var rapphim = new List<SelectListItem>();
                foreach (var item in _context.RapPhims)
                {
                    rapphim.Add(new SelectListItem
                    {
                        Text = item.TenRapChieu,
                        Value = item.Id.ToString()
                    });
                }

                var lichchieu = new List<SelectListItem>();
                foreach(var item in _context.LichChieus)
                {
                    lichchieu.Add(new SelectListItem
                    {
                        Text = $"{item.NgayChieu.ToString("MM/dd/yyyy")} {item.GioBatDau} - {item.GioKetThuc}",
                        Value = item.Id.ToString()
                    });
                }
                var gheList = _context.Ghes
                .Include(g=>g.LoaiGhe).ToList();
                var ghe = new List<SelectListItem>();
                foreach (var item in _context.Ghes)
                {
                    ghe.Add(new SelectListItem
                    {
                        Text = $"{item.TenGhe} {item.LoaiGhe.TenLoaiGhe}",
                        Value = item.Loai_id.ToString()
                    });
                }
                ViewBag.TenGhe = ghe;
                ViewBag.RapPhim = rapphim;
                ViewBag.LichChieu = lichchieu;
                return View();
            }
            else
            if(User.Identity.IsAuthenticated && User.IsInRole("MANAGA"))
            {
                return StatusCode(403, "Dùng nick user đi, nick này dùng để xóa bọn user thôi");
            }
            else
            {
                return StatusCode(403, "Vui lòng đăng nhập để đặt vé.");
            }

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CreateVe([Bind("IdTaiKhoan, IdRap, NgayDat, Giave, IdLichChieu, SoLuong")] Ve ve)
        {
            if (ModelState.IsValid)
            {

                string tenDangNhap = User.Identity.Name;
                var taiKhoan = _context.TaiKhoans.FirstOrDefault(t => t.TenDangNhap == tenDangNhap);
                if (taiKhoan != null)
                {
                    ve.IdTaiKhoan = taiKhoan.Id;
                }

                ViewBag.RapPhim = new SelectList(_context.RapPhims.ToList(), "Id", "TenRapChieu");

                ve.NgayDat = DateTime.Now;

                
                var ghe = _context.Ghes.FirstOrDefault(g => g.Id_Ve == ve.Id);
                if (ghe != null)
                {
                    var loaiGhe = _context.LoaiGhes.FirstOrDefault(l => l.Id == ghe.Loai_id);
                    ve.GiaVe = (decimal?)(ve.Soluong * loaiGhe.GiaGhe);
                }

                _context.Add(ve);
                _context.SaveChanges();
                return RedirectToAction(nameof(QlVe));
            }

            ViewBag.LichChieu = new SelectList(_context.LichChieus.ToList(), "Id", "NgayChieu");
            return View(ve);
        }
        public IActionResult DeleteVe(int id)
        {
            var ve = _context.Ves.Find(id);
            if (ve == null)
            {
                return NotFound();
            }
            return View(ve);
        }
        [HttpPost, ActionName("DeleteVeConfirmed")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteVeConfirmed(int id)
        {
            var ve = _context.Ves.Find(id);
            if (ve == null)
            {
                return NotFound();
            }
            _context.Ves.Remove(ve);
            _context.SaveChanges();
            return RedirectToAction(nameof(QlVe));
        }
    }
}
