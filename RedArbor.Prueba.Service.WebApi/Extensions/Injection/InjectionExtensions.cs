using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using RedArbor.Prueba.Application.Interface;
using RedArbor.Prueba.Application.Main;
using RedArbor.Prueba.Crosscutting.Common;
using RedArbor.Prueba.Crosscutting.Logging;
using RedArbor.Prueba.Domain.Core;
using RedArbor.Prueba.Domain.Interface;
using RedArbor.Prueba.Infraestructure.Data;
using RedArbor.Prueba.Infraestructure.Interface;
using RedArbor.Prueba.Infraestructure.Repository;

namespace RedArbor.Prueba.Service.WebApi.Extensions.Injection
{
    public static  class InjectionExtensions
    {
        public static IServiceCollection AddInjection(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddSingleton<IConfiguration>(configuration);
            services.AddSingleton<DapperContext>();
            services.AddScoped<IEmployeeApplication, EmployeeApplication>();
            services.AddScoped<IEmployeeDomain, EmployeeDomain>();
            services.AddScoped<IEmployeeRepository, EmployeeRepository>();
            services.AddScoped<IAutenticationUserApplication, AutenticationUserApplication>();
            services.AddScoped<IAutenticationUserDomain, AutenticationUserDomain>();
            services.AddScoped<IAutenticationUserRepository, AutenticationUserRepository>();
            services.AddScoped(typeof(IApiLogger<>), typeof(LoggerAdapter<>));
            services.AddScoped<IUnitOfWork, UnitOfWork>();



            return services;
        }
    }
}
