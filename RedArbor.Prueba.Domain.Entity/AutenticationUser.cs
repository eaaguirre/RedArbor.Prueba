using System;
using System.Collections.Generic;
using System.Text;

namespace RedArbor.Prueba.Domain.Entity
{
    public class AutenticationUser
    {

        public int CompanyId { get; set; }
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Telephone { get; set; }
        public string Fax { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public int RoleId { get; set; }
        public int PortalId { get; set; }
        public int StatusId { get; set; }
        public string  Token { get; set; }
    }
}
