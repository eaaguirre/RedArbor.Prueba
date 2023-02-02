using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.Extensions.DependencyInjection;
using RedArbor.Prueba.Application.Interface;

namespace RedArbor.Prueba.Test.Application.Employee
{
    [TestClass]
    public  class EmployeeApplicationTest
    {
        private static WebApplicationFactory<Program> _factory = null;
        private static IServiceScopeFactory _serviceScopeFactory = null;

        private static readonly IServiceCollection _serviceCollection = new ServiceCollection();

        [ClassInitialize]
        public static void Iniatilize(TestContext _)
        {
            _factory = new CustomWebApplicationFactory();
            _serviceScopeFactory = _factory.Services.GetRequiredService<IServiceScopeFactory>();

        }

        [TestMethod]
        public void Insert_Employee_AllParameters_MessageSuccesReturn()
        {

            using var scope = _serviceScopeFactory.CreateScope();
            var context = scope.ServiceProvider.GetService<IEmployeeApplication>();
            var expected = "Se ha Creado el Empleado Correctamente";

            //Arrange
            var employeeEntity = TestHelper.TestHelper.GetMockedEmployeetoList(false);

            //Act

            var result = context.Insert(employeeEntity);
            var actual = result.Message;

            //Assert


            Assert.AreEqual(expected, actual);

        }

        [TestMethod]
        public void Insert_Employee_SomeParametersNulls_MessageErrorValidationReturn()
        {

            using var scope = _serviceScopeFactory.CreateScope();
            var context = scope.ServiceProvider.GetService<IEmployeeApplication>();
            var expected = "Error validation";

            //Arrange
            var employeeEntity = TestHelper.TestHelper.GetMockedEmployeetoListWithoutFields();

            //Act

            var result = context.Insert(employeeEntity);
            var actual = result.Message;

            //Assert


            Assert.AreEqual(expected, actual);

        }

        [TestMethod]
        public void InsertAsync_Employee_SomeParametersNulls_MessageErrorValidationReturn()
        {

            using var scope = _serviceScopeFactory.CreateScope();
            var context = scope.ServiceProvider.GetService<IEmployeeApplication>();
            var expected = "Error validation";

            //Arrange
            var employeeEntity = TestHelper.TestHelper.GetMockedEmployeetoListWithoutFields();

            //Act

            var result = context.InsertAsync(employeeEntity);
            var actual = result.Result.Message;

            //Assert


            Assert.AreEqual(expected, actual);

        }

        [TestMethod]
        public void InsertAsync_Employee_AllParameters_MessageSuccesReturn()
        {

            using var scope = _serviceScopeFactory.CreateScope();
            var context = scope.ServiceProvider.GetService<IEmployeeApplication>();
            var expected = "Se ha Creado el Empleado Correctamente";

            //Arrange
            var employeeEntity = TestHelper.TestHelper.GetMockedEmployeetoList(false);

            //Act

            var result = context.InsertAsync(employeeEntity);
            var actual = result.Result.Message;

            //Assert


            Assert.AreEqual(expected, actual);

        }


        [TestMethod]
        public void UpdateAsync_Employee_AllParameters_MessageSuccesReturn()
        {

            using var scope = _serviceScopeFactory.CreateScope();
            var context = scope.ServiceProvider.GetService<IEmployeeApplication>();
            var expected = "Se ha Actualizado el Empleado Correctamente";

            //Arrange
            var employeeEntity = TestHelper.TestHelper.GetMockedEmployeetoList(true);

            //Act

            var result = context.UpdateAsync(employeeEntity);
            var actual = result.Result.Message;

            //Assert


            Assert.AreEqual(expected, actual);

        }

        [TestMethod]
        public void Update_Employee_AllParameters_MessageSuccesReturn()
        {

            using var scope = _serviceScopeFactory.CreateScope();
            var context = scope.ServiceProvider.GetService<IEmployeeApplication>();
            var expected = "Se ha Actualizado el Empleado Correctamente";

            //Arrange
            var employeeEntity = TestHelper.TestHelper.GetMockedEmployeetoList(true);

            //Act

            var result = context.Update(employeeEntity);
            var actual = result.Message;

            //Assert


            Assert.AreEqual(expected, actual);

        }

    }
}
