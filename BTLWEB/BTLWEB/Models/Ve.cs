namespace BTLWEB.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Ve")]
    public partial class Ve
    {
        public Ve()
        {
            Ghes = new HashSet<Ghe>();
        }

        public int Id { get; set; }

        public int? IdTaiKhoan { get; set; }

        public int? IdRap { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? NgayDat { get; set; }

        public decimal? GiaVe { get; set; }

        public int? Id_LichChieu { get; set; }

        public int? Soluong { get; set; }

        public virtual ICollection<Ghe> Ghes { get; set; }

        public virtual LichChieu? LichChieus { get; set; }

        public virtual RapPhim RapPhims { get; set; }

        public virtual TaiKhoan TaiKhoans { get; set; }
    }
}
