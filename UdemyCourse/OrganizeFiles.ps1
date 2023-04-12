# parameters
param([string]$source = "C:\temp\source", [string]$destination = "C:\temp\destination")
Write-Host "source="$source
Write-Host "destiantion="$destination

# functions
function Check-Folder([string]$path, [switch]$create) {
    $exits = Test-Path $path
    if (!$exits -and $create) {
        mkdir $path | Out-Null
        $exits = Test-Path $path
    }
    return $exits
}

function Display-FolderStats([string]$path) {
    $files = Get-ChildItem $path -Recurse | Where-Object { !$_.PSIsContainer } 
    $totals = $files | Measure-Object -Property length -Sum
    $stats = "" | Select-Object path, count, size
    $stats.path = $path
    $stats.count = $totals.Count
    $stats.size = [math]::Round($totals.Sum / 1MB, 2)
    return $stats;
}
# main processing
# Write-Host($source)
# Write-Host($destiantion)
# Check-Folder -path C:\Users\bakpe\Downloads\TestFolder3 -create
# Display-FolderStats -path C:\Users\bakpe\Downloads

$sourceexists = Check-Folder $source
if (!$sourceexists) {
    Write-Host "The source directory is not found. Script can not continue."
    Exit
}

$destinationexists = Check-Folder $destination -create
if (!$destinationexists) {
    Write-Host "The destination directory is not found. Script can not continue."
    Exit
}

$files = dir $source -Recurse | where { !$_.PSIsContainer }
foreach ($file in $files) {
    $ext = $file.Extension.Replace(".", "")
    $extdestdir = "$destination\$ext"
   
    $extdestdirexists = Check-Folder $extdestdir -create
    if (!$extdestdirexists) {
        Write-Host "The destination directory ($extdestdir) can't be created."
        Exit
    }

    copy $file.fullname $extdestdir
}

$dirs = dir $destination | where { $_.PSIsContainer }

$allstats = @()
foreach ($dir in $dirs) {
    $allstats += Display-FolderStats $dir.FullName
}

$allstats | sort size -Descending