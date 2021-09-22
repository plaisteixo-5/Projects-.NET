using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShopAPI.Models
{
    public class Product
    {
        [Key]
        public int Id { get; set; }

        [Required()]
        [MaxLength(60)]
        [MinLength(3)]
        public string Title { get; set; }

        [MaxLength(1024)]
        public string Description { get; set; }

        [Required]
        [Range(1, int.MaxValue)]
        [Column(TypeName = "decimal(18, 4)")]
        public decimal Price { get; set; }

        [Required]
        [Range(1, int.MaxValue)]
        public int CategoryId { get; set; }
        public Category Category { get; set; }

    }
}