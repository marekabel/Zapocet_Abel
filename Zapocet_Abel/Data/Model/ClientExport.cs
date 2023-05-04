namespace Zapocet_Abel.Data.Model
{
    public class ClientExport
    {

        public PurchaseOrderHeaders PurchaseOrderHeader { get; set; }
        public double TotalPrice { get; set; } = 0;

        public ClientExport(PurchaseOrderHeaders _purchaseOrderHeaders, double _celkovaCena)
        {
            this.PurchaseOrderHeader = _purchaseOrderHeaders;
            this.TotalPrice = _celkovaCena;
        }
    }
}
