" プラグインのインストール
call plug#begin('~/.config/nvim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'tyru/open-browser.vim'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'jacoborus/tender.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug '/usr/local/opt/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

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

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme tender

" unite.vimの設定
if has('mac')
  let g:unite_kind_file_delete_file_command="rmtrash $srcs"
  let g:unite_kind_file_delete_directory_command="rmtrash $srcs"
endif

" vimfilerの設定
let g:vimfiler_as_default_explorer = 1 " vimfilerをdefault
let g:vimfiler_safe_mode_by_default = 0 " safe modeをoff
let g:vimfiler_enable_auto_cd = 1 " カレントディレクトリをvimfilerで表示中のディレクトリに変更
nnoremap <C-o> :<C-u>VimFilerTab<CR>
inoremap <C-o> <ESC>:<C-u>VimFilerTab<CR>

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
map gx <Plug>(openbrowser-smart-search)

" FZF
map <C-P> :FZF<CR>

" https://github.com/junegunn/fzf/wiki/Examples-(vim)#narrow-ag-results-within-vim
function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '30%'
\ })

" Ctrl + Shift + F で ag できるようにする
nmap <C-S-F> :Ag<CR>

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" .config/nvim/init.vim を開く
nmap ,v :edit $MYVIMRC<CR>

" vim-markdown (from vim-polyglot)
let g:vim_markdown_frontmatter = 1

" vue のシンタックスハイライトがたまに切れる問題の対処
" https://github.com/posva/vim-vue
autocmd FileType vue,hbs,html syntax sync fromstart

call deoplete#enable()

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'vue': ['vls'],
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
set signcolumn=yes
