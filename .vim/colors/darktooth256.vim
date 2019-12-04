" Vim color file
" darktooth

" Created by Jason Milkins (https://github.com/emacsfodder/emacs-theme-darktooth)
" The MIT License (MIT)
" 
" Copyright (c) 2015 Jason Milkins
" 
" Permission is hereby granted, free of charge, to any person obtaining a copy of
" this software and associated documentation files (the "Software"), to deal in
" the Software without restriction, including without limitation the rights to
" use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
" the Software, and to permit persons to whom the Software is furnished to do so,
" subject to the following conditions:
" 
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
" FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
" COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
" IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
" CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

" Ported to vim by Martin Haesler with ThemeCreator (https://github.com/mswift42/themecreator)
" Converted to 256 by Kyle Chesney with adjustment of https://stackoverflow.com/a/11770026
" TODO: find and include adjusted script

hi clear

if exists("syntax on")
syntax reset
endif

set t_Co=256
let g:colors_name = "darktooth"


" Define reusable colorvariables.
let s:bg="235"
let s:fg="229"
let s:fg2="187"
let s:fg3="187"
let s:fg4="144"
let s:bg2="237"
let s:bg3="239"
let s:bg4="59"
let s:keyword="208"
let s:builtin="208"
let s:const= "144"
let s:comment="242"
let s:func="138"
let s:str="66"
let s:type="67"
let s:var="108"
let s:warning="202"
let s:warning2="197"

exe 'hi Normal ctermfg='s:fg' ctermbg='s:bg 
exe 'hi Cursor ctermfg='s:bg' ctermbg='s:fg 
exe 'hi Cursorline  ctermbg='s:bg2 
exe 'hi CursorColumn  ctermbg='s:bg2 
exe 'hi ColorColumn  ctermbg='s:bg2 
exe 'hi LineNr ctermfg='s:fg2' ctermbg='s:bg2 
exe 'hi VertSplit ctermfg='s:fg3' ctermbg='s:bg3 
exe 'hi MatchParen ctermfg='s:warning2'  cterm=underline'
exe 'hi StatusLine ctermfg='s:fg2' ctermbg='s:bg3' cterm=bold'
exe 'hi Pmenu ctermfg='s:fg' ctermbg='s:bg2
exe 'hi PmenuSel  ctermbg='s:bg3 
exe 'hi IncSearch ctermfg='s:bg' ctermbg='s:keyword 
exe 'hi Search   cterm=underline'
exe 'hi Directory ctermfg='s:const  
exe 'hi Folded ctermfg='s:fg4' ctermbg='s:bg 

exe 'hi Boolean ctermfg='s:const  
exe 'hi Character ctermfg='s:const  
exe 'hi Comment ctermfg='s:comment  
exe 'hi Conditional ctermfg='s:keyword  
exe 'hi Constant ctermfg='s:const  
exe 'hi Define ctermfg='s:keyword  
exe 'hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold'
exe 'hi DiffDelete ctermfg=196'  
exe 'hi DiffChange ctermfg='s:fg' ctermbg='s:var 
exe 'hi DiffText ctermfg='s:fg' ctermbg='s:builtin' cterm=bold'
exe 'hi ErrorMsg ctermfg='s:warning' ctermbg='s:bg2' cterm=bold'
exe 'hi WarningMsg ctermfg='s:fg' ctermbg='s:warning2 
exe 'hi Float ctermfg='s:const  
exe 'hi Function ctermfg='s:func  
exe 'hi Identifier ctermfg='s:type'  cterm=italic'
exe 'hi Keyword ctermfg='s:keyword'  cterm=bold'
exe 'hi Label ctermfg='s:var
exe 'hi NonText ctermfg='s:bg4' ctermbg='s:bg2 
exe 'hi Number ctermfg='s:const  
exe 'hi Operater ctermfg='s:keyword  
exe 'hi PreProc ctermfg='s:keyword  
exe 'hi Special ctermfg='s:fg  
exe 'hi SpecialKey ctermfg='s:fg2' ctermbg='s:bg2 
exe 'hi Statement ctermfg='s:keyword  
exe 'hi StorageClass ctermfg='s:type'  cterm=italic'
exe 'hi String ctermfg='s:str  
exe 'hi Tag ctermfg='s:keyword  
exe 'hi Title ctermfg='s:fg'  cterm=bold'
exe 'hi Todo ctermfg='s:fg2'  cterm=inverse,bold'
exe 'hi Type ctermfg='s:type 
exe 'hi Underlined   cterm=underline'

" Ruby Highlighting
exe 'hi rubyAttribute ctermfg='s:builtin
exe 'hi rubyLocalVariableOrMethod ctermfg='s:var
exe 'hi rubyGlobalVariable ctermfg='s:var' cterm=italic'
exe 'hi rubyInstanceVariable ctermfg='s:var
exe 'hi rubyKeyword ctermfg='s:keyword
exe 'hi rubyKeywordAsMethod ctermfg='s:keyword' cterm=bold'
exe 'hi rubyClassDeclaration ctermfg='s:keyword' cterm=bold'
exe 'hi rubyClass ctermfg='s:keyword' cterm=bold'
exe 'hi rubyNumber ctermfg='s:const

" Python Highlighting
exe 'hi pythonBuiltinFunc ctermfg='s:builtin

" Go Highlighting
exe 'hi goBuiltins ctermfg='s:builtin

" Javascript Highlighting
exe 'hi jsBuiltins ctermfg='s:builtin
exe 'hi jsFunction ctermfg='s:keyword' cterm=bold'
exe 'hi jsGlobalObjects ctermfg='s:type
exe 'hi jsAssignmentExps ctermfg='s:var

" Html Highlighting
exe 'hi htmlLink ctermfg='s:var' cterm=underline'
exe 'hi htmlStatement ctermfg='s:keyword
exe 'hi htmlSpecialTagName ctermfg='s:keyword

" Markdown Highlighting
exe 'hi mkdCode ctermfg='s:builtin


