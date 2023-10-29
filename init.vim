" file settings
set backup
set writebackup
" backup files dir
set backupdir=~/backups
" swap file dir
set directory=~/backups
" timestamp-extension to backups
au BufWritePre * let &bex = '-' . strftime("%Y%m%d%H%M") . '.backup'

" folding
filetype plugin indent on
set foldmethod=indent " fold by indentation

" look-and-feel
colorscheme torte " def colors
set cursorline

" minimalist status
" [bufn][modified][ filepath ][writable|help|ro][ff/fenc/ft][ts][line/col]
set ls=2
set statusline=\ \%n\%4.4m
set statusline+=\ %1*\ %<%f\ %*
set statusline+=\ %w%h%r
set statusline+=\ \‧\ %{&ff}\‧%{&fenc}\‧%Y " format/enc/type
set statusline+=\ \‧\ ts=%{&ts}
set statusline+=\ \‧\ %(l%l\ c%c%V%)

" hide toolbar, menubar and use text-tabs
set guifont=Consolas:h11
set guioptions-=m
set guioptions-=T
set guioptions-=e
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab
set backspace=2 " backspace to del prev in insert mode

" syntax formatting
syntax on
set number " line numbers

" abbreviations
" source ~/.vimabbrev

" key mappings
imap jkk <esc>
