let g:err = "dotnet console program is not installed!"

function dotnet#Exists()
    let cmd = system("command -v dotnet")
    if cmd != ""
        return 1
    else
        return 0
    endif
endfunction

let g:add_sln = "!dotnet new sln"
function dotnet#NewSln()
    if dotnet#Exists()
        execute g:add_sln
    else
        echoerr g:err
    endif
endfunction

"function dotnet#Add

function dotnet#HandleCmd(args)
    if dotnet#Exists() 
        let a:args = strpart(a:args, 1, strlen(a:args)-2)
        let argList = split(a:args, " ")
        "echo get(argList, 0)
        echo get(argList, 1)
        "echo argList
    else
        echoerr g:err
    endif
endfunction
