namespace demo.efcore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using Microsoft.EntityFrameworkCore.Metadata.Internal;

    public class JobTitle
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(255)]
        public string Title { get; set; }

        [Required]
        public DateTime Created { get; set; } = DateTime.UtcNow;

        public ICollection<EmployeeJobTitle> EmployeeJobTitles { get; set; }
    }
}