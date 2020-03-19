namespace demo.efcore.Models
{
    public class EmployeeJobTitle
    {
        public int EmployeeId { get; set; }

        public Employee Employee { get; set; }

        public int JobTitleId { get; set; }

        public JobTitle JobTitle { get; set; }
    }
}