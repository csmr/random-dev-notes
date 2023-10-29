" file settings
set backup
set writebackup
" backup files dir
set backupdir=~/_doxxx/backups 
" swap file dir
set directory=~/_doxxx/backups
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
set statusline=%<%f\ " Filename                                                                                    
set statusline+=\ [%{getcwd()}] " Current dir                                                                      
set statusline+=%w%h%m%r " Options                                                                                 
set statusline+=\ [%{&ff}/%Y] " Filetype                                                                           
set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of                                             
set statusline+=[tabs=%{&ts}]                                                                                      
set statusline+=%=%-14.(line:%l,col:%c%V%)\ %p%% " Right aligned file nav

"set guifont=* " font selector on startup
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
