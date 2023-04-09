# Test Script

function Invoke-Random {
    $random = Get-Random -Maximum 100 -Minimum 10
    1..$random | ForEach-Object {
        $_
    }
}

Invoke-Random