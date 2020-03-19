namespace demo.efcore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class Employee
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(255)]
        public string Firstname { get; set; }

        [Required]
        [MaxLength(255)]
        public string Lastname { get; set; }

        [Required]
        public DateTime Created { get; set; } = DateTime.UtcNow;

        [Required]
        public int DepartmentId { get; set; }

        public int Age { get; set; }

        public Department Department { get; set; }

        public ICollection<EmployeeJobTitle> EmployeeJobTitles { get; set; }
    }
}