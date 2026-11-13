using Npgsql;

namespace TaskManager.Api.Tests;

public sealed class PostgreSqlSmokeTests
{
    [Fact]
    public async Task Configured_database_is_postgresql_18()
    {
        var connectionString = Environment.GetEnvironmentVariable("POSTGRES_TEST_CONNECTION_STRING");
        Assert.False(string.IsNullOrWhiteSpace(connectionString), "Run the verification script to start the disposable PostgreSQL 18 service.");

        await using var dataSource = NpgsqlDataSource.Create(connectionString);
        await using var command = dataSource.CreateCommand("SHOW server_version_num");
        var version = (string?)await command.ExecuteScalarAsync();

        Assert.NotNull(version);
        Assert.StartsWith("18", version);
    }
}
