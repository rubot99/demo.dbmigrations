namespace demo.fluentmigrator.Core.Migrations
{
    using System;
    using FluentMigrator;

    [Migration(2)]
    public class AddDepartmentTable : Migration
    {
        public override void Up()
        {
            Create.Table("Departments")
                .InSchema("Company")
                .WithColumn("Id").AsInt64().PrimaryKey().Identity()
                .WithColumn("Name").AsString(255).NotNullable()
                .WithColumn("Created").AsDateTime().NotNullable().WithDefaultValue(DateTime.UtcNow);

            Create.Index("ix_Name").OnTable("Departments").InSchema("Company").OnColumn("Name").Ascending()
                .WithOptions().NonClustered();

        }

        public override void Down()
        {
            Delete.Table("Departments").InSchema("Company");
        }
    }
}