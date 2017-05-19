" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
" runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
" call plug#begin('~/.vim/plugged')

set nocompatible

" clipboard between windows!
" set clipboard+=unnamed
"set guioptions+=a

" These are my personal settings as of 10/5/2016
" I set nocompatible b/c it's debian and it works.
" turned on syntax, background, mouse, indentation, bracket match, and showcmd
" I mapped a bunch of keys to esc so I don't have to use that pinky.
" i've also decided to stop using caps to save my pinky ;0.  no more shift
" i'm going to set numbers to show the lines

" reducing timeout length.
set timeoutlen=170 ttimeoutlen=10

"mapping normal mode move keys
nnoremap k <Down>
nnoremap j <Up>

" mapping the escape keys
inoremap jk <ESC>
inoremap kj <ESC>

augroup kill_ws
	autocmd!
	autocmd BufWritePre * :%s/\s\+$//e
augroup END

" mapping brackets and parenthesis
inoremap kk ()<Esc>i
inoremap jj <CR>{<CR>}<Esc>O
inoremap ii []<Esc>i
inoremap ff ""<Esc>i
inoremap ee :
nnoremap ee :

" mapping the numbers so that double press is easier than shift
inoremap 88 *
inoremap 77 &
inoremap 66 ^
inoremap 55 %
inoremap 44 $
inoremap 33 #
inoremap 22 @
inoremap 11 !

" mapping or, plus, and  underscore to double press
inoremap \\ <Bar>
inoremap -- _
inoremap == +

" mapping ss to tab
inoremap df <Tab>

" maping double pre  of ;; to :
inoremap ;; :
"nnoremap ;; :

" mapping double pres of , and .
inoremap ,, <
inoremap .. >

colorscheme monokai
set number
"show numerlines"

"set expandtab
"set tabstop=4
set shiftwidth=4

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
 if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
 endif

" Uncomment the following to have Vim load indentation rules and plugins
"according to the detected filetype.
 if has("autocmd")
  filetype plugin indent on
 endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" For setting up homebrew on the cpu
" cd /Volumes/Storage/goinfre/$(whoami)
" git -C homebrew pull || git clone https://github.com/Homebrew/homebrew.git ;
" brew update
" source ~/.zshrc
"
