using System.ComponentModel.DataAnnotations;

namespace Zapocet_Abel.Data.Model
{
    public class PurchaseOrderHeaders
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string PoNumber { get; set; }
        [Required]
        public string CustomerName { get; set; }
        [Required]
        public string CustomerLastName { get; set; }
        [Required]
        public DateTime CreatedOn { get; set; }
        [Required]
        public bool IsPaid { get; set; }
        [Required]
        public string CustomerEmail { get; set; }
    }
}
