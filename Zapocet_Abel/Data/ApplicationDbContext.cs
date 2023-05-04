using Microsoft.EntityFrameworkCore;
using Zapocet_Abel.Data.Model;

namespace Zapocet_Abel.Data

{
    public class ApplicationDbContext:DbContext
    {

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
      : base(options)
        {

        }

       
        public DbSet<CompanyKeys> CompanyKeys { get; set; }
        public DbSet<PurchaseOrderHeaders> PurchaseOrderHeaders { get; set; }
        public DbSet<PurchaseOrderItems> PurchaseOrderItems { get; set; }

        //public DbSet<IdentityToken> IdentityTokens { get; set; }

    }
}
