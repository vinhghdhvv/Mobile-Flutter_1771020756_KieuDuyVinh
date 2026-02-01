using Microsoft.AspNetCore.Mvc;
using PCM.Backend.Data;
using PCM.Backend.Models;

namespace PCM.Backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ClubsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ClubsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/clubs
        [HttpGet]
        public IActionResult GetClubs()
        {
            return Ok(_context.Clubs.ToList());
        }

        // POST: api/clubs
        [HttpPost]
        public IActionResult CreateClub(Club club)
        {
            _context.Clubs.Add(club);
            _context.SaveChanges();
            return Ok(club);
        }
    }
}
