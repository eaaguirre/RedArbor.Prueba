using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using RedArbor.Prueba.Domain.Entity;
using RedArbor.Prueba.Domain.Interface;
using RedArbor.Prueba.Infraestructure.Interface;

namespace RedArbor.Prueba.Domain.Core
{
    public class EmployeeDomain : IEmployeeDomain
    {

        private readonly IUnitOfWork _unitOfWork;

        public EmployeeDomain(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public bool Delete(int companyId, int Id)
        {
            return _unitOfWork.Employees.Delete(companyId, Id);
        }

        public async  Task<bool> DeleteAsync(int companyId, int Id)
        {
            return await _unitOfWork.Employees.DeleteAsync(companyId, Id);
        }

        public IEnumerable<Employee> GetAll()
        {
            return _unitOfWork.Employees.GetAll();
        }

        public async Task<IEnumerable<Employee>> GetAllAsync()
        {
            return await _unitOfWork.Employees.GetAllAsync();
        }

        public Employee GetById(int companyId, int id)
        {
            return _unitOfWork.Employees.GetById(companyId, id);
        }

        public async Task<Employee> GetByIdAsync(int companyId, int Id)
        {
            return  await _unitOfWork.Employees.GetByIdAsync(companyId, Id);
        }

        public bool Insert(Employee employee)
        {
            return _unitOfWork.Employees.Insert(employee);
        }

        public async Task<bool> InsertAsync(Employee employee)
        {
            return  await _unitOfWork.Employees.InsertAsync(employee);
        }

        public bool Update(Employee employee)
        {
            return _unitOfWork.Employees.Update(employee);
        }

        public async Task<bool> UpdateAsync(Employee employee)
        {
            return await _unitOfWork.Employees.UpdateAsync(employee);
        }
    }
}
