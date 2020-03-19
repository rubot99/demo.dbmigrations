namespace demo.efcore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class Department
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(255)]
        public string Name { get; set; }

        [Required]
        public DateTime Created { get; set; } = DateTime.UtcNow;

        public ICollection<Employee> Employees { get; set; }
    }
}
