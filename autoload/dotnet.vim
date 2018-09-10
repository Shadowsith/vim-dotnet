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
        a:args = substitute(a:args)
        if a:args == ""
            execute g:add_sln
        else 
            echo a:args
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
