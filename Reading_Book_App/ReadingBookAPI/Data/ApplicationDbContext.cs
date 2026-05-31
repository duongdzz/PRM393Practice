using Microsoft.EntityFrameworkCore;
using ReadingBookAPI.Models;

namespace ReadingBookAPI.Data;

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(
        DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }

    public DbSet<Book> Books { get; set; }
}