namespace demo.fluentmigrator.Core.Migrations
{
    using FluentMigrator;

    [Migration(6)]
    public class UpdateAddressTable : Migration
    {
        public override void Up()
        {
            Create
                .Column("HouseNo").OnTable("Addresses").InSchema("Company").AsString(255).Nullable();
        }

        public override void Down()
        {
            Delete
                .Column("HouseNo").FromTable("Addresses").InSchema("Company");
        }
    }
}