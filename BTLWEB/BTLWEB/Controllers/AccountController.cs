using Microsoft.AspNetCore.Mvc;
using BTLWEB.Data;
using BTLWEB.Models;
using System.Linq;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using System.Threading.Tasks;
using System.Security.Claims;

namespace BTLWEB.Controllers
{
    public class AccountController : Controller
    {
        private readonly RapPhimContext _dbContext;

        public AccountController(RapPhimContext dbContext)
        {
            _dbContext = dbContext;
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> Login(string tenDangNhap, string matKhau)
        {
            var user = _dbContext.TaiKhoans.SingleOrDefault(u => u.TenDangNhap == tenDangNhap && u.MatKhau == matKhau);
            if (user != null)
            {
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, tenDangNhap),
                    new Claim(ClaimTypes.Role, user.PhanQuyen)
                };

                var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                var authProperties = new AuthenticationProperties
                {
                    
                };

                await HttpContext.SignInAsync(
                    CookieAuthenticationDefaults.AuthenticationScheme,
                    new ClaimsPrincipal(claimsIdentity),
                    authProperties);

                return RedirectToAction("Index", "Home");
            }
            ViewBag.Error = "Tên đăng nhập hoặc mật khẩu không chính xác.";
            return View();
        }


        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(string tenDangNhap, string matKhau)
        {
            if (tenDangNhap == null || matKhau == null)
            {
                ViewBag.Error = "Tên đăng nhập và mật khẩu không được để trống.";
                return View();
            }

            var existingUser = _dbContext.TaiKhoans.FirstOrDefault(u => u.TenDangNhap == tenDangNhap);
            if (existingUser != null)
            {
                ViewBag.Error = "Tên đăng nhập đã tồn tại.";
                return View();
            }

            var currentDate = DateTime.Now;
            var newUser = new TaiKhoan
            {
                TenDangNhap = tenDangNhap,
                MatKhau = matKhau,
                NgayDangKy = currentDate,
                TinhTrang = true,
                PhanQuyen = "USER"
            };
            _dbContext.TaiKhoans.Add(newUser);
            _dbContext.SaveChanges();

            return RedirectToAction("Login");
        }

        public ActionResult Profile()
        {
            return View();
        }
        public ActionResult ProfileUse()
        {
            return View();
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Index", "Home");
        }
    }
}
