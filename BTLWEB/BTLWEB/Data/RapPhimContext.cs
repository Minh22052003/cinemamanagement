using Microsoft.EntityFrameworkCore;
using BTLWEB.Models;

namespace BTLWEB.Data
{
    public partial class RapPhimContext : DbContext
    {
        public RapPhimContext(DbContextOptions<RapPhimContext> options) : base(options)
        {
        }
        public virtual DbSet<BinhLuan> BinhLuans { get; set; }
        public virtual DbSet<DanhMuc> DanhMucs { get; set; }
        public virtual DbSet<Ghe> Ghes { get; set; }
        public virtual DbSet<LichChieu> LichChieus { get; set; }
        public virtual DbSet<LoaiGhe> LoaiGhes { get; set; }
        public virtual DbSet<LoaiPhim> LoaiPhims { get; set; }
        public virtual DbSet<NoiDung> NoiDungs { get; set; }
        public virtual DbSet<Phim> Phims { get; set; }
        public virtual DbSet<Phong> Phongs { get; set; }
        public virtual DbSet<RapPhim> RapPhims { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }
        public virtual DbSet<ThongTin> ThongTins { get; set; }
        public virtual DbSet<Ve> Ves { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BinhLuan>()
                .HasMany(e => e.NoiDungs)
                .WithOne(e => e.BinhLuan)
                .HasForeignKey(e => e.Id_binhLuan);

            modelBuilder.Entity<DanhMuc>()
                .Property(e => e.TenDanhMuc)
                .IsUnicode(false);

            modelBuilder.Entity<LichChieu>()
                .Property(e => e.GioBatDau)
                .IsUnicode(false);

            modelBuilder.Entity<LichChieu>()
                .Property(e => e.GioKetThuc)
                .IsUnicode(false);

            modelBuilder.Entity<LichChieu>()
                .HasMany(e => e.Ves)
                .WithOne(e => e.LichChieus)
                .HasForeignKey(e => e.Id_LichChieu);

            modelBuilder.Entity<LoaiGhe>()
                .HasMany(e => e.Ghes)
                .WithOne(e => e.LoaiGhe)
                .HasForeignKey(e => e.Loai_id);

            modelBuilder.Entity<LoaiPhim>()
                .HasMany(e => e.Phims)
                .WithOne(e => e.LoaiPhim)
                .HasForeignKey(e => e.IdLoaiPhim)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Phim>()
                .Property(e => e.DaoDien)
                .IsUnicode(false);

            modelBuilder.Entity<Phim>()
                .Property(e => e.NamPhatHanh)
                .IsUnicode(false);

            modelBuilder.Entity<Phim>()
                .Property(e => e.ChatLuong)
                .IsUnicode(false);

            modelBuilder.Entity<Phim>()
                .HasMany(e => e.BinhLuans)
                .WithOne(e => e.Phim)
                .HasForeignKey(e => e.IdPhim);

            modelBuilder.Entity<Phim>()
                .HasMany(e => e.DanhMucs)
                .WithOne(e => e.Phim)
                .HasForeignKey(e => e.id_Phim);

            modelBuilder.Entity<Phim>()
                .HasMany(e => e.LichChieus)
                .WithOne(e => e.Phim)
                .HasForeignKey(e => e.IdPhim);

            modelBuilder.Entity<Phong>()
                .HasMany(e => e.Ghes)
                .WithOne(e => e.Phong)
                .HasForeignKey(e => e.Id_phong);

            modelBuilder.Entity<Phong>()
                .HasMany(e => e.LichChieux)
                .WithOne(e => e.Phong)
                .HasForeignKey(e => e.IdPhong);

            modelBuilder.Entity<RapPhim>()
                .HasMany(e => e.Phongs)
                .WithOne(e => e.RapPhim)
                .HasForeignKey(e => e.IdRapChieu);

            modelBuilder.Entity<RapPhim>()
                .HasMany(e => e.Ves)
                .WithOne(e => e.RapPhims)
                .HasForeignKey(e => e.IdRap);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.PhanQuyen)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .HasMany(e => e.NoiDungs)
                .WithOne(e => e.TaiKhoan)
                .HasForeignKey(e => e.Id_TaiKhoan);

            modelBuilder.Entity<TaiKhoan>()
                .HasMany(e => e.Ves)
                .WithOne(e => e.TaiKhoans)
                .HasForeignKey(e => e.IdTaiKhoan);

            modelBuilder.Entity<ThongTin>()
                .Property(e => e.DiaChi)
                .IsUnicode(false);

            modelBuilder.Entity<ThongTin>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<ThongTin>()
                .HasMany(e => e.TaiKhoans)
                .WithOne(e => e.ThongTin)
                .HasForeignKey(e => e.id_ThongTin);

            modelBuilder.Entity<Ve>()
                .HasMany(e => e.Ghes)
                .WithOne(e => e.Ve)
                .HasForeignKey(e => e.Id_Ve);

        }

    }
}
