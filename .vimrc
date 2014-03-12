set fileencoding=utf-8
set encoding=utf-8
set fileformat=unix

" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" インクリメンタルサーチ
set incsearch
" 0の場合はtabstopと同じ
" BSにも影響する
set tabstop=2
set shiftwidth=2
" Tabキー押し下げ時の挿入される空白の量
set softtabstop=0
" タブをスペースに展開する
set expandtab
" 自動でインデント
set autoindent
" 新しい行のインデントを前の行と同じ量にする
set smartindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 一行に長い文章を書いていても自動折り返しをしない
set textwidth=0
" beep音を消す
set vb t_vb=
" 補完動作
set wildmode=list:longest
" タブを常に表示
set showtabline=2
" スクロール時の余白確保
set scrolloff=5
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" 行番号表示
set number
" バッファを変更可能にする
set modifiable
" ファイルの書き込みを有効にする
set write
" レジスタをクリップボードに変更
set clipboard=unnamed
" バックアップファイルを作成しない
set nobackup
set noswapfile
" ambiguous widthな文字の幅を2にする
set ambiwidth=double

set list
set listchars=tab:>-
set whichwrap=b,s,h,l,<,>,[,]
" シンタックスハイライト
syntax on

"---------------------------------------------------------------------------
" NeoBundleの設定
"
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'othree/html5.vim'
NeoBundle 'Shutnik/jshint2.vim'
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'jQuery'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'Shutnik/jshint2.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'derekwyatt/vim-scala'

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" ~/.vim/filetype.vim
au BufNewFile,BufRead *.gradle setf groovy

" -------------------------------------------------------
" unite.vimの設定
if has('mac')
  let g:unite_kind_file_delete_file_command="rmtrash $srcs"
  let g:unite_kind_file_delete_directory_command="rmtrash $srcs"
endif

" vimfilerの設定
let g:vimfiler_as_default_explorer = 1 " vimfilerをdefault
let g:vimfiler_safe_mode_by_default = 0 " safe modeをoff
let g:vimfiler_enable_auto_cd = 1 " カレントディレクトリをvimfilerで表示中のディレクトリに変更

" -------------------------------------------------------
" colorscheme設定
let &t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
colorscheme molokai

" -------------------------------------------------------
" emmet
let g:user_emmet_mode='a'
