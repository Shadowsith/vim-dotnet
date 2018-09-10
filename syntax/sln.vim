" Microsoft Visual Studio Solution Syntax

"if exists("b:current_syntax")
"    finish
" endif

syn keyword slnVersion VisualStudioVersion MinimumVisualStudioVersion 
syn keyword slnOperator Project EndProject Global EndGlobal GlobalSection EndGlobalSection
syn keyword slnParameter SolutionConfigurationPlatforms SolutionProperties ProjectConfigurationPlatforms
syn keyword slnKeywords Debug Release HideSolutionNode
syn keyword slnType preSolution postSolution
syn keyword slnArchFunc ActiveCfg Build 
syn keyword slnSpecial FALSE TRUE

syn match slnVersionNumber '\d\+\.\d*'
syn match slnProjectCode  '[A-Z0-9]*-[A-Z0-9]*-[A-Z0-9]*-[A-Z0-9]*-[A-Z0-9]*'
syn match slnArch 'x86\|x64\|arm\|Any\sCPU' 
syn region slnString start='"' end='"'

let b:current_syntax = "sln"

hi def link slnVersion PreProc
hi def link slnOperator Statement 
hi def link slnParameter StorageClass
hi def link slnKeywords Function 
hi def link slnType Type
hi def link slnArch Type 
hi def link slnArchFunc Function
hi def link slnSpecial Special  
hi def link slnVersionNumber Number 
hi def link slnProjectCode Constant
hi def link slnString String
