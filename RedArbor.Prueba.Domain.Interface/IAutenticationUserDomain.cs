using RedArbor.Prueba.Domain.Entity;

namespace RedArbor.Prueba.Domain.Interface
{
    public interface IAutenticationUserDomain
    {
        AutenticationUser Authenticate(int companyId, string username, string password);
    }
}
