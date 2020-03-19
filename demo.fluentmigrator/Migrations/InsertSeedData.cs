namespace demo.fluentmigrator.Core.Migrations
{
    using FluentMigrator;

    [Migration(8)]
    public class InsertSeedData : Migration
    {
        public override void Up()
        {
            Insert
                .IntoTable("JobTitles")
                .InSchema("Company")
                .Row(new { Title = "Manager" })
                .Row(new { Title = "QA" })
                .Row(new { Title = "Developer" })
                .Row(new { Title = "Dba" });

        }

        public override void Down()
        {
            Delete.FromTable("JobTitles").InSchema("Company").AllRows();
        }
    }
}