using System.ComponentModel.DataAnnotations;

namespace Zapocet_Abel.Data.Model
{
    public class PurchaseOrderItems
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public int PurchaserOrderId { get; set; }
        [Required]
        public string ShopItemTitle { get; set; }
        [Required]
        public int Amount { get; set; }
        [Required]
        public double PricePerUnit { get; set; }



    }
}
