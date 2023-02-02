using System;
using AutoMapper;
using RedArbor.Prueba.Domain.Entity;
using RedArbor.Prueba.Application.DTO;

namespace RedArbor.Prueba.Crosscutting.Mapper
{
    public class MappingProfile:Profile
    {

        public MappingProfile()
        {
            CreateMap<Employee, EmployeeDto>().ReverseMap();
            CreateMap<AutenticationUser, AutenticationUserDto>().ReverseMap();

        }
    }
}
