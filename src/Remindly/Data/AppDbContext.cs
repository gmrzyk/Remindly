using Microsoft.EntityFrameworkCore;
using System.IO;
using Xamarin.Essentials;

namespace Remindly.Data
{
    public class AppDbContext : DbContext
    {
        public DbSet<Reminder> Reminders { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            var dbPath = Path.Combine(FileSystem.AppDataDirectory, "remindly.db3");
            options.UseSqlite($"Filename={dbPath}");
        }
    }
}