namespace demo.fluentmigrator.Core.Migrations
{
    using System;
    using System.Data;
    using FluentMigrator;

    [Migration(4)]
    public class AddAddressTable : Migration
    {
        public override void Up()
        {
            Create.Table("Addresses")
                .InSchema("Company")
                .WithColumn("Id").AsInt64().PrimaryKey().Identity()
                .WithColumn("Street").AsString(255).NotNullable()
                .WithColumn("Town").AsString(255).NotNullable()
                .WithColumn("Postcode").AsString(255).NotNullable()
                .WithColumn("EmployeeId").AsInt64().NotNullable()
                .WithColumn("Created").AsDateTime().NotNullable().WithDefaultValue(DateTime.UtcNow);

            Create.ForeignKey("fk_Addresses_EmployeeId_Employee_Id")
                .FromTable("Addresses").InSchema("Company").ForeignColumn("EmployeeId")
                .ToTable("Employees").InSchema("Company").PrimaryColumn("Id")
                .OnDeleteOrUpdate(Rule.Cascade);
        }

        public override void Down()
        {
            Delete.Table("Addresses").InSchema("Company");
        }
    }
}