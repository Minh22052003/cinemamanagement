namespace BTLWEB.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("TaiKhoan")]
    public partial class TaiKhoan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TaiKhoan()
        {
            NoiDungs = new HashSet<NoiDung>();
            Ves = new HashSet<Ve>();
        }
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        public string TenDangNhap { get; set; }

        [Required]
        [StringLength(60)]
        public string MatKhau { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayDangKy { get; set; }

        public bool TinhTrang { get; set; }

        [Required]
        [StringLength(50)]
        public string PhanQuyen { get; set; }

        public int? id_ThongTin { get; set; }
        public virtual ICollection<NoiDung> NoiDungs { get; set; }

        public virtual ThongTin? ThongTin { get; set; }

        public virtual ICollection<Ve> Ves { get; set; }
    }
}
