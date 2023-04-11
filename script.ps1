# $files = dir
# Start-Process notepad
# Wait-Debugger
# Start-Process notepad++
# Wait-Debugger

# 1..10 | ForEach-Object { "Loop number $_-$_ || " * $_ }

# 1..10 | ForEach-Object { "*" * $_ }
# 10..1 | ForEach-Object { "*" * $_ }
# $n = 10
# "n = $n"
# "=" * 10 * 2
# 1..$n | ForEach-Object { "* " * $_ }
# $m = $n + 1
# "* " * $m
# $n..1 | ForEach-Object { "* " * $_ }

# 1..10 | foreach { if ($_ % 2) { "$_ is odd" } else { "$_ is even" } }

# $strComputers = @("server1", "server2", "server3")
# $strComputers[0]
# $strComputers[1]
# $strComputers[2]
# $strComputers[0] = "egrg"
# $strComputers

# $strComputers2 = @("server4", "server5", "server6")

# $empNumber = @{ "Haim" = 1; "Rony" = 0; "Dana" = 2; "Shalom" = "shalosh"; } 
# $empNumber
# Write-Host("===============================")
# $empNumber["Shalom"] = 34
# $empNumber
# Write-Host("===============================")
# $empNumber.Remove("Dana")
# $empNumber

# Get-Process | sort -Property Company | format-table -property path, name, id -groupby company
# Get-Process | Sort-Object -Property Company | format-table -property path, name, id -groupby company

# get-process | ConvertTo-Html | Out-File C:\Workspaces\PowerShell\processes.htm
# Invoke-Expression C:\Workspaces\PowerShell\processes.htm
# get-process | ConvertTo-Csv | Out-File C:\Workspaces\PowerShell\processes.csv
# Invoke-Expression C:\Workspaces\PowerShell\processes.csv
# $names = Import-Csv .\Census1000.csv
# $names | Format-Table
# Write-Host("=================================")
# $member = $names | Get-Member
# $member
# Write-Host("=================================")
# $type = $names.GetType()
# $type

$names = Import-Csv .\UdemyCourse\Census1000.csv
# $names | Sort-Object -Property pcthispanic -Descending | format-table -Property name, pcthispanic
# $dataEntry = ($names | Sort-Object -Property pcthispanic -Descending)[0]
# $dataEntry.name
# if ($dataEntry.name -eq "BARAJAsddS") { "yes" } else { "no" }
# $names | Sort-Object -Property pcthispanic -Descending | Select-Object -First 10 | format-table -property name
$names | ForEach-Object { if ($_.pcthispanic -gt $highest.pcthispanic) { $highest = $_ } }
$highest
if ($highest.name -eq "BARAJAS") { "yes" } else { "no" }


# function Add-Numbers {
#     param (
#         [int]$num1,
#         [int]$num2
#     )

#     return $num1 + $num2
# }

# $result = Add-Numbers 1 2
# $result += Add-Numbers -num1 4 -num2 3
# $result

# function Get-DirInfo($dir) {
#     $result = Get-ChildItem $dir -Recurse | Measure-Object -Property length -Sum
#     return [System.Math]::Round($result.Sum / 1GB, 3)
# }

# Get-DirInfo C:\Users\peterb\Downloads