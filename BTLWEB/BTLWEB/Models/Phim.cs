namespace BTLWEB.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Phim")]
    public partial class Phim
    {
        public Phim()
        {
            BinhLuans = new HashSet<BinhLuan>();
            DanhMucs = new HashSet<DanhMuc>();
            LichChieus = new HashSet<LichChieu>();
        }
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int? Id { get; set; }

        public string TenPhim { get; set; }

        public string? AnhPhim { get; set; }

        public int? ThoiLuong { get; set; }

        public string? MoTa { get; set; }


        public bool TinhTrang { get; set; }

        public int IdLoaiPhim { get; set; }
        public virtual LoaiPhim? LoaiPhim { get; set; }

        public string? DienVien { get; set; }

        public string? DaoDien { get; set; }

        public DateTime? NgayCongChieu { get; set; }

        public DateTime? NgayKetThuc { get; set; }

        [StringLength(50)]
        public string? NamPhatHanh { get; set; }

        [StringLength(50)]
        public string? ChatLuong { get; set; }

        public virtual ICollection<BinhLuan> BinhLuans { get; set; }

        public virtual ICollection<DanhMuc> DanhMucs { get; set; }

        public virtual ICollection<LichChieu> LichChieus { get; set; }

        
    }
}
