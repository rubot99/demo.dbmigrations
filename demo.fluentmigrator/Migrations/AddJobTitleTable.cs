namespace demo.fluentmigrator.Core.Migrations
{
    using System;
    using FluentMigrator;

    [Migration(5)]
    public class AddJobTitleTable : Migration
    {
        public override void Up()
        {
            Create.Table("JobTitles")
                .InSchema("Company")
                .WithColumn("Id").AsInt64().PrimaryKey().Identity()
                .WithColumn("Title").AsString(255).NotNullable()
                .WithColumn("Created").AsDateTime().NotNullable().WithDefaultValue(DateTime.UtcNow);
        }

        public override void Down()
        {
            Delete.Table("JobTitles").InSchema("Company");
        }
    }
}