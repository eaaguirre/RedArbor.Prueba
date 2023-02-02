using AutoMapper;
using Microsoft.Extensions.DependencyInjection;
using RedArbor.Prueba.Crosscutting.Mapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RedArbor.Prueba.Service.WebApi.Extensions.Mapper
{
    public  static class MapperExtensions
    {
        public static  IServiceCollection AddMapper(this IServiceCollection services)
        {
            var mappinConfig = new MapperConfiguration(mc =>
            {
                mc.AddProfile(new MappingProfile());
            });
            IMapper mapper = mappinConfig.CreateMapper();
            services.AddSingleton(mapper);

            return services;
        }

       
    }
}
