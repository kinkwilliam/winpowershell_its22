# Näitab hetke asukohta
Get-Location

# Muudab asukohta C:\Windows kataloogi
Set-Location -Path C:\Windows -PassThru

# Liigub ühe taseme võrra üles
Set-Location -Path .. -PassThru

# Muudab asukohta registris (HKLM:\SOFTWARE)
if (Test-Path HKLM:\SOFTWARE) {
    Set-Location -Path HKLM:\SOFTWARE -PassThru
}

# Liigub registris ühe taseme võrra üles
Set-Location -Path .. -PassThru

# Alternatiivsed kaustavahetuse käsud
cd C:\Windows
chdir ..
sl HKLM:\SOFTWARE -PassThru

# Kontrollib asukohta pärast liikumist
Get-Location

# Kontrollib ja liigutakse "Local Settings" kataloogi
$localSettingsPath = "C:\Users\PowerUser\AppData\Local"
if (Test-Path $localSettingsPath) {
    Push-Location -Path $localSettingsPath
}

# Kontrollib ja liigutakse "Temp" kataloogi
$tempPath = "C:\Users\PowerUser\AppData\Local\Temp"
if (Test-Path $tempPath) {
    Push-Location -Path $tempPath
}

# Kontrollib asukohta pärast push-käske
Get-Location

# Tagasi eelmisse asukohta
Pop-Location
Get-Location

# Tagasi veel üks tase
Pop-Location -PassThru

# Kontrollib, kas võrgutee on kättesaadav
$networkPath = "\\FS01\Public"
if (Test-Path $networkPath) {
    Set-Location -Path $networkPath
    Push-Location -Path $networkPath
} else {
    Write-Host "Võrgutee '$networkPath' ei ole saadaval."
}

# Kontrollib, kas D: ketas eksisteerib
if (Test-Path D:\) {
    Set-Location -Path D:
} else {
    Write-Host "D: ketas ei ole saadaval."
}

# Loetleb kõik failid ja kaustad C:\ kettal (ka varjatud ja süsteemifailid)
Get-ChildItem -Path C:\ -Force

# Loetleb kõik failid ja kaustad rekurssiivselt C:\ kettal
Get-ChildItem -Path C:\ -Force -Recurse

# Leiab kõik .exe failid Program Files kataloogist, mis on muudetud pärast 2005-10-01 ja on 1MB-10MB vahel
Get-ChildItem -Path $env:ProgramFiles -Recurse -Include *.exe |
    Where-Object { ($_.LastWriteTime -gt '2005-10-01') -and ($_.Length -ge 1MB) -and ($_.Length -le 10MB) }

# Kopeerib PowerShell profiiliskripti varukoopiaks (.bak)
if (Test-Path -Path $PROFILE) {
    Copy-Item -Path $PROFILE -Destination $($PROFILE -replace 'ps1$', 'bak') -Force
}

# Kopeerib kataloogi C:\temp\test1 rekursiivselt C:\temp\DeleteMe
Copy-Item -Path C:\temp\test1 -Recurse -Destination C:\temp\DeleteMe

# Kopeerib kõik .txt failid C:\data kataloogist C:\temp\text kataloogi
Copy-Item -Filter *.txt -Path C:\data -Recurse -Destination C:\temp\text

# Loob uue kataloogi
New-Item -Path 'C:\temp\New Folder' -ItemType Directory

# Loob uue tühja faili
New-Item -Path 'C:\temp\New Folder\file.txt' -ItemType File

# Kustutab kataloogi ja kõik selle sees olevad failid/kataloogid
Remove-Item -Path C:\temp\DeleteMe -Recurse

# Loob uue PowerShelli draivi P:, mis osutab Program Files kataloogile
New-PSDrive -Name P -Root $env:ProgramFiles -PSProvider FileSystem

# Loeb tekstifaili ja salvestab selle rea kaupa massiivi
$Computers = Get-Content -Path C:\temp\DomainMembers.txt
