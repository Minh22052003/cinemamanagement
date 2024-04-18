using BTLWEB.Data;
using BTLWEB.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using System.Security.Cryptography;

namespace BTLWEB.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private readonly RapPhimContext _context;
       

        public HomeController(ILogger<HomeController> logger, RapPhimContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy(int? mid)
        {
            var loaiPhims = _context.LoaiPhims.ToList();
            ViewBag.LoaiPhims = loaiPhims;

            var phims = _context.Phims.Include(p => p.LoaiPhim).ToList();

            if (mid != null)
            {
                phims = phims.Where(p => p.IdLoaiPhim == mid).ToList();
            }

            return View(phims);
        }
        public IActionResult CinemaRoom()
        {
            var rapPhims = _context.RapPhims.ToList();
            return View(rapPhims);
        }
        public IActionResult News()
        {
            return View();
        }
        public IActionResult Library()
        {
            return View();
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        public IActionResult DatPhim(string TenPhim, string AnhPhim, string MoTa, string DaoDien, string DienVien)
        {

            return View(new Phim { TenPhim = TenPhim, AnhPhim = AnhPhim, MoTa = MoTa, DaoDien = DaoDien, DienVien = DienVien });
        }
    }
    
}