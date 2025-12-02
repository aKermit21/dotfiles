" enable mouse
set mouse=a

" highlight search
set hls
nnoremap <F4> :set hls!<CR>

syntax on

" avoid Esc
inoremap ;; <Esc>

" spell check
set spelllang=pl
" set spell

" backups
set backup
set backupdir=~/.vim/backup/
set writebackup
set backupcopy=yes
" Meaningful backup name, ex: filename@2015-04-05.14:50
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

" Insert mode with underline
au InsertEnter,InsertLeave * set cul!

" Only small letters - case insensitive search, 
" with some capital letters - sensitive.
"   can be override by \c or \C
set ignorecase
set smartcase

" Enable mouse in some operations
set mouse=a

" Folding with defined markers
set foldmethod=marker fmr=<<<,>>>

" Finding with counting at bottom
set shortmess-=S

" Tile - markdown Headers# to Red
hi Title term=NONE ctermfg=Red gui=NONE

" vimdiff specific color scheme
if &diff
	colorscheme industry
endif
