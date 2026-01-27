using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using PCM.Backend.Models;

namespace PCM.Backend.Data
{
    public class ApplicationDbContext 
        : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions options)
            : base(options)
        {
        }

        // DbSet sẽ thêm sau
    }
}
