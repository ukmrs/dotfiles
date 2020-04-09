call plug#begin('~/.local/share/nvim/plugged')

	Plug 'w0rp/ale'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'morhetz/gruvbox'
	Plug 'taigacute/gruvbox9'
	Plug 'lifepillar/vim-gruvbox8'

	Plug 'vim-python/python-syntax'
	Plug 'tmhedberg/SimpylFold'
	Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'jiangmiao/auto-pairs'

	Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'


call plug#end()

let g:deoplete#enable_at_startup = 1

" Set of basic vim options
colorscheme gruvbox8
set number relativenumber
set autoindent
set smarttab
set ignorecase
set smartcase
set undofile
set colorcolumn=99


let g:airline_theme='bubblegum'
set background=dark " use dark mode
" set background=light " uncomment to use light mode

" Syntax highlighting
let g:python_highlight_all = 1

" close this deoplete bullshit at the top
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Complete with <TAB>
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~? '\s'
endfunction"}}}

set foldlevel=99

" ALE - Asynchronous LintEngine
let g:ale_linters = {
\   'python': ['flake8'],
\   'rust': ['rls'],
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\   'html': ['prettier'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'python': ['black'],
\   'rust': ['rustfmt'],
\}

"==============
" Key Bindings
"==============

" Leader key
let mapleader = ' '


" ALE - Asynchronous Lint Engine
map <C-b> :ALEFix<CR>
map <Leader>g :ALEGoToDefinitionInSplit<CR>
map <Leader>G :ALEGoToDefinition<CR>
