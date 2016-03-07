" プラグインのインストール
call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/neocomplcache'
Plug 'othree/html5.vim'
Plug 'Shutnik/jshint2.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'wavded/vim-stylus'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'Shutnik/jshint2.vim'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
Plug 'tyru/open-browser.vim'
Plug 'thinca/vim-splash'
Plug 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
Plug 'altercation/vim-colors-solarized'
Plug 'haya14busa/incsearch.vim'

call plug#end()

" ファイル保存時の文字コード
set fileencoding=utf-8
" vim 内部の文字コード
set encoding=utf-8
" 改行コードが LF になる
set fileformat=unix
" 検索時に大文字小文字を無視
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" 0の場合はtabstopと同じ BSにも影響する
set tabstop=4
set shiftwidth=4
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
" ステータス行を2行に(lightline表示のため)
set laststatus=2
" 見えない文字を見える化
set list
" listモードの時の文字の表示
set listchars=tab:▸\ ,extends:<,trail:-,eol:¬
" 行末・行頭での左右キーで移動可能にする
"set whichwrap=b,s,h,l,<,>,[,]

" colorscheme設定
set background=dark
colorscheme solarized

" ~/.vim/filetype.vim
au BufNewFile,BufRead *.gradle setf groovy

" NeoComplCacheの設定
let g:neocomplcache_enable_at_startup = 1

" unite.vimの設定
if has('mac')
  let g:unite_kind_file_delete_file_command="rmtrash $srcs"
  let g:unite_kind_file_delete_directory_command="rmtrash $srcs"
endif

" vimfilerの設定
let g:vimfiler_as_default_explorer = 1 " vimfilerをdefault
let g:vimfiler_safe_mode_by_default = 0 " safe modeをoff
let g:vimfiler_enable_auto_cd = 1 " カレントディレクトリをvimfilerで表示中のディレクトリに変更

" emmet
let g:user_emmet_expandabbr_key = '<C-E>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,hbs EmmetInstall

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim-splash
let g:splash#path = $HOME . '/.dotfiles/vim-splash.txt'

" incsearch.vim
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
