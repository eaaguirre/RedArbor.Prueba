using WatchDog;
namespace RedArbor.Prueba.Service.WebApi.Extensions.Watch
{
    public  static class WatchDogExtensions
    {
        public static  IServiceCollection AddWatchDog(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddWatchDogServices(opt =>
            {;
                //opt.SetExternalDbConnString = configuration.GetConnectionString("RedArborConnection");
                //opt.DbDriverOption = WatchDog.src.Enums.WatchDogDbDriverEnum.MSSQL;
                opt.IsAutoClear = true;
                opt.ClearTimeSchedule = WatchDog.src.Enums.WatchDogAutoClearScheduleEnum.Daily;
            });

            return services;
        }
    }
}
