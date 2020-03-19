namespace demo.fluentmigrator.Core.Migrations
{
    using System;
    using FluentMigrator;

    [Migration(3)]
    public class AddEmployeeTable : Migration
    {
        public override void Up()
        {
            Create.Table("Employees")
                .InSchema("Company")
                .WithColumn("Id").AsInt64().PrimaryKey().Identity()
                .WithColumn("Firstname").AsString(255).NotNullable()
                .WithColumn("Lastname").AsString(255).NotNullable()
                .WithColumn("DepartmentId").AsInt64().NotNullable()
                .WithColumn("Created").AsDateTime().NotNullable().WithDefaultValue(DateTime.UtcNow);

            Create.ForeignKey("fk_Employees_DepartmentId_Departments_Id")
                .FromTable("Employees").InSchema("Company").ForeignColumn("DepartmentId")
                .ToTable("Departments").InSchema("Company").PrimaryColumn("Id");

        }

        public override void Down()
        {
            Delete.Table("Employees").InSchema("Company");
        }
    }
}