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
colorscheme murphy " def colors
set cursorline

" always status line
set ls=2
set statusline=\ \%n\%4.4m\ " Buffer N
set statusline+=%1*\ %<%f\ %* " Filename
set statusline+=%w%h%r\ " Options
set statusline+=\‧\ %{&ff}\‧%{&fenc}\‧%Y\ " Filetype
set statusline+=\‧\ ts=%{&ts}
set statusline+=%=%-14.(line:%l,col:%c%V%)\ %p%% " Right aligned file nav

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
