" .vimrc by Flavio Furlan (furlan@abap101.com)
" Shared by: https://github.com/furlan/vimfiles.git

" Automatic reloading of vimrc
autocmd! bufwritepost ~/.vim/vimrc source %

" Remap mapleader key
let mapleader = ","

" Quit commands redefinition
noremap <Leader>q :quit<CR>
noremap <Leader>Q :qa!<CR>

" Tab navigation
map <Leader>t <esc>:tabnew<CR>
map <Leader>z <esc>:tabprevious<CR>
map <Leader>x <esc>:tabnext<CR>

" ##### Split windows {
" Move around easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Create windows
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j
nnoremap <leader>c <C-w>q
" }

" easier moving of code blocks (better identation)
vnoremap < <gv
vnoremap > >gv

" start with syntaxe 
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number "show line numbers
set tw=79  "width of document (used by gd)
set nowrap "don't automatically wrap on load
set fo-=t  "don't automatically wrap text when typing
"set colorcolumn=100
"highlight ColorColumn ctermbg=233
set ruler

"easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Disable stupid backup and swap files - they trigger too many events for file system watchers
set nobackup
set nowritebackup
set noswapfile

colorscheme badwolf

" Sets markdown syntax for *.md files.
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Wrap markdown files.
autocmd BufRead,BufNewFile *.md set wrap
autocmd BufEnter *.md colorscheme badwolf

" Pathogen call
execute pathogen#infect()

" Load Airline plugin automatically
set laststatus=2

" Load NERDTree automatically
"autocmd vimenter * NERDTree

"Stick this in your vimrc to open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
