using System;

namespace PCM.Backend.Models
{
    public class Booking
    {
        public int Id { get; set; }

        public int MemberId { get; set; }
        public int CourtId { get; set; }

        public DateTime BookingDate { get; set; }
        public int DurationHours { get; set; }
    }
}
