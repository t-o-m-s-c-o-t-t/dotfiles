syntax enable

" TABS
set tabstop=4  " number of visual spaces per TAB

" UI
set number       " show line numbers
set showcmd      " show command in bottom bar
set showmatch    " highlight matching [{()}]
set cursorline   " higlight 
set cursorcolumn " highlight col

" SEARCHING
set incsearch    " search as characters are entered
set hlsearch     " highlight matches

" MOVEMENT
nnoremap B ^     " B goes to beginning of the line
nnoremap E $     " E goes to end of line

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" POWERLINE
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" COLORSCHEME
colorscheme badwolf
