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
 