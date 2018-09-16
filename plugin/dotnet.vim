
" register dotnet simple commands
command! -buffer DotnetClean call dotnet#Cmd("clean")
command! -buffer DotnetBuild call dotnet#Cmd("build")
command! -buffer DotnetBuildServer call dotnet#Cmd("build-server shutdown")
command! -buffer DotnetRun call dotnet#Cmd("run")
command! -buffer DotnetPack call dotnet#Cmd("pack")

" register dotnet advanced commands
command! -buffer -complete=file DotnetList cal dotnet#CmdRef("list",string(<q-args>))


" register dotnet add commands
command! -nargs=* DotnetAddPkg call dotnet#Add("package",string(<q-args>))
command! -nargs=* -complete=dir DotnetAddRef call dotnet#Add("reference",string(<q-args>))


" register dotnet new commands
command! -nargs=* -complete=dir DotnetNewSln call dotnet#New("sln",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewConsole call dotnet#New("console",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewClassLib call dotnet#New("classlib",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewUnit call dotnet#New("mstest",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewNUnit call dotnet#New("nunit",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewNUnitItm call dotnet#New("nunit-test",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewXUnit call dotnet#New("xunit",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewRazorPage call dotnet#New("page",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewViewImports call dotnet#New("viewimports",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewViewStart call dotnet#New("viewstart",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewASPCoreEmpty call dotnet#New("web",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewASPCoreMVC call dotnet#New("mvc",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewASPCoreRazor call dotnet#New("razor",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewASPCoreAngular call dotnet#New("angular",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewASPCoreReact call dotnet#New("react",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewASPCoreReactRedux call dotnet#New("reactredux",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewRazorLib call dotnet#New("razorclasslib",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewASPCoreWebAPI call dotnet#New("webapi",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewWebConfig call dotnet#New("webconfig",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewNuGet call dotnet#New("nugetconfig",string(<q-args>))
command! -nargs=* -complete=dir DotnetNewJSON call dotnet#New("globaljson",string(<q-args>))

" register dotnet sln commands
command! -nargs=* -complete=file DotnetSlnAdd call dotnet#Sln("add",string(<q-args>))
command! -nargs=* -complete=file DotnetSlnRemove call dotnet#Sln("remove",string(<q-args>))
command! -nargs=* -complete=file DotnetSlnList call dotnet#Sln("list",string(<q-args>))

