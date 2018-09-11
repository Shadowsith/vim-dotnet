command! -nargs=* Dotnet call dotnet#HandleCmd(string(<q-args>))

command! -buffer DotnetNewSln call dotnet#NewSln()

