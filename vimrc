"set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
"set nocompatible
set ttyfast
"set lazyredraw
" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>. dd
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ General Config ====================
set clipboard+=unnamed
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=";"

" =============== Vim-Plug Initialization ===============
if filereadable(expand("~/.vim/plug.vim"))
  source ~/.vim/plug.vim
endif
au BufNewFile,BufRead *.vim set filetype=vim

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

vnoremap <leader>p "0p

scriptencoding utf-8
set encoding=utf-8
" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

"set nowrap       "Don't wrap lines
set wrap       "Default wrap
"let &colorcolumn=join(range(81,999),",")

set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.pyc,.git,build/*,*.beam,ebin/*,*.class,*.lo,*.log,*coverage*,*/tmp/*,*.so,*.swp,*.zip

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Custom Settings ========================
so ~/.yadr/vim/settings.vim

" ================ host key ===============================
" 定义快捷键到行首和行尾
nnoremap <F1> $
nnoremap <F2> 0
" 定义快捷键关闭当前分割窗口
nnoremap <Leader>qq :q!<CR>
" 快速保存关闭
nnoremap <Leader>wq :wq!<CR>
" 定义快捷键保存当前窗口内容
nnoremap <Leader>wr :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nnoremap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nnoremap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap ;ll <C-W>l
" 跳转至左方的窗口
nnoremap ;hh <C-W>h
" 跳转至上方的子窗口
nnoremap ;kk <C-W>k
" 跳转至下方的子窗口
nnoremap ;jj <C-W>j
" 定义快捷键在结对符之间跳转
nnoremap <Leader>m %
" 强制保存
nnoremap <Leader>ww :w !sudo tee % > /dev/null<CR>
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
nnoremap <Leader>sh :sh<cr>

" 自动给字符串加单双引号
:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
:nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

:autocmd FileType ruby       nnoremap <buffer> <leader>co I# <esc>
:autocmd FileType javascript nnoremap <buffer> <leader>co I// <esc>
:autocmd FileType javascript :iabbrev <buffer> iff if (){}<esc>i<CR><esc>kla
:autocmd FileType javascript :iabbrev <buffer> funn function(){}<esc>i<CR><esc>k6la

"let g:molokai_original = 1

nnoremap j gj
nnoremap k gk

:set nocursorcolumn
:set nocursorline
:set guifont=Monaco:h14
:set lines=999 columns=9999 
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_key_invoke_completion = '<C-t>'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
:syntax on

:set fdm=indent


"nnoremap <C-c> :w !pbcopy<CR><CR>
"nnoremap "+p :r !pbpaste<CR><CR>
" ctrl-x for cut
vnoremap <C-x> :!pbcopy<cr>
:nnoremap <leader>sp :set paste<cr>
:nnoremap <leader>snp :set nopaste<cr>
:nnoremap da viwd
" ctrl-c for copy
"vnoremap <C-c> :.w !pbcopy<cr><cr>
map <leader>y y:e ~/clipsongzboard<CR>P:w<cr>:w !pbcopy<CR><cr>:1,$d<cr>:w<cr><C-o><C-o>
" ctrl-v for paste
"nmap <C-v> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
" ctrl-c for copy
"vnoremap <C-c> :.w !pbcopy<cr><cr>
" ctrl-v for paste
"nmap <C-v> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
