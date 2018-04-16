cd C:\Users\daniel.graciaga\source\repos\Vueling\Vueling.Presentation.WinSite
nuget pack .\Vueling.Presentation.WinSite.csproj -IncludeReferencedProjects
move Vueling.Presentation.WinSite.1.0.0.nupkg C:\Users\daniel.graciaga\source\repos\NugetServer

cd C:\Users\daniel.graciaga\source\repos\Vueling\Vueling.Business.Logic
nuget pack .\Vueling.Business.Logic.csproj -IncludeReferencedProjects
move Vueling.Business.Logic.1.0.0.nupkg C:\Users\daniel.graciaga\source\repos\NugetServer

cd C:\Users\daniel.graciaga\source\repos\Vueling\Vueling.Common.Logic
nuget pack .\Vueling.Common.Logic.csproj -IncludeReferencedProjects
move Vueling.Common.Logic.1.0.0.nupkg C:\Users\daniel.graciaga\source\repos\NugetServer

cd C:\Users\daniel.graciaga\source\repos\Vueling\Vueling.DataAccess.Dao
nuget pack .\Vueling.DataAccess.Dao.csproj -IncludeReferencedProjects
move Vueling.DataAccess.Dao.1.0.0.nupkg C:\Users\daniel.graciaga\source\repos\NugetServer

PAUSE