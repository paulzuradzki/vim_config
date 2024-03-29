"VIM in the shell

"System clipboard
set clipboard=unnamed

"Line Numbering
set nu

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

au BufNewFile, BufRead *.py
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set textwidth=79
	\ set expandtab
	\ set autoindent
	\ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
	\ set tabstop=2
	\ set softabstop=2
	\ set shiftwidth=2

set encoding=utf-8

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with spacebar
nnoremap <space> za

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set nocompatible " required
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternativel, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of 
" Vundle used Bundle instead of Plugin
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end() 	  " required
filetype plugin indent on " required

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR> 
" e.g., map leader to space, so space-g will Go To definition

au BufRead,BufNewFile *.py,*.pw,*.c,*.h match BadWhitespace /\s\+$/
let g:SimpylFold_docstring_preview=1

let python_highlight_all=1
syntax on

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

call togglebg#map("<F5>")

