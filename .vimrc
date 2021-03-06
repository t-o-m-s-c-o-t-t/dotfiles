call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'              " Git wrapper
Plug 'tpope/vim-surround'              " csab (change surround, replace a with b)
Plug 'tpope/vim-vinegar'               " tweaks to netrw
Plug 'rking/ag.vim'                    " ag inside vim with links
Plug 'scrooloose/syntastic'            " syntax checking
Plug 'scrooloose/nerdcommenter'        " quick commenting - \ci to toggle comments
Plug 'vim-airline/vim-airline'         " statusline
Plug 'vim-airline/vim-airline-themes'  " +themes
Plug 'godlygeek/tabular'               " :Tabularize /, - table with comma sep
Plug 'ctrlpvim/ctrlp.vim'              " Ctrl-P fuzzy file finder
Plug 'airblade/vim-gitgutter'          " Git changes in the left gutter
Plug 'Shougo/echodoc.vim'              " Prevent preview windowD
Plug 'cespare/vim-toml'                " TOML
Plug 'dracula/vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

call plug#end()

colorscheme dracula

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

" BINDINGS "
set pastetoggle=<F2>

" Make help files open in a new tab, rather than a split
" Abbreviates 'help' to 'tab help' in command mode
cabbrev help tab help

" PLUGIN CONFIG "

" vim-airline - statusline
let g:airline_powerline_fonts = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16'
let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif
let g:airline_symbols.branch = 'A '
set laststatus=2                     " Always show statusline

" ctrlp - Fuzzy file finder
let g:ctrlp_map = '<c-p>'            " Bind to Ctrl-P
let g:ctrlp_cmd = 'CtrlP'            " Default command
let g:ctrlp_show_hidden = 1          " show hidden files by default
let g:ctrlp_working_path_mode = 'ra' " root dir (e.g. git root) else current dir

" ag
let g:ag_prg="ag -u --vimgrep --smart-case"

" netrw
let g:netrw_liststyle=1

" vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

let g:deoplete#sources#go#gocode_binary = '/home/tom/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#unimported_packages = 1
let g:deoplete#sources#go#source_importer = 1
let g:deoplete#sources#go#builtin_objects = 1
let g:deoplete#sources#go#fallback_to_source = 1

call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
