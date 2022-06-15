set number
set relativenumber
set showmatch
set hlsearch
set autoindent

syntax on
filetype plugin indent on

call plug#begin("~/.vim/plugged")
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'github/copilot.vim'
call plug#end()

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:airline_theme="google_dark"
hi Normal ctermbg=235
