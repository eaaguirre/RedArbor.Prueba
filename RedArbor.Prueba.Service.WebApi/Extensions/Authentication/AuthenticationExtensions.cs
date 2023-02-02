using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using RedArbor.Prueba.Service.WebApi.Helpers;
using System;
using System.Text;
using System.Threading.Tasks;

namespace RedArbor.Prueba.Service.WebApi.Extensions.Authentication
{
    public  static class AuthenticationExtensions
    {
        public static IServiceCollection  AddAuthentication(this IServiceCollection services,IConfiguration configuration)
        {
            var appSettingSections = configuration.GetSection("Config");
            services.Configure<AppSettings>(appSettingSections);

            //Autentication JWT
            var appsetting = appSettingSections.Get<AppSettings>();

            var key = Encoding.ASCII.GetBytes(appsetting.Secret);
            var Issuer = appsetting.Isseuer;
            var Audience = appsetting.Audicence;


            services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
                
                
            })
                .AddJwtBearer(x =>
                {
                    x.Events = new JwtBearerEvents
                    {
                        OnTokenValidated = context =>
                        {
                            var Username = context.Principal.Identity.Name.ToString();
                            return Task.CompletedTask;
                        },
                        OnAuthenticationFailed = context =>
                        {
                            if (context.Exception.GetType() == typeof(SecurityTokenExpiredException))
                            {
                                context.Response.Headers.Add("Token-Expired", "True");
                            }
                            return Task.CompletedTask;
                        }
                    };

                    x.RequireHttpsMetadata = false;
                    x.SaveToken = false;
                    x.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(key),
                        ValidateIssuer = true,
                        ValidIssuer = Issuer,
                        ValidateAudience = true,
                        ValidAudience = Audience,
                        ValidateLifetime = true,
                        ClockSkew = TimeSpan.Zero
                    };
                });

            return services;

        }
        
    }
}
