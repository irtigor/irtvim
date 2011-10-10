"
" Igor Ramos Tiburcio
"

set nocompatible                  " Use Vim defaults (much better!)
set bs=indent,eol,start           " allow backspacing over everything in insert mode
set viminfo='20,\"50              " read/write a .viminfo file, don't store more
                                  " than 50 lines of registers
set history=50                    " keep 50 lines of command line history
set directory=~/.vim/swap,~/tmp,. " keep swp files under ~/.vim/swap
set ruler                         " show the cursor position all the time
set number                        " show line numbers
set smarttab                      " /mart tabulation and backspace
set mouse=a                       " enable mouse
set showcmd                       " show incomplete cmds
set title                         " show title
set incsearch                     " find while typing
set t_Co=256                      " terminal uses 256 colors
set modelines=0                   " for better security
set ignorecase                    " case insensitive patterns
set smartcase                     " case insensitive patterns - when only lowercase is used
set pastetoggle=<F2>              " F2 toggles indenting when pasting
set wildmenu                      " make command-line completion bash like + menu
set wildmode=longest:full         " sets wildmode, also invokes wildmenu (if enabled)
set shortmess+=I                  " I - don't give the intro message when starting Vim.
set laststatus=2                  " always show status line

set statusline=%f%h%m%r%w\ %y\ [%{&ff}]\ [%{&fenc}]\ %{fugitive#statusline()}\ %=\ %c,%l/%L\ %P
                            " statusline format

filetype off                " Disabling before Pathogen. Loaded later.
call pathogen#runtime_append_all_bundles()

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup linux
    autocmd!
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
    " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
    autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp

    " Switch to working directory of the open file
    autocmd BufEnter * lcd %:p:h
  augroup END

  " Enable formatting based on file types
  augroup myfiletypes
    autocmd!
    autocmd FileType ruby,eruby,yaml,cucumber,vim,lua,latex,tex set autoindent shiftwidth=2 softtabstop=2 expandtab
    autocmd BufRead *.mkd,*.markdown  set ai formatoptions=tcroqn2 comments=n:>
    autocmd FileType python set shiftwidth=4 tabstop=4
    autocmd FileType make set noexpandtab
  augroup END 
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin indent on

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" Set the leader key
let mapleader = ","

" Yank from vim to clipboard
vmap <leader>c "+y
" Paste from clipboard to vim
vmap <leader>v "+p

" Remove highlighting search results
nnoremap <leader><space> :noh <CR>

map <leader>t <Esc>:tabnew<CR>
map <leader>w <Esc>:tabclose<CR>
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt

" nerdtree
map <F3> :NERDTreeToggle \| :silent NERDTreeMirror<CR>

" CommandT
nnoremap <leader>o :CommandT<CR>

" supertab completation
let g:SuperTabDefaultCompletionType = "context"

" Substitutions
"---------------------------------
if &term !=# "linux"
    set list listchars=tab:\»\ ,trail:·,extends:›,precedes:‹
endif

" Set color scheme
colorscheme molokai
