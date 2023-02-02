using Dapper;
using RedArbor.Prueba.Domain.Entity;
using RedArbor.Prueba.Infraestructure.Data;
using RedArbor.Prueba.Infraestructure.Interface;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace RedArbor.Prueba.Infraestructure.Repository
{
    public class EmployeeRepository:IEmployeeRepository
    {
        private readonly DapperContext _context;

        public EmployeeRepository(DapperContext  context)
        {
            _context = context;
        }

        public bool Insert(Employee employee)
        {

            var employeeExist = GetByUserName(employee.Username,employee.CompanyId);
            if (employeeExist == null)
            {
                using (var connection = _context.CreateConnetion())
                {
                    var query = "EmployeeInsert";
                    var parameters = new DynamicParameters();
                    parameters.Add("CompanyId", employee.CompanyId);
                    parameters.Add("Name", employee.Name);
                    parameters.Add("Email", employee.Email);
                    parameters.Add("Telephone", employee.Telephone);
                    parameters.Add("Fax", employee.Fax);
                    parameters.Add("RoleId", employee.RoleId);
                    parameters.Add("Username", employee.Username);
                    parameters.Add("Password", employee.Password);
                    parameters.Add("Lastlogin", employee.Lastlogin);
                    parameters.Add("PortalId", employee.PortalId);
                    parameters.Add("StatusId", employee.StatusId);
                    parameters.Add("CreatedOn", employee.CreatedOn);
                    parameters.Add("UpdatedOn", employee.UpdatedOn);
                    parameters.Add("DeletedOn", employee.DeletedOn);

                    var result = connection.Execute(query, param: parameters, commandType: CommandType.StoredProcedure);

                    return result > 0;

                }
            }
            return false;
        }

        public bool Update(Employee employee)
        {
            using (var connection = _context.CreateConnetion())
            {
                var query = "EmployeeUpdate";
                var parameters = new DynamicParameters();
                parameters.Add("CompanyId", employee.CompanyId);
                parameters.Add("Id", employee.Id);
                parameters.Add("Name", employee.Name);
                parameters.Add("Email", employee.Email);
                parameters.Add("Telephone", employee.Telephone);
                parameters.Add("Fax", employee.Fax);
                parameters.Add("RoleId", employee.RoleId);
                parameters.Add("Username", employee.Username);
                parameters.Add("Password", employee.Password);
                parameters.Add("Lastlogin", employee.Lastlogin);
                parameters.Add("PortalId", employee.PortalId);
                parameters.Add("StatusId", employee.StatusId);
                parameters.Add("CreatedOn", employee.CreatedOn);
                parameters.Add("UpdatedOn", employee.UpdatedOn);
                parameters.Add("DeletedOn", employee.DeletedOn);



                var result = connection.Execute(query, param: parameters, commandType: CommandType.StoredProcedure);

                return result > 0;


            }
        }

        public bool Delete(int companyId, int  idEmployee)
        {
            using (var connection = _context.CreateConnetion())
            {
                var query = "EmployeeDelete";
                var parameters = new DynamicParameters();
                parameters.Add("CompanyId", companyId);
                parameters.Add("Id", idEmployee);
              
                var result = connection.Execute(query, param: parameters, commandType: CommandType.StoredProcedure);

                return result > 0;


            }
        }


        public Employee  GetById(int companyId, int idEmployee)
        {
            using (var connection = _context.CreateConnetion())
            {
                var query = "EmployeeGetByCompanyID_ID";
                var parameters = new DynamicParameters();
                parameters.Add("CompanyId", companyId);
                parameters.Add("Id", idEmployee);

                var employee = connection.QuerySingle<Employee>(query, param: parameters, commandType: CommandType.StoredProcedure);

                return employee;


            }
        }

        public IEnumerable<Employee> GetAll()
        {
            using (var connection = _context.CreateConnetion())
            {
                var query = "EmployeeList";

                var employees = connection.Query<Employee>(query, commandType: CommandType.StoredProcedure);

                return employees;


            }
        }


        public async Task<bool> InsertAsync(Employee employee)
        {

            var employeeExist = GetByUserName(employee.Username, employee.CompanyId);
            if (employeeExist == null)
            {

                using (var connection = _context.CreateConnetion())
                {
                    var query = "EmployeeInsert";
                    var parameters = new DynamicParameters();
                    parameters.Add("CompanyId", employee.CompanyId);
                    parameters.Add("Name", employee.Name);
                    parameters.Add("Email", employee.Email);
                    parameters.Add("Telephone", employee.Telephone);
                    parameters.Add("Fax", employee.Fax);
                    parameters.Add("RoleId", employee.RoleId);
                    parameters.Add("Username", employee.Username);
                    parameters.Add("Password", employee.Password);
                    parameters.Add("Lastlogin", employee.Lastlogin);
                    parameters.Add("PortalId", employee.PortalId);
                    parameters.Add("StatusId", employee.StatusId);
                    parameters.Add("CreatedOn", employee.CreatedOn);
                    parameters.Add("UpdatedOn", employee.UpdatedOn);
                    parameters.Add("DeletedOn", employee.DeletedOn);

                    var result = await connection.ExecuteAsync(query, param: parameters, commandType: CommandType.StoredProcedure);

                    return result > 0;


                }
            }
            return false;
        }

        public async Task<bool> UpdateAsync(Employee employee)
        {
            using (var connection = _context.CreateConnetion())
            {
                var query = "EmployeeUpdate";
                var parameters = new DynamicParameters();
                parameters.Add("CompanyId", employee.CompanyId);
                parameters.Add("Id", employee.Id);
                parameters.Add("Name", employee.Name);
                parameters.Add("Email", employee.Email);
                parameters.Add("Telephone", employee.Telephone);
                parameters.Add("Fax", employee.Fax);
                parameters.Add("RoleId", employee.RoleId);
                parameters.Add("Username", employee.Username);
                parameters.Add("Password", employee.Password);
                parameters.Add("Lastlogin", employee.Lastlogin);
                parameters.Add("PortalId", employee.PortalId);
                parameters.Add("StatusId", employee.StatusId);
                parameters.Add("CreatedOn", employee.CreatedOn);
                parameters.Add("UpdatedOn", employee.UpdatedOn);
                parameters.Add("DeletedOn", employee.DeletedOn);



                var result = await connection.ExecuteAsync(query, param: parameters, commandType: CommandType.StoredProcedure);

                return result > 0;


            }
        }

        public async Task<bool> DeleteAsync(int companyId, int idEmployee)
        {
            using (var connection = _context.CreateConnetion())
            {
                var query = "EmployeeDelete";
                var parameters = new DynamicParameters();
                parameters.Add("CompanyId", companyId);
                parameters.Add("Id", idEmployee);

                var result =  await connection.ExecuteAsync(query, param: parameters, commandType: CommandType.StoredProcedure);

                return result > 0;


            }
        }


        public  async Task<Employee> GetByIdAsync(int companyId, int idEmployee)
        {
            using (var connection = _context.CreateConnetion())
            {
                var query = "EmployeeGetByCompanyID_ID";
                var parameters = new DynamicParameters();
                parameters.Add("CompanyId", companyId);
                parameters.Add("Id", idEmployee);

                var employee = await  connection.QuerySingleAsync<Employee>(query, param: parameters, commandType: CommandType.StoredProcedure);

                return employee;


            }
        }

        public async Task<IEnumerable<Employee>> GetAllAsync()
        {
            using (var connection = _context.CreateConnetion())
            {
                var query = "EmployeeList";

                var employees = await  connection.QueryAsync<Employee>(query, commandType: CommandType.StoredProcedure);

                return employees;


            }
        }

        public Employee GetByUserName(string userName, int companyId)
        {
            using (var connection = _context.CreateConnetion())
            {
                var query = "Select  [CompanyId],[Id],[Name],[Email],[Telephone],[Fax],[RoleId],[Username],[Password],[Lastlogin],[PortalId],[StatusId],[CreatedOn],[UpdatedOn],[DeletedOn]" 
                    + " from Employee"
                    + " where Username = @Username"
                    + "  and  CompanyId = @CompanyId";
                      var parameters = new DynamicParameters();
                parameters.Add("Username", userName);
                parameters.Add("CompanyId", companyId);


                var employee = connection.QuerySingleOrDefault<Employee>(query, parameters);

                return employee;


            }
        }
    }


}

