# Imagen base utilizada para crear nuestra imagen con la app
FROM microsoft/aspnetcore-build:2.0 AS build-env
WORKDIR /app

# Copia el csproj y restaura las dependencias del proyecto
COPY *.csproj ./
RUN dotnet restore

# Copia todo en docker (excepto lo indicado en el .dockerignore) y compila la app
COPY . ./
RUN dotnet publish -c Release -o out

# Compila nuestra nueva imagen con la app incluída
FROM microsoft/aspnetcore:2.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "WebPrueba.dll"]