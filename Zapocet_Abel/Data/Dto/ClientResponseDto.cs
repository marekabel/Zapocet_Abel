using System.Text.Json.Serialization;

namespace Zapocet_Abel.Data.Dto
{
    public class ClientResponseDto
    {
        public int SuccesCount { get; set; } = 0;
        public int FailedCount { get; set; } = 0;
        public List<String> SuccesListPoid { get; set; } = new List<String>();
        public List<String> FailedListPoid { get; set; } = new List<string>();
 
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public string? Message { get; set; }
    }
}
