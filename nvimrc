execute pathogen#infect()

set tags=./tags;/

set encoding=utf-8

set history=1000

set hlsearch
set incsearch
"set ignorecase
set smartcase

set mouse=a

set undofile
set undodir=~/.nvim/undo,.

set backupdir=~/.nvim/tmp,.
set directory=~/.nvim/tmp,.

set wildmode=longest,list,full
set wildmenu
set wildignore=*.o,*.obj
set backspace=indent,eol,start

"set noesckeys

let mapleader=" "

""""""""""""""""""""""""""""""
" Misc mappings
""""""""""""""""""""""""""""""
" {{{
cnoremap w!! w !sudo tee % >/dev/null
inoremap jk <Esc>

vnoremap < <gv
vnoremap > >gv

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap Q @@
" }}}

""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""
" {{{
syntax on
filetype plugin indent on
colorscheme jellybeans
" }}}

""""""""""""""""""""""""""""""
" Plugin mappings
""""""""""""""""""""""""""""""
" {{{
"" Gundo
nnoremap <Leader>u :GundoToggle<CR>

" screen
vnoremap <Leader>e :ScreenSend<CR>
nnoremap <Leader>e V:ScreenSend<CR>

" CtrlPBuffer
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>

" Tagbar
nnoremap <Leader>tt :TagbarToggle<CR>
" }}}

""""""""""""""""""""""""""""""
" Leader bindings
""""""""""""""""""""""""""""""
" {{{
nnoremap <Leader>tg :!ctags -R .<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>n :bp<CR>
nnoremap <Leader>m :bn<CR>
nnoremap <silent> <Leader>v :e ~/.nvimrc<CR>
nnoremap <silent> <Leader>/ :noh<CR>
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <silent><C-n> :set relativenumber! relativenumber?<CR>

" swap selected text with last deleted
vnoremap <Leader>s <Esc>`.``gvP``P
" }}}

""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""
" {{{
set guioptions-=m " remove menu bar
set guioptions-=T " remove toolbar
set t_Co=256

"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)

set list listchars=tab:»\ ,trail:·
set autoread
set visualbell
set number
set relativenumber
set nowrap
set showcmd
set showmode
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround
set cindent

function! WordWrap()
    set wrap
    set linebreak
    set nolist
    set formatoptions+=l
endfunction
" }}}

""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""
" {{{
augroup indentation
    autocmd!
    autocmd FileType ocaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_asm
    autocmd!
    autocmd FileType asm setlocal noexpandtab nocindent
augroup END

augroup filetype_go
    autocmd!
    autocmd Filetype go setlocal noexpandtab
augroup END
" }}}
