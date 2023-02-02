using System;
using FluentValidation;
using RedArbor.Prueba.Application.DTO;

namespace RedArbor.Prueba.Application.Validator
{
    public class AutenticationUserValidator:AbstractValidator<AutenticationUserDto>
    {
        public AutenticationUserValidator()
        {
            RuleFor(x => x.CompanyId).NotNull().NotEmpty().GreaterThan(0);
            RuleFor(x => x.Username).NotNull().NotEmpty();
            RuleFor(x => x.Password).NotNull().NotEmpty();
        }
    }
}
