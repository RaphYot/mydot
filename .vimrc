" Pathogen
execute pathogen#infect()

" setup
filetype on
filetype plugin indent on
set nocompatible        " Use Vim defaults (much better!)
set bs=2                " allow backspacing over everything in insert mode
"set ai                  " set autoindenting on
set nobackup            " keep a backup file
set viminfo='20,\"50    " read/write a .viminfo 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set vb t_vb=            " nobeep
set tabstop=4           " tab with <tab>
set shiftwidth=4        " tab with << and >>
set et                  " expand tab, insert spaces instead of <tab>
syntax enable
set bg=dark
"colorscheme molokai
set hlsearch
set list
set listchars=tab:»·,trail:·

set showmode

" Python
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python set tw=110
au FileType python set tabstop=4                         " tab with <tab>
au FileType python set shiftwidth=4                      " tab with << and >>
au FileType python set softtabstop=4                     " also for <BS>
au FileType python set et                                " expand tab, insert spaces instead of <tab>

" other
au BufRead *.txt set tw=78
au BufRead *.txt set fo+=t
au BufRead *.txt set fo+=a " refomart
au BufReadPost * if line("'\"") | exe "normal '\"" | endif
au! BufNewFile,BufRead *.ino,*.pde setlocal ft=arduino
au BufNewFile,BufRead *.less set filetype=less

" Shortcut commands
command R !python %

" pdb command
let mapleader = ','
map <Leader>p :call InsertPDB()<CR>
function! InsertPDB()
   let trace = expand("import pdb; pdb.set_trace()")
   execute "normal O".trace
endfunction
map <Leader>b :call RunPythonScript()<CR>
function! RunPythonScript()
    execute ":w"
    execute "!python %"
endfunction

