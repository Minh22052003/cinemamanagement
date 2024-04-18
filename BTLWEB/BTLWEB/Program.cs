using BTLWEB.Data;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

builder.Services.AddDistributedMemoryCache();

builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromSeconds(10);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});

builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.LoginPath = "/Account/Login"; // Set the login path
        options.LogoutPath = "/Account/Logout"; // Set the logout path
    });


builder.Services.AddDbContext<RapPhimContext>(options =>
   options.UseSqlServer(builder.Configuration.GetConnectionString("RapPhimContext")));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.MapControllerRoute(
    name: "phimRoute",
    pattern: "Phim",
    defaults: new { controller = "Phim", action = "QlPhim" });

app.MapControllerRoute(
    name: "CreatePhim",
    pattern: "Phim/CreatePhim",
    defaults: new { controller = "Phim", action = "CreatePhim" });
app.MapControllerRoute(
    name: "EditPhim",
    pattern: "Phim/EditPhim",
    defaults: new { controller = "Phim", action = "EditPhim" });
app.MapControllerRoute(
    name: "DeletePhim",
    pattern: "Phim/DeletePhim",
    defaults: new { controller = "Phim", action = "DeletePhim" });

app.MapControllerRoute(
    name: "phimPagingRoute",
    pattern: "Phim/{mid?}/{page?}/{searchString?}",
    defaults: new { controller = "Phim", action = "QlPhim" });



app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();

app.UseAuthorization();

app.UseSession();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");



app.Run();
