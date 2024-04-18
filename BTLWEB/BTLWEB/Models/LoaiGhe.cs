namespace BTLWEB.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("LoaiGhe")]
    public partial class LoaiGhe
    {
        public LoaiGhe()
        {
            Ghes = new HashSet<Ghe>();
        }

        public int Id { get; set; }

        [Required]
        public string TenLoaiGhe { get; set; }

        public double ?GiaGhe { get; set; }

        public virtual ICollection<Ghe> Ghes { get; set; }
    }
}
