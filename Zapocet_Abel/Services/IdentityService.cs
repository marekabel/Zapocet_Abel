using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Net;
using Zapocet_Abel.Data;
using Zapocet_Abel.Data.Model;
using Zapocet_Abel.Services.Interfaces;
using Microsoft.Extensions.Options;


namespace Zapocet_Abel.Services
{
    public class IdentityService:MasterService, IIdentityService
    {
        public IdentityService(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public bool TokenisValid(string token)
        {
            var result = _context.CompanyKeys
                .Where(x => x.CompanyHash.Equals(token))
                .Any();

            return result;
        }
        
    }
}
