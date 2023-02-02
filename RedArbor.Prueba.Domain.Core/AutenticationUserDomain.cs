using RedArbor.Prueba.Domain.Entity;
using RedArbor.Prueba.Domain.Interface;
using RedArbor.Prueba.Infraestructure.Interface;

namespace RedArbor.Prueba.Domain.Core
{
    public class AutenticationUserDomain : IAutenticationUserDomain
    {
        private readonly IUnitOfWork _unitOfWork;
        public AutenticationUserDomain(IUnitOfWork  unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public AutenticationUser Authenticate(int companyId, string username, string password)
        {
            return _unitOfWork.AutenticationUsers.Authenticate(companyId,username, password);
        }
    }
}
