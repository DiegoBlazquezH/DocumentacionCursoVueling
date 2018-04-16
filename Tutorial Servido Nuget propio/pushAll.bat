nuget.exe push Vueling.Business.Logic.1.0.0.nupkg danielgracia -Source http://localhost:80/vuelingnuget/nuget
nuget.exe push Vueling.Common.Logic.1.0.0.nupkg danielgracia -Source http://localhost:80/vuelingnuget/nuget
nuget.exe push Vueling.Presentation.WinSite.1.0.0.nupkg danielgracia -Source http://localhost:80/vuelingnuget/nuget
nuget.exe push Vueling.DataAccess.Dao.1.0.0.nupkg danielgracia -Source http://localhost:80/vuelingnuget/nuget
del Vueling*.*
PAUSE