" VIM-specific stuff (not for neovim)

set t_Co=256                  " Use 256 colours (Use this setting only if your terminal supports 256 colours)
set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" GitHub plugins
Plugin 'tpope/vim-fugitive'              " Git wrapper
Plugin 'tpope/vim-surround'              " csab (change surround, replace a with b)
Plugin 'tpope/vim-vinegar'               " tweaks to netrw
Plugin 'rking/ag.vim'                    " ag inside vim with links
Plugin 'scrooloose/syntastic'            " syntax checking
Plugin 'scrooloose/nerdcommenter'        " quick commenting - \ci to toggle comments
Plugin 'vim-airline/vim-airline'         " statusline
Plugin 'vim-airline/vim-airline-themes'  " +themes
Plugin 'godlygeek/tabular'               " :Tabularize /, - table with comma sep
Plugin 'ctrlpvim/ctrlp.vim'              " Ctrl-P fuzzy file finder
Plugin 'fatih/vim-go'                    " go language support
Plugin 'airblade/vim-gitgutter'          " Git changes in the left gutter

" Colorschemes
Plugin 'tomasr/molokai'

call vundle#end()            " required
filetype plugin indent on    " required

" CONFIGS
set number       " show line numbers
set showcmd      " show command in bottom bar
set showmatch    " highlight matching [{()}]
set cursorline   " higlight
set cursorcolumn " highlight col
set mouse=       " Turn off mouse support
set tabstop=4    " width of a tab in spaces
set shiftwidth=4 " how many spaces to indend (should match tabstop)
set listchars=tab:\|-,trail:_,extends:>,precedes:<,nbsp:~,eol:$
set incsearch    " incremental search as you type
set hlsearch     " highlight matches of a search
set scrolloff=10 " scroll so we can always see 10 lines around the cursor

colorscheme molokai
syntax on

" BINDINGS
" Toggle paste mode with F2
set pastetoggle=<F2>

" Make help files open in a new tab, rather than a split
" Abbreviates 'help' to 'tab help' in command mode
cabbrev help tab help

" PLUGINS
" vim-airline - statusline
let g:airline_powerline_fonts = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='dark'
let g:airline_mode_map = {
	\ '__' : '-',
	\ 'i'  : 'I',
	\ 'n'  : 'N',
	\ 'R'  : 'R',
	\ 'c'  : 'C',
	\ 'v'  : 'V',
	\ 'V'  : 'V',
	\ '^V' : 'V',
	\ 's'  : 'S',
	\ 'S'  : 'S',
	\ '^S' : 'S',
	\ }
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇ '
set laststatus=2                     " Always show statusline

" ctrlp - Fuzzy file finder
let g:ctrlp_map = '<c-p>'            " Bind to Ctrl-P
let g:ctrlp_cmd = 'CtrlP'            " Default command
let g:ctrlp_show_hidden = 1          " show hidden files by default
let g:ctrlp_working_path_mode = 'ra' " root dir (e.g. git root) else current dir

" ag
let g:ag_prg="ag -u --vimgrep --smart-case"

" FUNCTIONS
" Highlight unwanted whitespace
let s:show_extra_whitespace = 0                          " off by default
function! ToggleWhitespace()
	if !s:show_extra_whitespace
	highlight ExtraWhitespace ctermbg=red guibg=red
		call matchadd('ExtraWhitespace', '\s\+$')        " TrailingWhitespace /\s\+$/
		call matchadd('ExtraWhitespace', ' \+\ze\t')     " SpacesBeforeTabs / \+\ze\t/
		call matchadd('ExtraWhitespace', '[^\t]\zs\t\+') " ExtraTabs /[^\t]\zs\t\+/
		call matchadd('ExtraWhitespace', '^\t*\zs \+')   " LeadingSpaces  /^\t*\zs \+/
		let s:show_extra_whitespace = 1
	else
		call clearmatches()
		let s:show_extra_whitespace = 0
	endif
endfunction

" Bind to a command for convenience
command HwsToggle call ToggleWhitespace()
