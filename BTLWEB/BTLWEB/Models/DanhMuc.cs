namespace BTLWEB.Models
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("DanhMuc")]
    public partial class DanhMuc
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int id { get; set; }

        [Required]
        [StringLength(50)]
        public string TenDanhMuc { get; set; }

        public int? id_Phim { get; set; }

        public virtual Phim Phim { get; set; }
    }
}
