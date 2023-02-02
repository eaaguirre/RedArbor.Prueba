using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using RedArbor.Prueba.Application.DTO;
using RedArbor.Prueba.Application.Interface;
using System.Threading.Tasks;

namespace RedArbor.Prueba.Service.WebApi.Controllers
{
    [Authorize(AuthenticationSchemes = "Bearer")]
    [Route("api/v{version:apiVersion}/[controller]")]
    [ApiVersion("1.0")]
    [ApiController]
    public class EmployeeController : Controller
    {

        private readonly IEmployeeApplication _employeeApplication;

        public EmployeeController(IEmployeeApplication employeeApplication)
        {
            _employeeApplication = employeeApplication;
        }

        #region  metodos Sincronos

        [HttpPost("Insert")]
        public IActionResult Insert([FromBody]EmployeeDto employeeDto)
        {
            if (employeeDto == null)
                return BadRequest();

            var response = _employeeApplication.Insert(employeeDto);

            if (response.IsSucces)
                return Ok(response);

            return BadRequest(response);
     
        }

        [HttpPut("Update")]
        public IActionResult Update([FromBody] EmployeeDto employeeDto)
        {
            if (employeeDto == null)
                return BadRequest();

            var response = _employeeApplication.Update(employeeDto);

            if (response.IsSucces)
                return Ok(response);

            return BadRequest(response.Message);

        }

        [HttpDelete("Delete/{CompanyId}/{Id}")]
        public IActionResult Delete(int CompanyId,int Id)
        {

            if (Id < 0)
                return BadRequest();

            var response = _employeeApplication.Delete(CompanyId, Id);

            if (response.IsSucces)
                return Ok(response);

            return BadRequest(response.Message);

        }

        [HttpGet("Get/{CompanyId}/{Id}")]
        public IActionResult Get(int CompanyId, int Id)
        {

            if (Id < 0)
                return BadRequest();

            var response = _employeeApplication.GetById(CompanyId, Id);

            if (response.IsSucces)
                return Ok(response);

            return BadRequest(response.Message);

        }

        [HttpGet("GetAll")]
        public IActionResult GetAll()
        {

    
            var response = _employeeApplication.GetAll();

            if (response.IsSucces)
                return Ok(response);

            return BadRequest(response.Message);

        }
        #endregion

        #region metodos Asynconros


        [HttpPost("InsertAsync")]
        public async  Task<IActionResult> InsertAsync([FromBody] EmployeeDto employeeDto)
        {
            if (employeeDto == null)
                return BadRequest();

            var response = await  _employeeApplication.InsertAsync(employeeDto);

            if (response.IsSucces)
                return Ok(response);

            return BadRequest(response.Message);

        }

        [HttpPut("UpdateAsync")]
        public async Task<IActionResult> UpdateAsync([FromBody] EmployeeDto employeeDto)
        {
            if (employeeDto == null)
                return BadRequest();

            var response =  await _employeeApplication.UpdateAsync(employeeDto);

            if (response.IsSucces)
                return Ok(response);

            return BadRequest(response.Message);

        }


        [HttpDelete("DeleteAsync/{CompanyId}/{Id}")]
        public async Task<IActionResult> DeleteAsync(int CompanyId, int Id)
        {

            if (Id < 0)
                return BadRequest();

            var response = await _employeeApplication.DeleteAsync(CompanyId, Id);

            if (response.IsSucces)
                return Ok(response);

            return BadRequest(response.Message);

        }

     
        [HttpGet("GetAsync/{CompanyId}/{Id}")]
        public async Task<IActionResult> GetAsync(int CompanyId, int Id)
        {

            if (Id < 0)
                return BadRequest();

            var response = await _employeeApplication.GetByIdAsync(CompanyId, Id);

            if (response.IsSucces)
                return Ok(response);

            return BadRequest(response.Message);

        }

        [HttpGet("GetAllAsync")]
        public async Task<IActionResult> GetAllAsync()
        {


            var response =  await _employeeApplication.GetAllAsync();

            if (response.IsSucces)
                return Ok(response);

            return BadRequest(response.Message);

        }



        #endregion
    }
}
