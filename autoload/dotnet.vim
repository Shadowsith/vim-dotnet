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

" for simple commands
function dotnet#Cmd(cmd)
    if dotnet#Exists()
        let l:dotnet_cmd = "!dotnet " . a:cmd
        execute l:dotnet_cmd 
    else
        echoerr g:err
    endif
endfunction

function dotnet#Sln(cmd, path)
    if dotnet#Exists()
        let l:dotnet_cmd = "!dotnet sln " . a:cmd
        let l:path = "./" . strpart(a:path, 1, strlen(a:path)-2)
        "echo a:cmd . " " . l:path
        if l:path == "./"
            if a:cmd == "add" || a:cmd == "remove"
                echoerr "Please enter the path + .csproj file as argument"
            else
                execute l:dotnet_cmd 
            endif
        else
            if a:cmd == "add" || a:cmd == "remove"
                execute l:dotnet_cmd . " " . l:path
            else
                execute l:dotnet_cmd
            endif
        endif
    endif
endfunction
