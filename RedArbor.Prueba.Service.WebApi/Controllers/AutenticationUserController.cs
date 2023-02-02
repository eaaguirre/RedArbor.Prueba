using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using RedArbor.Prueba.Application.DTO;
using RedArbor.Prueba.Application.Interface;
using RedArbor.Prueba.Crosscutting.Common;
using RedArbor.Prueba.Service.WebApi.Helpers;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace RedArbor.Prueba.Service.WebApi.Controllers
{
    [Authorize]
    [Route("api/v{version:apiVersion}/[controller]")]
    [ApiController]
    [ApiVersion("1.0")]
    public class AutenticationUserController : Controller
    {
        private readonly IAutenticationUserApplication _autenticationUserApplication;
        private readonly AppSettings _appSettings;
        public AutenticationUserController(IAutenticationUserApplication autenticationUserApplication,IOptions<AppSettings> appSettings)
        {
            _autenticationUserApplication = autenticationUserApplication;
            _appSettings = appSettings.Value;
        }

        [AllowAnonymous]
        [HttpPost("AutenticationUser")]
        public IActionResult Authenticate ([FromBody] AutenticationUserDto autenticationUserDto)
        {

            var response = _autenticationUserApplication.Authenticate(autenticationUserDto.CompanyId,autenticationUserDto.Username, autenticationUserDto.Password);
            if (response.IsSucces)
            {
                if (response.Data != null)
                {
                    response.Data.Token = BuildToken(response);
                    return Ok(response);

                }
                else
                    return NotFound(response);
            }

            return BadRequest(response);

        }

        private string BuildToken(Response<AutenticationUserDto> autenticationUser)
        {

            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_appSettings.Secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                     {
                         new Claim(ClaimTypes.Name, autenticationUser.Data.Username.ToString())

                     }
                ),
                Expires = DateTime.UtcNow.AddMinutes(5),
                SigningCredentials =  new SigningCredentials(new SymmetricSecurityKey(key),SecurityAlgorithms.HmacSha256Signature),
                Issuer = _appSettings.Isseuer,
                Audience = _appSettings.Audicence
                };
               var token = tokenHandler.CreateToken(tokenDescriptor);
            var tokenString = tokenHandler.WriteToken(token);
            return tokenString;
        }
    }
}
