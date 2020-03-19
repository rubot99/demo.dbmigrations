namespace demo.fluentmigrator.Core.Migrations
{
    using FluentMigrator;

    [Migration(1)]
    public class AddSchema : Migration
    {
        public override void Up()
        {
            Create.Schema("Company");
        }

        public override void Down()
        {
            Delete.Schema("Company");
        }
    }
}