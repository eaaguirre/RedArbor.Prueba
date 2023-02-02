using System;

namespace RedArbor.Prueba.Infraestructure.Interface
{
    public  interface IUnitOfWork:IDisposable
    {
        IEmployeeRepository Employees { get; }
        IAutenticationUserRepository AutenticationUsers { get; }
    }
}
