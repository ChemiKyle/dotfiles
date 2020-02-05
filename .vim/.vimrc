" if you are stuck in Vim <7.4 this will not be recognized in ~/.vim/.vimrc
" in macOS, Vim 8.1 the custom colorspace is silently not loaded
" ln -s ~/.vim/.vimrc ~/.vimrc

set number          " cursor line number is absolute
set relativenumber  " all other lines are relative to cursor
set cursorline      " highlight cursor line
"set culopt=number   " but underline only the line number

" no mouse use
set mouse=

set hlsearch        " highlight matching search
set incsearch       " autonavigate to first match while searcing

filetype plugin on  " specific language scopes in ~/.vim/after/ftplugin/

set tags=./tags;   " traverse up the file tree in search of a ctags file, all the way to /

" Do not accept windows format
set ffs=unix,dos
set ff=unix

set autochdir       " netrw begins in the dir of the pane it's opened in

set tabstop=4   " \t appears as 4 spaces
set shiftwidth=4    " autoindent is 4 spaces
set smartindent
set smarttab    " <Tab> inserts $shiftwidth spaces, backspace deletes $tabstop spaces
set expandtab   " <Tab> inserts 4 spaces
set autoindent  " combined with above, < and > indent by 4 spaces

set backspace=indent,eol,start

set scrolloff=5 " always leave 5 buffer lines on top and bottom

set clipboard=unnamed   " copy to system clipboard

" allow hopping single words in snake_case vars
" ruins autocomplete :(
"set iskeyword-=_

syntax on

" additional color calls
"set term=xterm-256color
set t_Co=256
set background=dark

" Make :term more meaningful
"let $PS1='\u@\h:\w\$ '

colorscheme darktooth256

"shortcuts
set thesaurus+=~/.vim/synonyms.txt " Incomplete, left as reminder
map <Space> <Leader>

" send current or selected lines to window 2 (REPL)
" adapted from https://vi.stackexchange.com/a/19875
function s:exec_on_term(lnum1, lnum2)
  let g:terminal_buffer = 2
  call term_sendkeys(g:terminal_buffer,
        \ join(getline(a:lnum1, a:lnum2), "\<cr>") . "\<cr>")
endfunction
command! -range ExecOnTerm call s:exec_on_term(<line1>, <line2>)
nnoremap <leader>w :ExecOnTerm<cr>
vnoremap <leader>w :ExecOnTerm<cr>

" statusline sugar
" credit: https://shapeshed.com/vim-statuslines/
set laststatus=2
" fetch current git branch
function! GitBranch()
  let fpath = expand('%:h')
  let gitcmd = "cd ".fpath." && git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'"
  return system(gitcmd)
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?''.l:branchname.' ':''
endfunction

" Graphical cues

" Statusline
" see :h statusline for %
" see :h highlight for %##
" :so $VIMRUNTIME/syntax/hitest.vim
set statusline=
set statusline+=%{winnr()}          " window number
set statusline+=%#DiffChange#       " grey the next line
set statusline+=%{StatuslineGit()}  " show git branch of selected file
set statusline+=%#LineNr#           " no more grey
set statusline+=\ %f                " (focused) ? filename : filepath
set statusline+=%#ErrorMsg#         " no more grey
set statusline+=%m                  " file read-only[-] / modified [+] indicator
set statusline+=%#LineNr#           " no more grey
set statusline+=%=                  " right-align next lines
set statusline+=%#CursorLineNr#     " underline
set statusline+=%c%V                " column (1 indexed)
set statusline+=%#DiffText#         " no more grey
set statusline+=%y                  " filetype
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding} "language/charset
"set statusline+=\[%{&fileformat}\]  " unix,dos, etc.

" Window indication
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set culopt=both      " underline whole line in focused window
    autocmd WinLeave * set culopt=number    " underline only number in unfocused window
augroup END


"set runtimepath^=~/.vim/bundle/vdebug/
"let g:vdebug_options = {
"\'break_on_open' :  0,
"\'path_maps': {'/var/www/html': '/Users/kyle.chesney/projects/redcap-docker-compose/rdc_shib/www'}
"\}
