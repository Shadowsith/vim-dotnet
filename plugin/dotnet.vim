command! -nargs=* Dotnet call dotnet#HandleCmd(string(<q-args>))

command! -buffer -nargs=* -complete=custom DotnetNewSln call dotnet#NewSln(string(<q-args>))

