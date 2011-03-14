" Vim Config File
"
" author: Miles Z. Sterrett <miles.sterrett@gmail.com>

" 256 colors
set t_Co=256

" Preferred colorscheme
colorscheme evening

" Tab and Indent Settings
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent

set visualbell

set backspace=indent,eol,start

set title         " set terminal title
set history=50    " keep 50 commands, etc in history
set hidden        " More effective buffer handling
set nocompatible  " Prevent vim from emulating vi bugs and limitations
set showmatch     " Breifly show matching brace/parenthese/bracket
set autoread      " Auto-reload changed files
set ruler         " each window will contain a status line with cursor position
set showcmd       " display an incomplete command in the lower right corner
set number        " show line numbers
set scrolloff=3   " scroll before the border

set hlsearch      " highlight search terms
set incsearch     " search as you type

set ignorecase
set smartcase     " case-smart searching

" File-type highlighting and configuration
syntax on
filetype on
filetype plugin on
filetype indent on

" extended matching
runtime macros/matchit.vim

" more useful tab completion
set wildmenu
set wildmode=list:longest

" Keep all tmp files in a central location
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Make tabs and trailing spaces visible when request
" (<leader>s)
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Highlight trailing whitespace characters and tabs not used for indention
highlight WhitespaceErrors ctermbg=Red guibg=Red
match WhitespaceErrors /\s\+$\|[^\t]\@<=\t\+/

" Remove trailing whitespace
noremap <silent> <Leader>rtw :%s/\s\+$//g<CR>``

" Map F9 to set foldmethod to syntax
map <F9> :set foldmethod=syntax<CR>

" Map ,cd to change to the directory of the file being edited
map ,cd :cd %:p:h<CR>

" Use the mouse in terminal Vim!
"set mouse=a
"set ttymouse=xterm2
" Honestly, they work fine.  I just hate them

" Swap ` and '.  ` is more useful in every situation
" that I can imagine!
noremap ' `
noremap ` '

" Take care of forgetting to use sudo with :w!!
cmap w!! %!sudo tee > /dev/null %

augroup mkd
  autocmd BufRead *.mkd,*.md,*.markdown  set ai formatoptions=tcroqn2 comments=n:>
augroup END

" Commands for specific projects
cmap ccm :cd ~/code/chacha.me
cmap aln :cd ~/code/askedlastnight.com
cmap hol :cd ~/code/holscher
cmap cwp :cd ~/code/chacha-widget-portal
