using Microsoft.AspNetCore.Mvc;
using PCM.Backend.Data;
using PCM.Backend.Models;

namespace PCM.Backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MembersController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public MembersController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/members
        [HttpGet]
        public IActionResult GetMembers()
        {
            return Ok(_context.Members.ToList());
        }

        // POST: api/members
        [HttpPost]
        public IActionResult CreateMember(Member member)
        {
            _context.Members.Add(member);
            _context.SaveChanges();
            return Ok(member);
        }

        // PUT: api/members/5
        [HttpPut("{id}")]
        public IActionResult UpdateMember(int id, Member member)
        {
            var m = _context.Members.Find(id);
            if (m == null) return NotFound();

            m.FullName = member.FullName;
            m.Email = member.Email;
            m.Phone = member.Phone;

            _context.SaveChanges();
            return Ok(m);
        }

        // DELETE: api/members/5
        [HttpDelete("{id}")]
        public IActionResult DeleteMember(int id)
        {
            var m = _context.Members.Find(id);
            if (m == null) return NotFound();

            _context.Members.Remove(m);
            _context.SaveChanges();
            return Ok();
        }
    }
}
