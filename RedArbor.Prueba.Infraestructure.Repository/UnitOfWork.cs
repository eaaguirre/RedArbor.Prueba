using RedArbor.Prueba.Infraestructure.Interface;

namespace RedArbor.Prueba.Infraestructure.Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        public IEmployeeRepository Employees { get; }

        public IAutenticationUserRepository  AutenticationUsers { get; }
        public UnitOfWork(IEmployeeRepository employees, IAutenticationUserRepository autenticationUsers)
        {
            Employees = employees;
            AutenticationUsers = autenticationUsers;
        }

        public void Dispose()
        {
            System.GC.SuppressFinalize(this);
        }
    }
}
