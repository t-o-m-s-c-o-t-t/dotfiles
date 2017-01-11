" VIM-specific stuff (not for neovim)

set t_Co=256                  " Use 256 colours (Use this setting only if your terminal supports 256 colours)
set nocompatible              " be iMproved, required
set termguicolors

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
Plugin 'unblevable/quick-scope'          " Quicker navigation with f and F
Plugin 'Shougo/deoplete.nvim'            " Neovim completion
Plugin 'zchee/deoplete-go'               " Deoplete for go completion
Plugin 'Shougo/echodoc.vim'              " Prevent preview windowD
Plugin 'cespare/vim-toml'                " TOML

" Colorschemes
Plugin 'tomasr/molokai'
Plugin 'alessandroyorba/despacio'
Plugin 'chriskempson/base16-vim'

call vundle#end()            " required
filetype plugin indent on    " required

" CONFIGS
" show command in bottom bar
set showcmd
" highlight matching [{()}]
set showmatch
" higlight
"set cursorline
" highlight col
"set cursorcolumn
" Turn off mouse support
set mouse=
" width of a tab in spaces
set tabstop=4
" how many spaces to indend (should match tabstop)
set shiftwidth=4
" set whitespace chars
set listchars=tab:\|-,trail:_,extends:>,precedes:<,nbsp:~,eol:$
" incremental search as you type
set incsearch
" highlight matches of a search
set hlsearch
" scroll so we can always see 10 lines around the cursor
set scrolloff=10
" line numbers
set number
" syntax highlighting
syntax on

" set the colorscheme
let base16colorspace=256  " Access colors present in 256 colorspace
"colorscheme molokai
"colorscheme base16-eighties
colorscheme base16-default-dark

" Use the terminal background (nvim and vim)
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none

" TODO: Set default colorschemes per file type

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
let g:airline_theme='base16'
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

" deoplete
let g:deoplete#enable_at_startup = 1

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect
" Don't show preview in a new split
set completeopt-=preview

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/linux_amd64/'

" vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

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

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>
