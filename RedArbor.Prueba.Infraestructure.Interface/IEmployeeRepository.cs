using RedArbor.Prueba.Domain.Entity;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace RedArbor.Prueba.Infraestructure.Interface
{
    public interface IEmployeeRepository:IGenericRepository<Employee>
    {
          Employee GetByUserName(string userName, int companyId);
    }
}
