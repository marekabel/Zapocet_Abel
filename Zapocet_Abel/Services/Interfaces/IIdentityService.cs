using Microsoft.EntityFrameworkCore;
using Zapocet_Abel.Data;
using Zapocet_Abel.Data.Model;

namespace Zapocet_Abel.Services.Interfaces
{
    public interface IIdentityService
    {
        bool TokenisValid(string token);
    }
}
