using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client;
using Zapocet_Abel.Data;
using Zapocet_Abel.Data.Model;
using Zapocet_Abel.Services.Interfaces;
using Zapocet_Abel.Filters;
using Zapocet_Abel.Data.Dto;

namespace Zapocet_Abel.Controllers
{
    [ApiController]
    [Route("Clients")]
    public class ClientControler : Controller
    {
        IClientService _clientService;
        public ClientControler(IClientService clientService)
        {
            _clientService = clientService;
        }
        [IdentityFilter]
        [HttpPost]
        [Route("Add")]
        public IActionResult PostData(List<ClientDto> ClientDto)
        {
            return Ok(_clientService.AddClientData(ClientDto));
        }
        [IdentityFilter]
        [HttpGet]
        [Route("Get")]
        public IActionResult GetData()
        {
            return Ok(_clientService.GetClientData());
        }
    }
}