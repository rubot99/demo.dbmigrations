using Microsoft.EntityFrameworkCore.Migrations;

namespace demo.efcore.Migrations
{
    public partial class updatedEmployeeTableToAddEnabledField : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "Enabled",
                table: "Employees",
                nullable: false,
                defaultValue: false);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Enabled",
                table: "Employees");
        }
    }
}
