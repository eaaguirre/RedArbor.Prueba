using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using RedArbor.Prueba.Application.DTO;
using RedArbor.Prueba.Crosscutting.Common;

namespace RedArbor.Prueba.Application.Interface
{
   public  interface IEmployeeApplication
    {

        #region  Sincronos
        Response<bool> Insert(EmployeeDto employeeDto);
        Response<bool> Update(EmployeeDto employeeDto);

        Response<bool> Delete(int companyId, int Id);

        Response<EmployeeDto> GetById(int companyId, int id);

        Response<IEnumerable<EmployeeDto>> GetAll();

        #endregion

        #region Asyn Methods
        Task<Response<bool>> InsertAsync(EmployeeDto employee);
        Task<Response<bool>> UpdateAsync(EmployeeDto employee);

        Task<Response<bool>> DeleteAsync(int companyId, int Id);

        Task<Response<EmployeeDto>> GetByIdAsync(int companyId, int Id);

        Task<Response<IEnumerable<EmployeeDto>>> GetAllAsync();

        #endregion
    }
}
