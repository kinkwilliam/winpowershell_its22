# Näita hetkeasukohaga kausta
Get-Location

# Muuda asukohta C:\Windows kausta
Set-Location -Path C:\Windows

# Muuda asukohta ja näita uut asukohta
Set-Location -Path C:\Windows -PassThru

# Liigu ühe taseme võrra üles
Set-Location -Path .. -PassThru

# Muuda asukohta registris (HKLM:\SOFTWARE)
if (Test-Path HKLM:\SOFTWARE) {
    Set-Location -Path HKLM:\SOFTWARE -PassThru
}

# Liigu registris ühe taseme võrra üles
Set-Location -Path .. -PassThru

# Alternatiivsed kaustavahetuse käsud (lühialiaasid)
cd C:\Windows
chdir ..
sl HKLM:\SOFTWARE -PassThru

# Kontrolli hetke asukohta
Get-Location

# Kontrolli, kas kaust "Local Settings" eksisteerib
$localSettingsPath = "C:\Users\PowerUser\AppData\Local"
if (Test-Path $localSettingsPath) {
    Push-Location -Path $localSettingsPath
}

# Kontrolli, kas kaust "Temp" eksisteerib
$tempPath = "C:\Users\PowerUser\AppData\Local\Temp"
if (Test-Path $tempPath) {
    Push-Location -Path $tempPath
}

# Kontrolli asukohta pärast push-käske
Get-Location

# Tagasi eelmisse asukohta
Pop-Location
Get-Location

# Järgmine Pop-Location tagastab ka uue asukoha
Pop-Location -PassThru

# Kontrolli, kas võrgujagatud kaust eksisteerib
$networkPath = "\\FS01\Public"
if (Test-Path $networkPath) {
    Set-Location -Path $networkPath
    Push-Location -Path $networkPath
} else {
    Write-Host "Võrgutee '$networkPath' ei ole kättesaadav."
}

# Muuda asukohta D-kettale (kui see on olemas)
if (Test-Path D:\) {
    Set-Location -Path D:
} else {
    Write-Host "D: ketas ei ole saadaval."
}
