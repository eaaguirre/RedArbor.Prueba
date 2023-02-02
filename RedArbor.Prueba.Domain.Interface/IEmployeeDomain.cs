using System;
using System.Collections.Generic;
using System.Text;
using RedArbor.Prueba.Domain.Entity;
using System.Threading.Tasks;

namespace RedArbor.Prueba.Domain.Interface
{
    public interface IEmployeeDomain
    {
        #region  Sincronos
        bool Insert(Employee employee);
        bool Update(Employee employee);

        bool Delete(int companyId, int Id);

        Employee GetById(int companyId, int id);

        IEnumerable<Employee> GetAll();

        #endregion

        #region Asyn Methods
        Task<bool> InsertAsync(Employee employee);
        Task<bool> UpdateAsync(Employee employee);

        Task<bool> DeleteAsync(int companyId, int Id);

        Task<Employee> GetByIdAsync(int companyId, int Id);

        Task<IEnumerable<Employee>> GetAllAsync();

        #endregion
    }
}
