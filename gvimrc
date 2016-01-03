"set guifont=Monaco\ for\ Powerline:h12
set guifont=Source\ Code\ Pro:h14
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set background=light              " Background.
set lines=46 columns=166          " Window dimensions.

" Uncomment to use.
" set guioptions-=r                 " Don't show right scrollbar

colorscheme badwolf

" Save using Command-S on MacVim without replacing
noremap <D-s> :w<CR>
