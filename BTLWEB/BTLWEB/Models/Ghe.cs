namespace BTLWEB.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Ghe")]
    public partial class Ghe
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long ghe_id { get; set; }

        public int? Loai_id { get; set; }

        public bool TringTrang { get; set; }

        public int? Id_phong { get; set; }

        public int? Id_Ve { get; set; }
        public string TenGhe { get; set; }

        public virtual LoaiGhe? LoaiGhe { get; set; }

        public virtual Phong Phong { get; set; }

        public virtual Ve? Ve { get; set; }

       
    }
}
