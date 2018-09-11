let g:err = "dotnet console program is not installed!"

function dotnet#Exists()
    let cmd = system("command -v dotnet")
    if cmd != ""
        return 1
    else
        return 0
    endif
endfunction

function dotnet#AddNew(add_cmd, path)
    let curr_path = system("pwd")
    execute "cd " . a:path 
    execute a:add_cmd
    execute "cd " . curr_path
endfunction

function dotnet#New(file_type, args)
    let l:add_file = "!dotnet new " . a:file_type
    if dotnet#Exists()
        let l:path = "./" . strpart(a:args, 1, strlen(a:args)-2)
        if l:path == "./"
            execute l:add_file
        else 
            call dotnet#AddNew(l:add_file, l:path)
        endif
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
