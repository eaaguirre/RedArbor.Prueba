using RedArbor.Prueba.Service.WebApi.Extensions.Authentication;
using RedArbor.Prueba.Service.WebApi.Extensions.CORS;
using RedArbor.Prueba.Service.WebApi.Extensions.Injection;
using RedArbor.Prueba.Service.WebApi.Extensions.Mapper;
using RedArbor.Prueba.Service.WebApi.Extensions.Swagger;
using RedArbor.Prueba.Service.WebApi.Extensions.Validator;
using RedArbor.Prueba.Service.WebApi.Extensions.Versioning;
using RedArbor.Prueba.Service.WebApi.Extensions.Watch;
using WatchDog;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddMapper();
builder.Services.AddCors(builder.Configuration);
builder.Services.AddInjection(builder.Configuration);
builder.Services.AddAuthentication(builder.Configuration);
builder.Services.AddSwagger();
builder.Services.AddValidator();
builder.Services.AddVersioning();
builder.Services.AddWatchDog(builder.Configuration);

var app = builder.Build();

//http request pipiline

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "Prueba RedArbor  V1");
    });
}
app.UseWatchDogExceptionLogger();
app.UseHttpsRedirection();
app.UseCors("PolicyPrueba");
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();

app.UseWatchDog(conf =>
{
    conf.WatchPageUsername = builder.Configuration["WatchDog:WatchPageUserName"];
    conf.WatchPagePassword = builder.Configuration["WatchDog:WatchPagePassword"];
});

app.Run();

public partial class Program { };