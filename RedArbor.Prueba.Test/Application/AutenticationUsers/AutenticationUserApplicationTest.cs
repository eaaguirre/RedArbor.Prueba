using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using RedArbor.Prueba.Application.Interface;

namespace RedArbor.Prueba.Test.Application.AutenticationUsers
{
    [TestClass]
    public class AutenticationUserApplicationTest
    {
        private static WebApplicationFactory<Program> _factory = null;
        private static IServiceScopeFactory _serviceScopeFactory = null;

        [ClassInitialize]
        public static void Iniatilize(TestContext _)
        {
            _factory = new CustomWebApplicationFactory();
            _serviceScopeFactory = _factory.Services.GetRequiredService<IServiceScopeFactory>();

        }
        [TestMethod]
        public void Autenticate_ParametrsNulls_ErrorValitationReturn()
        {
            using var scope = _serviceScopeFactory.CreateScope();
            var context = scope.ServiceProvider.GetService<IAutenticationUserApplication>();


            //Arrange
            var companyId = 1;
            var userName = string.Empty;
            var password = string.Empty;
            var expected = "Error validation";

            //Act

            var result = context.Authenticate(companyId,userName, password);
            var actual = result.Message;

            //Assert


            Assert.AreEqual(expected, actual);

        }

        [TestMethod]
        public void Autenticate_ParametersIsCorrect_MessageSuccessReturn()
        {

            
            using var scope = _serviceScopeFactory.CreateScope();
            var context = scope.ServiceProvider.GetService<IAutenticationUserApplication>();




            //Arrange
            var companyId = 1;
            var userName = "edinson.aguirre";
            var password = "123456";
            var expected = "Usuario Autenticado con Exito";

            //Act

            var result = context.Authenticate(companyId,userName, password);
            var actual = result.Message;

            //Assert
            Assert.AreEqual(expected, actual);

        }


        [TestMethod]
        public void Autenticate_ParametersIsNotCorrect_MessageUserNotFoundReturn()
        {
            using var scope = _serviceScopeFactory.CreateScope();
            var context = scope.ServiceProvider.GetService<IAutenticationUserApplication>();


            //Arrange
            var companyId = 1;
            var userName = "Edinson.Aguirre";
            var password = "1111111111";
            var expected = "Usuario no encontrado";

            //Act

            var result = context.Authenticate(companyId,userName, password);
            var actual = result.Message;

            //Assert
            Assert.AreEqual(expected, actual);

        }
    }
}