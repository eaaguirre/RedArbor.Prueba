using Dapper;
using RedArbor.Prueba.Domain.Entity;
using RedArbor.Prueba.Infraestructure.Data;
using RedArbor.Prueba.Infraestructure.Interface;
using System.Data;

namespace RedArbor.Prueba.Infraestructure.Repository
{
    public class AutenticationUserRepository : IAutenticationUserRepository
    {
        private readonly DapperContext _dapperContext;
        public AutenticationUserRepository(DapperContext dapperContext )
        {
            _dapperContext = dapperContext;
        }
        public AutenticationUser Authenticate( int companyId,string username, string password)
        {
            using (var connection = _dapperContext.CreateConnetion())
            {
                var query = "EmployeeGetByUserAndPassword";
                var parameters = new DynamicParameters();
                parameters.Add("CompanyId", companyId);
                parameters.Add("Username", username);
                parameters.Add("Password", password);

                var autenticacionUser = connection.QuerySingle<AutenticationUser>(query, param: parameters, commandType: CommandType.StoredProcedure);
                return autenticacionUser;
            }
        }
    }
}
