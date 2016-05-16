" VIM-specific stuff (not for neovim)
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" GitHub plugins
Plugin 'tpope/vim-fugitive'              " Git wrapper
Plugin 'tpope/vim-surround'              " csab (change surround, replace a with b)
Plugin 'rking/ag.vim'                    " agrep inside vim
Plugin 'scrooloose/nerdtree'             " file tree
Plugin 'scrooloose/syntastic'            " syntax checking
Plugin 'scrooloose/nerdcommenter'        " quick commenting - \ci to toggle comments
Plugin 'vim-airline/vim-airline'         " statusline
Plugin 'vim-airline/vim-airline-themes'  " +themes
Plugin 'godlygeek/tabular'               " :Tabularize /, - table with comma sep
Plugin 'ctrlpvim/ctrlp.vim'              " Ctrl-P fuzzy file finder

" Colorschemes
Plugin 'antlypls/vim-colors-codeschool'
Plugin 'tomasr/molokai'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'tcl.vim'
"Plugin 'wombat'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" TABS
set tabstop   =4 " number of visual spaces per TAB
set shiftwidth=4 " indent amount (should match tabstop)

" UI
set number       " show line numbers
set showcmd      " show command in bottom bar
set showmatch    " highlight matching [{()}]
set cursorline   " higlight
set cursorcolumn " highlight col
set mouse=       " Turn off mouse support
" colorscheme badwolf
colorscheme molokai
syntax on

" SEARCHING
set incsearch    " search as characters are entered
set hlsearch     " highlight matches

" MOVEMENT
nnoremap B ^     " B goes to beginning of the line
nnoremap E $     " E goes to end of line

" $/^ doesn't do anything
"nnoremap $ <nop>
"nnoremap ^ <nop>

" Toggle past mode
set pastetoggle=<F2>

" Make help files open in a new tab, rather than a split
cabbrev help tab help

""" PLUGINS
" vim-airline - statusline
let g:airline_powerline_fonts = 1
set laststatus=2                     " Always show statusline
" nerdtree - file tree
map <C-n> :NERDTreeToggle<CR>        " open with Ctrl-n
let g:NERDTreeWinPos = "right"       " open on the right

" ctrlp - Fuzzy file finder
let g:ctrlp_map = '<c-p>'            " Bind to Ctrl-P
let g:ctrlp_cmd = 'CtrlP'            " Default command
let g:ctrlp_show_hidden = 1          " show hidden files by default
let g:ctrlp_working_path_mode = 'ra' " root dir (e.g. git root) else current dir

" ag
let g:ag_prg="ag -u --vimgrep --smart-case"

" Reload help
"Helptags
