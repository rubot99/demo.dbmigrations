using Microsoft.EntityFrameworkCore;

namespace demo.efcore
{
    using Models;

    public class DemoContent : DbContext
    {
        public DbSet<Department> Departments { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<Address> Addresses { get; set; }
        public DbSet<JobTitle> JobTitles { get; set; }
        public DbSet<EmployeeJobTitle> EmployeeJobTitles { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var connectionString = "Server=GPS-0193\\SQLEXPRESS01;Database=Demo2;Integrated Security=True;";

            optionsBuilder.UseSqlServer(connectionString);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<EmployeeJobTitle>()
                .HasKey(x => new { x.EmployeeId, x.JobTitleId });
            modelBuilder.Entity<EmployeeJobTitle>()
                .HasOne(x => x.Employee)
                .WithMany(x => x.EmployeeJobTitles)
                .HasForeignKey(x => x.EmployeeId);
            modelBuilder.Entity<EmployeeJobTitle>()
                .HasOne(x => x.JobTitle)
                .WithMany(x => x.EmployeeJobTitles)
                .HasForeignKey(x => x.JobTitleId);
        }
    }
}