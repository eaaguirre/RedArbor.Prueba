using AutoMapper;
using RedArbor.Prueba.Application.DTO;
using RedArbor.Prueba.Application.Interface;
using RedArbor.Prueba.Crosscutting.Common;
using RedArbor.Prueba.Domain.Interface;
using System;
using RedArbor.Prueba.Application.Validator;
namespace RedArbor.Prueba.Application.Main
{
    public class AutenticationUserApplication : IAutenticationUserApplication
    {
        private readonly IAutenticationUserDomain _autenticationUserDomain;
        private readonly IMapper _mapper;
        private readonly AutenticationUserValidator _autenticationUserValidator;
        public AutenticationUserApplication(IAutenticationUserDomain autenticationUserDomain, IMapper mapper, AutenticationUserValidator autenticationUserValidator)
        {
            _autenticationUserDomain = autenticationUserDomain;
            _mapper = mapper;
            _autenticationUserValidator = autenticationUserValidator;
        }
        public Response<AutenticationUserDto> Authenticate(int companyId, string username, string password)
        {
            var response = new Response<AutenticationUserDto>();
            var validation = _autenticationUserValidator.Validate(new AutenticationUserDto(){ CompanyId = companyId,Username = username, Password=password});
            if (!validation.IsValid)
            {
                response.Message = "Error validation";
                response.RulesErrors = validation.Errors;
                return response;

            }
            try
            {
                var autenticationUser = _autenticationUserDomain.Authenticate(companyId,username, password);
                response.Data = _mapper.Map<AutenticationUserDto>(autenticationUser);
                response.IsSucces = true;
                response.Message = "Usuario Autenticado con Exito";
            }
            catch(InvalidOperationException e)
            {
                response.IsSucces = true;
                response.Message = "Usuario no encontrado";
            }
            catch (Exception ex)
            {
                response.Message = ex.Message;
                
            }

            return response;
        }
    }
}
