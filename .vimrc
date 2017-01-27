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
let mapleader = ','


" vim usability
nnoremap <F1> :set invpaste paste?<CR>
set pastetoggle=<F1>    " toggle paste
set showmode


" NeoBundle
"" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

"" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

"" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

"" Let NeoBundle manage NeoBundle
"" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"" My Bundles here:
"" Refer to |:NeoBundle-examples|.
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'davidhalter/jedi'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'kevinw/pyflakes-vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'fatih/vim-go'
NeoBundle 'vim-scripts/ZoomWin'


call neobundle#end()

"" Required:
filetype plugin indent on

"" If there are uninstalled bundles found on startup,
"" this will conveniently prompt you to install them.
NeoBundleCheck

" NerdTREE
let NERDTreeShowHidden=1
"" auto open if no files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"" autoclose if nerdtree is the last tab"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"" toggle map"
map <leader>b :NERDTreeToggle<CR>

" easymotion
"" move anywhere
nmap s         <Plug>(easymotion-bd-w)
vmap s         <Plug>(easymotion-bd-w)
nmap <leader>s <Plug>(easymotion-overwin-w)
vmap <leader>s <nop>
" move between lines
" (also between empty lines with indentation)
nmap <leader>l <Plug>(easymotion-overwin-line)
vmap <leader>l <Plug>(easymotion-overwin-line)
" move over the line
nmap <leader>z <Plug>(easymotion-lineanywhere)
vmap <leader>z <Plug>(easymotion-lineanywhere)
" move to place with specific symbols
nmap <leader>w <Plug>(easymotion-overwin-f2)
vmap <leader>w <Plug>(easymotion-overwin-f2)
" turn on visual mode and select to specific place
nmap <leader>v v<Plug>(easymotion-bd-w)
nmap <leader>V V<Plug>(easymotion-bd-jk)
nmap <leader><C-v> <C-v><Plug>(easymotion-bd-w)
" Search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1


" Python
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python set tw=110
au FileType python set tabstop=4                         " tab with <tab>
au FileType python set shiftwidth=4                      " tab with << and >>
au FileType python set softtabstop=4                     " also for <BS>
au FileType python set et                                " expand tab, insert spaces instead of <tab>

au Filetype yaml set et
au Filetype yaml set tabstop=2


" other
"au BufRead *.txt set tw=78
"au BufRead *.txt set fo+=t
"au BufRead *.txt set fo+=a " refomart
au BufReadPost * if line("'\"") | exe "normal '\"" | endif
au! BufNewFile,BufRead *.ino,*.pde setlocal ft=arduino
au BufNewFile,BufRead *.less set filetype=less

" Shortcut commands
command R !python %

" pdb command
au FileType python map <Leader>p :call InsertPDB()<CR>
function! InsertPDB()
   let trace = expand("import pdb; pdb.set_trace()")
   execute "normal O".trace
endfunction
au FileType python map <Leader>r :call RunPythonScript()<CR>
function! RunPythonScript()
    execute ":w"
    execute "!python %"
endfunction

" Go commands - https://github.com/fatih/vim-go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>d <Plug>(go-doc-browser)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gi <Plug>(go-implements)
au FileType go nmap <Leader>gd <Plug>(go-doc)
