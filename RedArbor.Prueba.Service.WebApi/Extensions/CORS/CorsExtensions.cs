using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace RedArbor.Prueba.Service.WebApi.Extensions.CORS
{
    public  static class CorsExtensions
    {

        public static IServiceCollection AddCors(this IServiceCollection services,IConfiguration configuration)
        {

           string policy = "PolicyPrueba";
            services.AddCors(options => options.AddPolicy(policy, builder => builder.WithOrigins(configuration["Config:OriginCors"])
                                                                                   .AllowAnyHeader()
                                                                                    .AllowAnyMethod()));
            services.AddMvc();

            return services;
        }
    }
}
