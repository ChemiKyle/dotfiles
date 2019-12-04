" Load vdebug
set runtimepath^=~/.vim/bundle/vdebug/
let g:vdebug_options = {'break_on_open' :  0}

iab phpre print_r("<pre>");<CR>print_r("</pre>");<Up>
