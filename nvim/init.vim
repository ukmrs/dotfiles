call plug#begin('~/.local/share/nvim/plugged')

	Plug 'w0rp/ale'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'lifepillar/vim-gruvbox8'

	Plug 'vim-python/python-syntax'
	Plug 'tmhedberg/SimpylFold'
	Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-commentary'  "gcc to  comment
	Plug 'tpope/vim-surround'
	Plug 'jiangmiao/auto-pairs'
	Plug 'mbbill/undotree'  "Questionable
	Plug 'sbdchd/vim-run'
	Plug 'janko/vim-test'
	Plug 'romainl/vim-cool'  "stop highlighting after search
	Plug 'tpope/vim-fugitive'  "git integration
		Plug 'https://github.com/shumphrey/fugitive-gitlab.vim'
		Plug 'https://github.com/tpope/vim-rhubarb'

	Plug 'itchyny/lightline.vim'
	Plug 'https://github.com/cespare/vim-toml'

call plug#end()

" let g:deoplete#enable_at_startup = 1

" Set of basic vim options
set background=dark " use dark mode
" set background=light "use light mode
colorscheme gruvbox8
set number relativenumber
set autoindent
set smarttab
set ignorecase
set smartcase
set undofile
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set foldlevel=99
set sidescrolloff=3
set scrolloff=3
set tabstop=4
set shiftwidth=4

" local
autocmd Filetype rust setlocal colorcolumn=100

" 'wombat', 'solarized', 'darcula'
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }

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
nmap <silent> <leader>t :NERDTree<CR>
nnoremap <leader>q :q<CR>

" GoTo code navigation.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <leader>rr :Run<CR>
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" ALE - Asynchronous Lint Engine
map <silent> <C-b> :ALEFix<CR>
" map <Leader>g :ALEGoToDefinitionInSplit<CR>
" map <Leader>G :ALEGoToDefinition<CR>
