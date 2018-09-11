command! -nargs=* Dotnet call dotnet#HandleCmd(string(<q-args>))

command! -buffer -nargs=* -complete=dir DotnetNewSln  
            \ call dotnet#NewSln(string(<q-args>))

