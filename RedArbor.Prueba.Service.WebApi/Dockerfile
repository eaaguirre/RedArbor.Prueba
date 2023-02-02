#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
ENV ASPNETCORE_URLS=http://*:80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["RedArbor.Prueba.Service.WebApi/RedArbor.Prueba.Service.WebApi.csproj", "RedArbor.Prueba.Service.WebApi/"]
COPY ["RedArbor.Prueba.Application.DTO/RedArbor.Prueba.Application.DTO.csproj", "RedArbor.Prueba.Application.DTO/"]
COPY ["RedArbor.Prueba.Application.Main/RedArbor.Prueba.Application.Main.csproj", "RedArbor.Prueba.Application.Main/"]
COPY ["RedArbor.Prueba.Transversal.Common/RedArbor.Prueba.Crosscutting.Common.csproj", "RedArbor.Prueba.Transversal.Common/"]
COPY ["RedArbor.Prueba.Domain.Interface/RedArbor.Prueba.Domain.Interface.csproj", "RedArbor.Prueba.Domain.Interface/"]
COPY ["RedArbor.Prueba.Domain.Entity/RedArbor.Prueba.Domain.Entity.csproj", "RedArbor.Prueba.Domain.Entity/"]
COPY ["RedArbor.Prueba.Application.Interface/RedArbor.Prueba.Application.Interface.csproj", "RedArbor.Prueba.Application.Interface/"]
COPY ["RedArbor.Prueba.Application.Validator/RedArbor.Prueba.Application.Validator.csproj", "RedArbor.Prueba.Application.Validator/"]
COPY ["RedArbor.Prueba.Domain.Core/RedArbor.Prueba.Domain.Core.csproj", "RedArbor.Prueba.Domain.Core/"]
COPY ["RedArbor.Prueba.Infraestructure.Interface/RedArbor.Prueba.Infraestructure.Interface.csproj", "RedArbor.Prueba.Infraestructure.Interface/"]
COPY ["RedArbor.Prueba.Crosscutting.Logging/RedArbor.Prueba.Crosscutting.Logging.csproj", "RedArbor.Prueba.Crosscutting.Logging/"]
COPY ["RedArbor.Prueba.Infraestructure.Repository/RedArbor.Prueba.Infraestructure.Repository.csproj", "RedArbor.Prueba.Infraestructure.Repository/"]
COPY ["RedArbor.Prueba.Infraestructure.Data/RedArbor.Prueba.Infraestructure.Data.csproj", "RedArbor.Prueba.Infraestructure.Data/"]
COPY ["RedArbor.Prueba.Crosscutting.Mapper/RedArbor.Prueba.Crosscutting.Mapper.csproj", "RedArbor.Prueba.Crosscutting.Mapper/"]
RUN dotnet restore "RedArbor.Prueba.Service.WebApi/RedArbor.Prueba.Service.WebApi.csproj"
COPY . .
WORKDIR "/src/RedArbor.Prueba.Service.WebApi"
RUN dotnet build "RedArbor.Prueba.Service.WebApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "RedArbor.Prueba.Service.WebApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

RUN ln -fs /usr/share/zoneinfo/America/Lima/etc/localtime
RUN dpkg-reconfigure --frontend noninterective tzdata

ENTRYPOINT ["dotnet", "RedArbor.Prueba.Service.WebApi.dll"]