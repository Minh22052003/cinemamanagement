using BTLWEB.Data;
using BTLWEB.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace BTLWEB.Controllers
{
    public class TaiKhoanController : Controller
    {
        private readonly RapPhimContext _context;

        public TaiKhoanController(RapPhimContext context)
        {
            _context = context;
        }

        public IActionResult QlTK()
        {
            if (User.Identity.IsAuthenticated && User.IsInRole("MANAGA"))
            {
                var taiKhoans = _context.TaiKhoans.Where(t => t.PhanQuyen == "USER").ToList();
                return View(taiKhoans);
            }
            else
            {
                return Unauthorized();
            }
        }

        public IActionResult EditTaiKhoan(int id)
        {
            var taiKhoan = _context.TaiKhoans.Find(id);

            if (taiKhoan == null)
            {
                return NotFound();
            }

            return View(taiKhoan);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EditTaiKhoan(int id, [Bind("Id,TenDangNhap,MatKhau,NgayDangKy,TinhTrang,PhanQuyen,id_ThongTin")] TaiKhoan taiKhoan)
        {
            if (id != taiKhoan.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(taiKhoan);
                    _context.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TaiKhoanExists(taiKhoan.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(QlTK));
            }

            return View(taiKhoan);
        }


        private bool TaiKhoanExists(int id)
        {
            return _context.TaiKhoans.Any(e => e.Id == id);
        }

        public IActionResult DeleteTaiKhoan(int id)
        {
            var taikhoan = _context.TaiKhoans.Find(id);
            if (taikhoan == null)
            {
                return NotFound();
            }
            return View(taikhoan);
        }
        [HttpPost, ActionName("DeleteTaiKhoan")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int id)
        {
            var taikhoan = _context.TaiKhoans.Find(id);
            if (taikhoan == null)
            {
                return NotFound();
            }
            _context.TaiKhoans.Remove(taikhoan);
            _context.SaveChanges();
            return RedirectToAction(nameof(QlTK));
        }
    }
}

