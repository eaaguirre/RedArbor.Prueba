using RedArbor.Prueba.Application.DTO;
using RedArbor.Prueba.Crosscutting.Common;

namespace RedArbor.Prueba.Application.Interface
{
    public  interface IAutenticationUserApplication
    {
        Response<AutenticationUserDto> Authenticate(int companyId, string username, string password);
    }
}
