#parameters
param([string]$dir = "C:\Users\bakpe\Downloads")

#functions
function Get-DirInfo($dir) {
    $result = Get-ChildItem $dir -Recurse | Measure-Object -Property length -Sum
    return [System.Math]::Round($result.Sum / 1GB, 2)
}

#main processing
Get-DirInfo $dir