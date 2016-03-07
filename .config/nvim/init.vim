" プラグインのインストール
call plug#begin('~/.config/nvim/plugged')

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

set fileencoding=utf-8    " ファイル保存時の文字コード
set encoding=utf-8        " vim 内部の文字コード
set fileformat=unix       " 改行コードが LF になる
set ignorecase            " 検索時に大文字小文字を無視
set smartcase             " 大文字小文字が含まれている場合は区別
set wrapscan              " 検索時にファイルの最後まで行ったら最初に戻る
set tabstop=4             " タブ文字のサイズ
set shiftwidth=4          " 自動インデントのサイズ
set softtabstop=0         " タブキーで入力されるスペース数 0でtabstop値
set expandtab             " タブをスペースに展開する
set autoindent            " 自動でインデント
set smartindent           " 新しい行のインデントを前の行と同じ量にする
set backspace=indent,eol,start " バックスペースでインデントや改行を削除
set textwidth=0           " 自動折り返しをしない
set vb t_vb=              " beep音を消す
set wildmode=list:longest " 補完動作
set showtabline=2         " タブを常に表示
set scrolloff=5           " スクロール時の余白確保
set showmatch             " 括弧入力時に対応する括弧を表示
set wildmenu              " コマンドライン補完
set number                " 行番号表示
set clipboard=unnamed     " レジスタをクリップボードに変更
set nobackup              " バックアップファイルを作成しない
set noswapfile
set ambiwidth=double      " ambiguous widthな文字の幅を2にする
set laststatus=2          " ステータス行を2行に(lightline表示のため)
set list                  " 見えない文字を見える化
set listchars=tab:▸\ ,extends:<,trail:-,eol:¬ " listモードの時の文字の表示

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
