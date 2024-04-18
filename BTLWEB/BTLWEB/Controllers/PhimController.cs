using BTLWEB.Data;
using BTLWEB.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace BTLWEB.Controllers
{
    public class PhimController : Controller
    {
        private readonly RapPhimContext _context;
        public int pageSize = 5;

        public PhimController(RapPhimContext context)
        {
            _context = context;
        }
        public IActionResult QlPhim(int? mid, int? page,string? searchString)
        {
            if (User.Identity.IsAuthenticated && User.IsInRole("MANAGA"))
            {
                int pageNumber = (page ?? 1);
                if (searchString != null)
                {
                    if (mid == null)
                    {
                        var phims = _context.Phims
                            .Include(p => p.LoaiPhim)
                            .Where(p => p.TenPhim.Contains(searchString))
                            .Skip((pageNumber - 1) * pageSize)
                            .Take(pageSize)
                            .ToList();
                        ViewBag.TotalPages = (int)Math.Ceiling(_context.Phims.Count() / (double)pageSize);
                        ViewBag.CurrentPage = pageNumber;
                        ViewBag.SearchString = searchString;
                        return View(phims);
                    }
                    else
                    {
                        var phims = _context.Phims
                            .Where(p => p.IdLoaiPhim == mid)
                            .Where(p => p.TenPhim.Contains(searchString))
                            .Include(p => p.LoaiPhim)
                            .Skip((pageNumber - 1) * pageSize)
                            .Take(pageSize)
                            .ToList();

                        ViewBag.TotalPages = (int)Math.Ceiling(_context.Phims.Where(p => p.IdLoaiPhim == mid).Count() / (double)pageSize);
                        ViewBag.CurrentPage = pageNumber;
                        ViewBag.MID = mid;
                        ViewBag.SearchString = searchString;

                        return View(phims);

                    }
                }
                else
                {
                    if (mid == null)
                    {
                        var phims = _context.Phims
                            .Include(p => p.LoaiPhim)
                            .Skip((pageNumber - 1) * pageSize)
                            .Take(pageSize)
                            .ToList();

                        ViewBag.TotalPages = (int)Math.Ceiling(_context.Phims.Count() / (double)pageSize);
                        ViewBag.CurrentPage = pageNumber;
                        return View(phims);
                    }
                    else
                    {
                        var phims = _context.Phims
                            .Where(p => p.IdLoaiPhim == mid)
                            .Include(p => p.LoaiPhim)
                            .Skip((pageNumber - 1) * pageSize)
                            .Take(pageSize)
                            .ToList();

                        ViewBag.TotalPages = (int)Math.Ceiling(_context.Phims.Where(p => p.IdLoaiPhim == mid).Count() / (double)pageSize);
                        ViewBag.CurrentPage = pageNumber;
                        ViewBag.MID = mid;
                        return View(phims);

                    }
                }
            }
            else
            {
                return StatusCode(403, "Bạn không có quyền truy cập trang này.");
            }
        }

        public IActionResult CreatePhim()
        {
            var theloai = new List<SelectListItem>();
            foreach (var item in _context.LoaiPhims)
            {
                theloai.Add(new SelectListItem
                {
                    Text = item.TenLoai,
                    Value = item.Id.ToString()
                });
            }
            ViewBag.LoaiPhim = theloai;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CreatePhim([Bind("TenPhim, AnhPhim, MoTa, IdLoaiPhim, ThoiLuong, NgayCongChieu, NgayKetThuc, DienVien, DaoDien, TinhTrang, NamPhatHanh, ChatLuong")] Phim phim)
        {
            if (ModelState.IsValid)
            {
                _context.Add(phim);
                _context.SaveChanges();
                return RedirectToAction("QlPhim", new { mid = phim.IdLoaiPhim });
            }
            
            ViewBag.LoaiPhim = new SelectList(_context.LoaiPhims.ToList(), "Id", "TenLoai");
            return View(phim);
        }



        public IActionResult EditPhim(int id)
        {
            if (_context.Phims == null)
            {
                return NotFound();
            }

            var phim = _context.Phims.Find(id);
            if (phim == null)
            {
                return NotFound();
            }
            ViewBag.IdLoaiPhim = new SelectList(_context.LoaiPhims, "Id", "TenLoai", phim.IdLoaiPhim);
            return View(phim);  
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EditPhim(int id, 
            [Bind("Id,TenPhim,AnhPhim,MoTa,IdLoaiPhim,ThoiLuong,NgayCongChieu," +
                "NgayKetThuc,DienVien,DaoDien,TinhTrang,NamPhatHanh,ChatLuong")] Phim phim)
        {
            if (id != phim.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(phim);
                    _context.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PhimExists(phim.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(QlPhim));
            }
            ViewBag.IdLoaiPhim = new SelectList(_context.LoaiPhims, "Id", "TenLoai", phim.IdLoaiPhim);
            return View(phim);
        }
        private bool PhimExists(int? id)
        {
            return _context.Phims.Any(e => e.Id == id);
        }
        public IActionResult DeletePhim(int id)
        {
            var phim = _context.Phims.Find(id);
            if (phim == null)
            {
                return NotFound();
            }
            return View(phim);
        }

        [HttpPost, ActionName("DeletePhim")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int id)
        {
            var phim = _context.Phims.Find(id);
            if (phim == null)
            {
                return NotFound();
            }
            _context.Phims.Remove(phim);
            _context.SaveChanges();
            return RedirectToAction(nameof(QlPhim));
        }

        public ActionResult ReturnView()
        {
            return PartialView("ViewMain");
        }
		public ActionResult List()
		{
			return View();
		}

	}
}
