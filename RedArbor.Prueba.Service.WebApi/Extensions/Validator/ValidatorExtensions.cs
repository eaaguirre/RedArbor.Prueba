using Microsoft.Extensions.DependencyInjection;
using RedArbor.Prueba.Application.Validator;
namespace RedArbor.Prueba.Service.WebApi.Extensions.Validator
{
    public static  class ValidatorExtensions
    {
        public static IServiceCollection  AddValidator(this IServiceCollection services)
        {
            services.AddTransient<AutenticationUserValidator>();
            services.AddTransient<EmployeeDtoValidator>();
            return services;
        }
    }
}
