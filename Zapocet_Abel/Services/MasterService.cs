using Zapocet_Abel.Data;


namespace Zapocet_Abel.Services
{
    public class MasterService
    {
        internal ApplicationDbContext _context;
        public MasterService(ApplicationDbContext context)
        {
            _context = context;
        }
    }
}
