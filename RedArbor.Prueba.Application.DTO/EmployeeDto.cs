using System;

namespace RedArbor.Prueba.Application.DTO
{
    public class EmployeeDto
    {
        public int CompanyId { get; set; }
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Telephone { get; set; }
        public string Fax { get; set; }
        public int RoleId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public DateTimeOffset Lastlogin { get; set; }
        public int PortalId { get; set; }
        public int StatusId { get; set; }
        public DateTimeOffset CreatedOn { get; set; }
        public DateTimeOffset UpdatedOn { get; set; }

        public DateTimeOffset DeletedOn { get; set; }
    }
}
