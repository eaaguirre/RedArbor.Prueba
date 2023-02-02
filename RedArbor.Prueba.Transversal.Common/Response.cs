using FluentValidation.Results;
using System.Collections.Generic;
namespace RedArbor.Prueba.Crosscutting.Common
{
    public class Response<T>
    {
        public T Data { get; set; }
        public bool IsSucces { get; set; }

        public string Message { get; set; }
        public IEnumerable<ValidationFailure> RulesErrors { get; set; }
    }

}
