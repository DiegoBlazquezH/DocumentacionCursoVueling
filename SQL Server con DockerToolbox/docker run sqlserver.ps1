function getContainerId()
{
    $regexContainerSql = [regex]'([^\s]*)\s*microsoft/mssql-server-linux'
    $containerSql = docker ps -a
    $containerSql = $regexContainerSql.Match($containerSql)
    if($containerSql.Groups[1].value)
    {
        $idContainer = ($containerSql.Groups[1].value)
        return $idContainer
    }
    else
    {
        return ""
    }
}

function getImageId()
{
    $regexImageSql = [regex]'redis\s*latest\s*([^\s]*)'
    $idImage = docker images -a
    $idImage = $regexImageSql.Match($idImage)
    if($idImage.Groups[1].value)
    {
        $idImage = ($idImage.Groups[1].value)
        return $idImage
    }
    else
    {
        return ""
    }
}
function runSqlServer()
{
    docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Pa$$w0rd' -p 1433:1433 -d microsoft/mssql-server-linux
}

# Sacamos el Id del contenedor y el Id de la imagen
$idContainer = getContainerId
$idImage = getImageId

if($idContainer)
{
    Write-Host "El contenedor ya existe con ID" $idContainer ", lo arrancamos"
    docker start $idContainer
    Write-Host "Se ha arrancado el contenedor Sql con ID" $idContainer
}
else 
{
    if($idImage)    
    {
        Write-Host "El contenedor no existe, pero la imagen Sql ya existe, con ID" $idImage
        Write-Host "Creando contenedor Docker de Sql"
        runSqlServer
        $idContainer = getContainerId
        if($idContainer)
        {
            Write-Host "Se ha creado y arrancado el contenedor Sql con ID" $idContainer
        }
        else
        {
            Write-Host "Error al crear el contenedor. Abortando"
        }
    }
    else
    {
        Write-Host "Ni el contenedor ni la imagen Sql existen"
        Write-Host "Descargando imagen de Sql"
        docker pull microsoft/mssql-server-linux
        $idImage = getImageId
        if($idImage)    
        {
            Write-Host "Imagen Sql descargada con ID" $idImage
            Write-Host "Creando contenedor Docker de Sql"
            runSqlServer
            $idContainer = getContainerId
            if($idContainer)
            {
                Write-Host "Se ha creado y arrancado el contenedor Sql con ID" $idContainer
            }
            else
            {
                Write-Host "Error al crear el contenedor. Abortando"
            }
        }
        else
        {
            Write-Host "Error al descargar la imagen Sql. Abortando"
        }
    }
}

Read-Host 'Pulsa Enter para continuar'