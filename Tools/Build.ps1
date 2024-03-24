## Chargement de 7zip
## TODO : Localiser l'emplacement de 7zip depuis le registre.
Push-Location "C:\Program Files\7-Zip"
$lo7zipFile = Get-Item .\7z.exe
Pop-Location

## Copie du script original
if (!(Test-Path .\release\scripts.aod))
{
    Copy-item .\release\scripts_original_2.0.2.2.aod .\release\scripts.aod
}

## Mise à jour de l'archive
## Ajout des fichiers dans la release
## Premier paramètre : a = ajouter dans l'archive
## Second paramètre  : emplacement de l'archive
## 3ième paramètre : fichiers à traiter
.$lo7zipFile.FullName u .\release\scripts.aod data\text\dialogues\english\*.xml


<#
[Reflection.assembly]::Load('System.IO.Compression')
[Reflection.assembly]::Load('System.IO.Compression.FileStream')

$loScriptsDeadState = [System.IO.Compression.ZipFile]::Open(".\Release\scripts.aod",[System.IO.Compression.ZipArchiveMode]::Update)
$loGzipStream = [System.IO.Compression.GZipStream]::new()

$loScriptsDeadState.Entries | Where-Object { 
    $_.FullName -match '^data/text/dialogues/english/.+\.xml$' 
} | ForEach-Object {
    $_
}

Get-ChildItem .\data\text\dialogues\english | ForEach-Object {
    $loScriptsDeadState.CreateEntry("$(data\text\dialogues\english\$_.Name)")
}

$loScriptsDeadState.dispose()
#>