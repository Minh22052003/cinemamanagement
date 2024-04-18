using BTLWEB.Data;
using BTLWEB.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace BTLWEB.Controllers
{
    public class RapPhimController : Controller
    {
        private readonly RapPhimContext _context;
        public int pageSize = 3;

        public RapPhimController(RapPhimContext context)
        {
            _context = context;
        }
        public IActionResult QlRap(int? page, string? search)
        {
            if (User.Identity.IsAuthenticated && User.IsInRole("MANAGA"))
            {
                int pageNumber = (page?? 1);
                if(search != null)
                {
                    var rapPhims = _context.RapPhims
                        .Where(r=>r.TenRapChieu.Contains(search))
                        .Skip((pageNumber-1)*pageSize)
                        .Take(pageSize)
                        .ToList();
                    ViewBag.TongTrang = (int)Math.Ceiling(_context.RapPhims.Count() / (double)pageSize);
                    ViewBag.SoTrang = pageNumber;
                    ViewBag.Search = search;
                    return View(rapPhims);
                }
                else
                {
                    var rapPhims = _context.RapPhims
                        .Skip((pageNumber-1)*pageSize)
                        .Take(pageSize)
                        .ToList();
                    ViewBag.TongTrang = (int)Math.Ceiling(_context.RapPhims.Count() / (double)pageSize);
                    ViewBag.SoTrang = pageNumber;
                    return View(rapPhims);
                }
                
            }
            else
            {
                return StatusCode(403, "Bạn không có quyền truy cập trang này.");
            }
            
        }

        public IActionResult CreateRapPhim()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CreateRapPhim([Bind("TenRapChieu, TongSoPhong, ThanhPho, QuanHuyen, PhuongXa, KhungGio")] RapPhim rapPhims)
        {
            if (ModelState.IsValid)
            {
                _context.Add(rapPhims);
                _context.SaveChanges();
                return RedirectToAction(nameof(QlRap));
            }
            return View(rapPhims);
        }

        public IActionResult EditRapPhim(int id)
        {
            if (_context.RapPhims == null)
            {
                return NotFound();
            }

            var rapPhim = _context.RapPhims.Find(id);
            if (rapPhim == null)
            {
                return NotFound();
            }
            return View(rapPhim);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EditRapPhim(int id,
            [Bind("Id,TenRapChieu, TongSoPhong, ThanhPho, QuanHuyen, PhuongXa, KhungGio")] RapPhim rapPhim)
        {
            if (id != rapPhim.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(rapPhim);
                    _context.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!RapPhimExists(rapPhim.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(QlRap));
            }
            return View(rapPhim);
        }
        private bool RapPhimExists(int? id)
        {
            return _context.RapPhims.Any(e => e.Id == id);
        }
        public IActionResult DeleteRapPhim(int id)
        {
            var rapPhim = _context.RapPhims.Find(id);
            if (rapPhim == null)
            {
                return NotFound();
            }
            return View(rapPhim);
        }

        [HttpPost, ActionName("DeleteRapPhim")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int id)
        {
            var rapPhim = _context.RapPhims.Find(id);
            if (rapPhim == null)
            {
                return NotFound();
            }
            _context.RapPhims.Remove(rapPhim);
            _context.SaveChanges();
            return RedirectToAction(nameof(QlRap));
        }

    }

}

