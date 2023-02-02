using Microsoft.Extensions.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace RedArbor.Prueba.Infraestructure.Data
{
    public  class DapperContext
    {
        private readonly IConfiguration _configuration;
        private readonly string _connectionString;

        public DapperContext(IConfiguration configuration)
        {
            _configuration = configuration;
            _connectionString = configuration.GetConnectionString("RedArborConnection");
        }

        public IDbConnection CreateConnetion() => new SqlConnection(_connectionString);
    }
}
