using Microsoft.Extensions.Configuration;
using RedArbor.Prueba.Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RedArbor.Prueba.Test.TestHelper
{
    internal  static class TestHelper
    {

        public static IConfiguration GetIConfiguration()
        {
            return new ConfigurationBuilder()
                .AddJsonFile("appsettings.json", optional: true)
                .AddEnvironmentVariables()
                .Build();
        }

        private static int  userCompany()
        {
            Random rd = new Random();
            return  rd.Next(1,500);
        }
        
        public static EmployeeDto  GetMockedEmployeetoList(bool isupdate)
        {
            return new EmployeeDto()
            {
                CompanyId = isupdate ? 1:  userCompany(),
                 Id = 5,
                CreatedOn = DateTimeOffset.Now,
                DeletedOn = DateTimeOffset.Now,
                Email = "prueba@rearbor.com",
                Fax = "101010",
                Lastlogin = DateTimeOffset.Now,
                Name = "New user",
                Password = "123456",
                PortalId = 1,
                RoleId = 1,
                StatusId = 1,
                Telephone = "555555555",
                UpdatedOn = DateTimeOffset.Now,
                Username = isupdate ? "Edinson.Aguirre" : "user.name"+userCompany(),
            };
        }

        public static EmployeeDto GetMockedEmployeetoListWithoutFields()
        {
            return new EmployeeDto()
            {
                CreatedOn = DateTimeOffset.Now,
                DeletedOn = DateTimeOffset.Now,
                Fax = "101010",
                Lastlogin = DateTimeOffset.Now,
                Name = "New user",
                PortalId = 1,
                RoleId = 1,
                StatusId = 1,
                Telephone = "555555555",
                UpdatedOn = DateTimeOffset.Now,
                Username = "user.name"
            };
        }
    }
}
