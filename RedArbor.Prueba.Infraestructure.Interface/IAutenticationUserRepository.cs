using RedArbor.Prueba.Domain.Entity;

namespace RedArbor.Prueba.Infraestructure.Interface
{
    public interface IAutenticationUserRepository
    {
        AutenticationUser Authenticate(int companyId,string username, string pasword);
        
    }
}
