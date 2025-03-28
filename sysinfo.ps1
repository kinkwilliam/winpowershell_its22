Get-CimInstance -ClassName Win32_Desktop
Get-CimInstance -ClassName Win32_Desktop | Select-Object -ExcludeProperty "CIM*"
Get-CimInstance -ClassName Win32_BIOS
Get-CimInstance -ClassName Win32_Processor | Select-Object -ExcludeProperty "CIM*"
Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -Property SystemType
Get-CimInstance -ClassName Win32_ComputerSystem
Get-CimInstance -ClassName Win32_QuickFixEngineering
Get-CimInstance -ClassName Win32_QuickFixEngineering -Property HotFixID
Get-CimInstance -ClassName Win32_QuickFixEngineering -Property HotFixId | Select-Object -Property HotFixId
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property BuildNumber,BuildType,OSType,ServicePackMajorVersion,ServicePackMinorVersion
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property Build*,OSType,ServicePack*
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property NumberOfLicensedUsers, NumberOfUsers, RegisteredUser
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property *user*
Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"
Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" | Measure-Object -Property FreeSpace,Size -Sum | Select-Object -Property Property,Sum
Get-CimInstance -ClassName Win32_LogonSession
Get-CimInstance -ClassName Win32_ComputerSystem -Property UserName
Get-CimInstance -ClassName Win32_LocalTime
Get-CimInstance -ClassName Win32_Service | Select-Object -Property Status,Name,DisplayName
Get-CimInstance -ClassName Win32_Service | Format-Table -Property Status, Name, DisplayName -AutoSize -Wrap


Get-CimInstance -ClassName Win32_OperatingSystem | Out-File -FilePath C:\temp\sysinfo.txt
