using Microsoft.EntityFrameworkCore;
using Zapocet_Abel.Data;
using Zapocet_Abel.Data.Dto;
using Zapocet_Abel.Data.Model;
using Zapocet_Abel.Services.Interfaces;
using System.Data;
using System.Globalization;

namespace Zapocet_Abel.Services
{
    public class ClientService : MasterService, IClientService
    {
        public ClientService(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }
        public ClientResponseDto AddClientData(List<ClientDto> clientDataDto)
        {
            ClientResponseDto responseDto = new ClientResponseDto();
            foreach (var dataRow in clientDataDto)
            {
                if (_context.PurchaseOrderHeaders.Any(x => x.PoNumber == dataRow.poid))
                {
                    responseDto.FailedCount++;
                    responseDto.Message = "Stejne POID";
                    continue;
                }
                var purchaseOrderHeaders = new PurchaseOrderHeaders()
                {
                    PoNumber = dataRow.poid,
                    CustomerName = dataRow.first_name,
                    CustomerLastName = dataRow.last_name,
                    CreatedOn = DateTime.ParseExact(dataRow.createdon, "M/d/yyyy", CultureInfo.InvariantCulture),
                    CustomerEmail = dataRow.email,
                };
                _context.PurchaseOrderHeaders.Add(purchaseOrderHeaders);
                _context.SaveChanges();
                var purchaseOrderItems = new PurchaseOrderItems()
                {
                    PurchaserOrderId = purchaseOrderHeaders.Id,
                    ShopItemTitle = dataRow.item,
                    Amount = dataRow.amount,
                    PricePerUnit = dataRow.price
                };
                responseDto.SuccesCount++;
                responseDto.SuccesListPoid.Add(dataRow.poid);

                _context.PurchaseOrderItems.Add(purchaseOrderItems);
                _context.SaveChanges();
            }

            return responseDto;
        }

        public List<ClientExport> GetClientData()
        {
            List<ClientExport> clientDataExports = new List<ClientExport>();

            var headers = _context.PurchaseOrderHeaders.ToList();
            foreach (var header in headers)
            {

                double CelkovaCena = 0;
                var purchaseOrder = _context.PurchaseOrderItems.SingleOrDefault(x => x.PurchaserOrderId == header.Id);
                if (purchaseOrder != null)
                {
                    CelkovaCena = purchaseOrder.Amount * purchaseOrder.PricePerUnit;
                }

                clientDataExports.Add(new ClientExport(header, CelkovaCena));
            }

            return clientDataExports;
        }
    }
}
