let g:err = "dotnet console program is not installed!"

function dotnet#Exists()
    let cmd = system("command -v dotnet")
    if cmd != ""
        return 1
    else
        return 0
    endif
endfunction

function dotnet#Add(cmd, ref)
    if dotnet#Exists()
        let l:dotnet_add = "!dotnet add "  
        if cmd == "package"
           let l:pkg = strpart(a:ref, 1, strlen(a:ref)-2) 
           l:dotnet_add = l:dotnet_add . l:pkg
           execute l:dotnet_add
        endif
        if cmd == "reference"
           let l:ref = "./" . strpart(a:ref, 1, strlen(a:ref)-2) 
           call dotnet#AddNew(l:dotnet_add, l:ref)
        endif
    endif
endfunction

function dotnet#AddNew(add_cmd, path)
    let curr_path = system("pwd")
    execute "cd " . a:path 
    execute a:add_cmd
    execute "cd " . curr_path
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

" for simple commands with parameter
function dotnet#CmdRef(cmd, ref)
    if dotnet#Exists()
        let lref = strpart(a:ref, 1, strlen(a:ref)-2) 
        let l:cmd = "!dotnet " . a:cmd 
        execute l:cmd
    else
        echoerr g:err
    endif
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

function dotnet#Tool(cmd, id)
    if dotnet#Exists()

    else
        echoerr g:err
    endif
endfunction
