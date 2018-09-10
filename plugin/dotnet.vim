command! -nargs=* Dotnet call dotnet#HandleCmd(string(<q-args>))

command! -buffer -nargs=* DotnetNewSln call dotnet#NewSln(string(<q-args>))

