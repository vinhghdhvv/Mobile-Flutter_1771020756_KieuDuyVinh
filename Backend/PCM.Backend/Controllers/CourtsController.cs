using Microsoft.AspNetCore.Mvc;
using PCM.Backend.Data;
using PCM.Backend.Models;

namespace PCM.Backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CourtsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public CourtsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/courts
        [HttpGet]
        public IActionResult GetCourts()
        {
            return Ok(_context.Courts.ToList());
        }

        // POST: api/courts
        [HttpPost]
        public IActionResult CreateCourt(Court court)
        {
            _context.Courts.Add(court);
            _context.SaveChanges();
            return Ok(court);
        }
    }
}
