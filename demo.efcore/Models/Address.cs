namespace demo.efcore.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;

    public class Address
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(255)]
        public string Street { get; set; }

        [Required]
        [MaxLength(255)]
        public string Town { get; set; }

        [Required]
        [MaxLength(255)]
        public string Postcode { get; set; }

        [Required]
        public DateTime Created { get; set; } = DateTime.UtcNow;

        [Required]
        public int EmployeeId { get; set; }

        public Employee Employee { get; set; }
    }
}