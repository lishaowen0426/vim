" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

let mapleader=";"


syntax enable
syntax on                  " Enable syntax highlighting.


set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.
set cursorline

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.
set ignorecase

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

set list                   " Show non-printable characters.
set number

set switchbuf=usetab

if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" The fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
if &shell =~# 'fish$'
  set shell=/bin/bash
endif

" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#temporary-files
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap/
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo


function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer cterm=NONE ctermbg=10 ctermfg=0 guibg=#00FF00 guifg=#000000
  hi! BuffetBuffer cterm=NONE ctermbg=7 ctermfg=0 guibg=#00FF00 guifg=#000000
endfunction

" vundle plugins
set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'majutsushi/tagbar'
Plugin 'dyng/ctrlsf.vim'
Plugin 'bagrat/vim-buffet'
Plugin 'preservim/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()

filetype plugin indent  on  " Load plugins according to detected filetype.
" colorscheme
set background=dark
"colorscheme solarized
colorscheme molokai
"colorscheme phd


" fold
set foldmethod=indent
set nofoldenable


" tagbar
let tagbar_left=1
nnoremap <Leader>lt :TagbarToggle<CR>
let tagbar_width=32
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" keymaps
nnoremap <Leader>q :tnext<CR>
nnoremap <Leader>w :tprevious<CR>
nnoremap <Leader>sf :CtrlSF
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>dir :NERDTreeToggle<CR>
nnoremap <Leader>f :Files<CR>
noremap <silent><space>= :resize +3<cr>
noremap <silent><space>- :resize -3<cr>
noremap <silent><space>, :vertical resize -3<cr>
noremap <silent><space>. :vertical resize +3<cr>
"switch windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" switch buffers
noremap <silent> <Leader>b :bprevious<CR>
noremap <silent> <Leader>n :bnext<CR>


nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

let g:buffet_show_index = 1
let g:buffet_powerline_separators = 0
let g:ycm_confirm_extra_conf = 0


set tags=./.tags;,.tags;
