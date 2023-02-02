using System.Collections.Generic;
using System.Threading.Tasks;

namespace RedArbor.Prueba.Infraestructure.Interface
{
    public  interface IGenericRepository<T> where T : class 
    {

        #region  Sincronos
        bool Insert(T entity);
        bool Update(T entity);

        bool Delete(int companyId, int Id);

        T GetById(int companyId, int id);

        IEnumerable<T> GetAll();

        #endregion

        #region Asyn Methods
        Task<bool> InsertAsync(T entity);
        Task<bool> UpdateAsync(T entity);

        Task<bool> DeleteAsync(int companyId, int Id);

        Task<T> GetByIdAsync(int companyId, int Id);

        Task<IEnumerable<T>> GetAllAsync();

        #endregion

    }


}
