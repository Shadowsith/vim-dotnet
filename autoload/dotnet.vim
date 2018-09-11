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
function dotnet#NewSln(args)
    if dotnet#Exists()
        let l:path = strpart(a:args, 1, strlen(a:args)-2)
        if l:path == ""
            execute g:add_sln
        else 
            execute g:add_sln . " " . l:path 
        endif
    else
        echoerr g:err
    endif
endfunction

function dotnet#HandleCmd(args)
    if dotnet#Exists() 
        let argList = split(a:args, " ")
        "echo get(argList, 0)
        echo get(argList, 1)
        "echo argList
    else
        echoerr g:err
    endif
endfunction
