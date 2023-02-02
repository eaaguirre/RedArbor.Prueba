using System;
using FluentValidation;
using RedArbor.Prueba.Application.DTO;
namespace RedArbor.Prueba.Application.Validator
{
    public class EmployeeDtoValidator:AbstractValidator<EmployeeDto>
    {
        public EmployeeDtoValidator()
        {
            RuleFor(x => x.CompanyId).NotNull().NotEmpty().GreaterThan(0);
            RuleFor(x => x.Email).NotNull().NotEmpty();
            RuleFor(x => x.Password).NotNull().NotEmpty();
            RuleFor(x => x.PortalId).NotNull().NotEmpty().GreaterThan(0);
            RuleFor(x => x.RoleId).NotNull().NotEmpty().GreaterThan(0);
            RuleFor(x => x.StatusId).NotNull().NotEmpty().GreaterThan(0);
            RuleFor(x => x.Username).NotNull().NotEmpty();
        }

       
    }
}
