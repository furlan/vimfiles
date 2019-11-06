" .vimrc by Flavio Furlan (furlan@abap101.com)
" Shared by: https://github.com/furlan/vimfiles.git
" Automatic reloading of vimrc
autocmd! bufwritepost ~/.vim/vimrc source %

" Remap mapleader key
let mapleader = ","

" Disable arrow keys in Normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Disable arrow keys in Visual mode
vmap <up> <nop>
vmap <down> <nop>
vmap <left> <nop>
vmap <right> <nop>

" Quit commands redefinition
noremap <Leader>q :quit<CR>
noremap <Leader>Q :qa!<CR>

" Use ENTER key to insert line without enter in Insert Mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

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

" quick pairs
imap <Leader>' ''<esc>i
imap <Leader>" ""<esc>i
imap <Leader>( ()<esc>i
imap <Leader>[ []<esc>i
imap <Leader>{ {}<esc>i

" start with syntaxe 
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc
set relativenumber
nnoremap <Leader>r :call NumberToggle()<cr>

set tw=79  "width of document (used by gd)
"set nowrap "don't automatically wrap on load
set wrap   "always wrap on open

"don't automatically wrap text when typing
set textwidth=0
set wrapmargin=0
set formatoptions-=t  

set ruler

" change behavior with wrap word lines.
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

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

" Set highlight actual line
set cursorline
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline

" ##### Vundle configuration {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/badwolf'
Plugin 'easymotion/vim-easymotion' 
Plugin 'junegunn/goyo.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-syntastic/syntastic'
Plugin 'mtscout6/syntastic-local-eslint.vim'
call vundle#end()            " required
filetype plugin indent on    " required
" }}}
" ##### Syntastic configuration {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
" }}}
"
" ##### EasyMotion configuration {{{
map <Leader>w <Plug>(easymotion-w)
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" }}}

" ##### Airline  {{{
" Load Airline plugin automatically
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme_patch_func = 'AirlineThemePatch'
  function! AirlineThemePatch(palette)
    if g:airline_theme == 'badwolf'
      for colors in values(a:palette.inactive)
        let colors[3] = 245
      endfor
    endif
  endfunction

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = '»'
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = '«'
let g:airline_right_alt_sep = '|'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = 'r'
let g:airline_symbols.linenr = ''
" }}}

" ##### Stick to open CtrlP on work directory to Ctrl+o {{{
map <C-p> :CtrlP ~/work<CR>
" }}}

" ##### NERDTree automatically {{{
"autocmd vimenter * NERDTree

"Stick this in your vimrc to open NERDTree with Ctrl+n
""map <C-n> :NERDTreeToggle<CR>
map <Leader>n <esc>:NERDTreeToggle<CR>
" }}}

" https://github.com/sjl/badwolf
colorscheme badwolf 

autocmd BufEnter *.md colorscheme badwolf

" Sets markdown syntax for *.md and *.txt  files.
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.txt set filetype=markdown

" Wrap markdown files.
autocmd BufRead,BufNewFile *.md set wrap 
autocmd BufRead,BufNewFile *.md set linebreak
autocmd BufRead,BufNewFile *.md set nocursorline 
let g:vim_markdown_folding_disabled=1

" Define Ctrl-M to toggle Markdown mode
map <Leader>m <esc>:Goyo<CR>

autocmd BufRead,BufNewFile *.txt set wrap 
autocmd BufRead,BufNewFile *.txt set linebreak
autocmd BufRead,BufNewFile *.txt set nocursorline 

" Sets javascript syntax for *.json files.
autocmd BufRead,BufNewFile *.json set filetype=javascript
