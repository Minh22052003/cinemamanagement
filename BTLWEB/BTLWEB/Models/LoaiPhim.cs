namespace BTLWEB.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("LoaiPhim")]
    public partial class LoaiPhim
    {
        public LoaiPhim()
        {
            Phims = new HashSet<Phim>();
        }

        public int Id { get; set; }

        
        public string TenLoai { get; set; }

        public virtual ICollection<Phim> Phims { get; set; }
    }
}
