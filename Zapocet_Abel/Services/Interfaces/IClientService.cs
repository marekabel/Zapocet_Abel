using Microsoft.EntityFrameworkCore;
using Zapocet_Abel.Data;
using Zapocet_Abel.Data.Dto;
using Zapocet_Abel.Data.Model;


namespace Zapocet_Abel.Services.Interfaces
{
    public interface IClientService
    {
        ClientResponseDto AddClientData(List<ClientDto> clientDataDto);

        List<ClientExport> GetClientData();

    }
}
