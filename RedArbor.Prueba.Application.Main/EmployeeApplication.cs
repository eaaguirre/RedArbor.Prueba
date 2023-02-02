using System;
using AutoMapper;
using RedArbor.Prueba.Application.DTO;
using RedArbor.Prueba.Application.Interface;
using RedArbor.Prueba.Domain.Entity;
using RedArbor.Prueba.Domain.Interface;
using RedArbor.Prueba.Crosscutting.Common;
using System.Threading.Tasks;
using System.Collections.Generic;
using RedArbor.Prueba.Application.Validator;

namespace RedArbor.Prueba.Application.Main
{
    public class EmployeeApplication:IEmployeeApplication
    {
        private readonly IEmployeeDomain _employeeDomain;
        private readonly IMapper _mapper;
        private readonly EmployeeDtoValidator _employeeValidator;
        public EmployeeApplication(IEmployeeDomain employeeDomain, IMapper mapper, EmployeeDtoValidator employeeValidator)
        {

            _employeeDomain = employeeDomain;
            _mapper = mapper;
            _employeeValidator = employeeValidator;

        }

        public Response<bool> Delete(int companyId, int Id)
        {
            var response = new Response<bool>();
            try
            {
                
                response.Data = _employeeDomain.Delete(companyId,Id);
                if (response.Data)
                {
                    response.IsSucces = true;
                    response.Message = "Se ha Eliminado el Empleado Correctamente";
                }
            }
            catch (Exception ex)
            {

                response.Message = ex.Message;
            }

            return response;
        }

        public  async  Task<Response<bool>> DeleteAsync(int companyId, int Id)
        {
            var response = new Response<bool>();
            try
            {

                response.Data = await _employeeDomain.DeleteAsync(companyId, Id);
                if (response.Data)
                {
                    response.IsSucces = true;
                    response.Message = "Se ha Eliminado el Empleado Correctamente";
                }
            }
            catch (Exception ex)
            {

                response.Message = ex.Message;
            }

            return response;
        }

        public Response<IEnumerable<EmployeeDto>> GetAll()
        {
            var response = new Response<IEnumerable<EmployeeDto>>();
            try
            {
                var employees = _employeeDomain.GetAll();

                response.Data = _mapper.Map<IEnumerable<EmployeeDto>>(employees);
                if (response.Data != null)
                {
                    response.IsSucces = true;
                    response.Message = "Consulta Exitosa";
                   
                }
            }
            catch (Exception ex)
            {

                response.Message = ex.Message;
                
            }

            return response;
        }

        public async Task<Response<IEnumerable<EmployeeDto>>> GetAllAsync()
        {
            var response = new Response<IEnumerable<EmployeeDto>>();
            try
            {
                var employees =  await _employeeDomain.GetAllAsync();

                response.Data = _mapper.Map<IEnumerable<EmployeeDto>>(employees);
                if (response.Data != null)
                {
                    response.IsSucces = true;
                    response.Message = "Consulta Exitosa";
                }
            }
            catch (Exception ex)
            {

                response.Message = ex.Message;
            }

            return response;
        }

        public Response<EmployeeDto> GetById(int companyId, int id)
        {
            var response = new Response<EmployeeDto>();
            try
            {
                var empoyee = _employeeDomain.GetById(companyId, id);

                response.Data = _mapper.Map<EmployeeDto>(empoyee);
                if (response.Data != null)
                {
                    response.IsSucces = true;
                    response.Message = "Consulta Exitosa";
                }
            }
            catch (Exception ex)
            {

                response.Message = ex.Message;
            }

            return response;
        }

        public async  Task<Response<EmployeeDto>> GetByIdAsync(int companyId, int Id)
        {
            var response = new Response<EmployeeDto>();
            try
            {
                var employee = await  _employeeDomain.GetByIdAsync(companyId, Id);

                response.Data = _mapper.Map<EmployeeDto>(employee);
                if (response.Data != null)
                {
                    response.IsSucces = true;
                    response.Message = "Consulta Exitosa";
                }
            }
            catch (Exception ex)
            {

                response.Message = ex.Message;
            }

            return response;
        }

        public Response<bool> Insert(EmployeeDto employeeDto)
        {
            var response = new Response<bool>();
            response= ValidateRequestInsertEmployee(employeeDto);
            if (!response.IsSucces)
                return response;

            try
            {
                var employee = _mapper.Map<Employee>(employeeDto);
                response.Data = _employeeDomain.Insert(employee);
                if (!response.Data)
                {
                    response.IsSucces = true;
                    response.Message = "Usuario Ya existe  para la compañia:"+ employee.CompanyId;
                }
                else
                {
                    response.IsSucces = true;
                    response.Message = "Se ha Creado el Empleado Correctamente";
                }
            }
            catch (Exception ex)
            {

                response.Message = ex.Message;
            }

            return response;
        }

        public async Task<Response<bool>> InsertAsync(EmployeeDto employeeDto)
        {
            var response = new Response<bool>();
            response = ValidateRequestInsertEmployee(employeeDto);
            if (!response.IsSucces)
                return response;

            try
            {
                var employee = _mapper.Map<Employee>(employeeDto);
                response.Data =  await _employeeDomain.InsertAsync(employee);
                if (!response.Data)
                {
                    response.IsSucces = true;
                    response.Message = "Usuario Ya existe  para la compañia:" + employee.CompanyId;
                }
                else
                {
                    response.IsSucces = true;
                    response.Message = "Se ha Creado el Empleado Correctamente";
                }
            }
            catch (Exception ex)
            {

                response.Message = ex.Message;
            }

            return response;
        }

        public Response<bool> Update(EmployeeDto employeeDto)
        {
             var response = new Response<bool>();
            try
            {
                var employee = _mapper.Map<Employee>(employeeDto);
                response.Data = _employeeDomain.Update(employee);
                if (response.Data)
                {
                    response.IsSucces = true;
                    response.Message = "Se ha Actualizado el Empleado Correctamente";
                }
            }
            catch (Exception ex)
            {

                response.Message = ex.Message;
            }

            return response;
        }

        public async Task<Response<bool>> UpdateAsync(EmployeeDto employeeDto)
        {
            var response = new Response<bool>();
            try
            {
                var employee = _mapper.Map<Employee>(employeeDto);
                response.Data = await  _employeeDomain.UpdateAsync(employee);
                if (response.Data)
                {
                    response.IsSucces = true;
                    response.Message = "Se ha Actualizado el Empleado Correctamente";
                }
            }
            catch (Exception ex)
            {

                response.Message = ex.Message;
            }

            return response;
        }

        private Response<bool> ValidateRequestInsertEmployee(EmployeeDto employeeDto)
        {
            var response = new Response<bool>();
            response.IsSucces = true;
            var validation = _employeeValidator.Validate(new EmployeeDto
            {
                CompanyId = employeeDto.CompanyId,
                Email = employeeDto.Email,
                Password = employeeDto.Password,
                PortalId = employeeDto.PortalId,
                RoleId = employeeDto.RoleId,
                StatusId = employeeDto.StatusId,
                Username = employeeDto.Username,
            });

            if (!validation.IsValid)
            {
                response.Message = "Error validation";
                response.RulesErrors = validation.Errors;
                response.IsSucces = false;
                return response;

            }
          

            return response;

        }
    }
}
