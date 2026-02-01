namespace PCM.Backend.Models;

public class Court
{
    public int Id { get; set; }
    public string CourtName { get; set; } = "";
    public bool IsAvailable { get; set; } = true;
}
