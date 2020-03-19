namespace demo.fluentmigrator.Core.Migrations
{
    using FluentMigrator;

    [Migration(7)]
    public class AddJobTitleJoinTable : Migration
    {
        public override void Up()
        {
            Create.Table("EmployeeJobTitles")
                .InSchema("Company")
                .WithColumn("EmployeeId").AsInt64().NotNullable()
                .WithColumn("JobTitleId").AsInt64().NotNullable();
        }

        public override void Down()
        {
            Delete.Table("EmployeeJobTitles").InSchema("Company");
        }
    }
}