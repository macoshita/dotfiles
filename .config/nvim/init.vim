set fileencoding=utf-8    " ファイル保存時の文字コード
set encoding=utf-8        " vim 内部の文字コード
set fileformat=unix       " 改行コードが LF になる
set ignorecase            " 検索時に大文字小文字を無視
set smartcase             " 大文字小文字が含まれている場合は区別
set wrapscan              " 検索時にファイルの最後まで行ったら最初に戻る
set tabstop=2             " タブ文字のサイズ
set shiftwidth=2          " 自動インデントのサイズ
set softtabstop=0         " タブキーで入力されるスペース数 0でtabstop値
set expandtab             " タブをスペースに展開する
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
set list                  " 見えない文字を見える化
set laststatus=2          " ステータス行を2行に
set listchars=tab:▸\ ,extends:<,trail:-,eol:¬ " listモードの時の文字の表示
set mouse=a               " マウスモード有効
set signcolumn=yes
