" 色設定
if has("syntax")
  :syntax on

  "highlight LineNr ctermfg=darkyellow guifg=darkyellow
  :highlight NonText ctermfg=darkgrey gui=NONE guifg=darkcyan
  :highlight Folded ctermfg=blue
  :highlight SpecialKey cterm=underline ctermfg=darkgrey guifg=darkcyan

  :highlight Cursor ctermbg=darkyellow guibg=darkyellow
  :highlight CursorIM ctermbg=red guibg=red

  " 256color settings
  if &term=='xterm-256color'
    colorscheme orangeocean256
	highlight Normal ctermbg=none
  else
    colorscheme ron
    highlight CursorLine cterm=underline ctermbg=darkgrey guibg=black
    highlight CursorColumn cterm=none ctermbg=darkgrey guibg=black
  endif

  " カレントウィンドウにのみ罫線を引く
  augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorcolumn nocursorline
    autocmd WinEnter,BufRead * set cursorcolumn cursorline
    " PHPで重いので使わない
    autocmd WinEnter,BufRead *.php set nocursorcolumn nocursorline
  augroup END
endif
" filetype specific
"----------------------------------------------------------
filetype plugin indent on
autocmd FileType python set ts=4 sts=4 sw=4 noet noci si ai cinwords=if,elif,else,for,while,try,except,finally,def,class,with indentkeys+=#
"color setting end

"language setting start
if has('mac')
    set langmenu=japanese

    if exists($LANG) && $LANG == 'ja_JP.UTF-8'
        set langmenu=ja_ja.utf-8.macvim
        set encoding=utf-8
        set ambiwidth=double
    endif
endif
"language setting end

" tab
"----------------------------------------------------------
set et ts=2 sw=2 sts=2
set list listchars=tab:>-,eol:$,trail:*

" edit
"-----------------------------------------------------------
filetype plugin on
" vundle setting start
set nocompatible
filetype off
set rtp+=~/dotfiles/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'Shougo/neocomplcache'
Bundle 'mattn/zencoding-vim'
Bundle 'Shougo/unite.vim'
Bundle 'tpope/vim-rails'
Bundle 'thinca/vim-ref'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
filetype plugin indent on "required!
" vundle setteing end

set autoindent
set cindent
set smartindent 
set ignorecase
set smartcase
set showtabline=1
set tabpagemax=15 
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set wrapscan
set showmatch
set wildmenu
set formatoptions+=mM
set ruler
set nolist
set wrap
set laststatus=2
set cmdheight=2
set showcmd
set title
set expandtab 
set incsearch 
set hlsearch
set number 
set whichwrap=b,s,h,l,<,>,[,] 
set nowrapscan 
set backup
set clipboard+=autoselect
set clipboard+=unnamed
set nocompatible 
set t_Co=256 
set fileencoding=utf-8
colorscheme colorful256 
set backupdir=$HOME/vimbackup 

"-------------------------------------------
" keymap
"-------------------------------------------

"========================== normal mode
nmap <ESC><ESC> :noh<CR>
nmap <C-N> :bnext<CR>
nmap <C-P> :bprevious<CR>
nnoremap <Space>n 10<C-w><<CR>
nnoremap <Space>m 10<C-w>><CR>

"========================== visual mode


"========================== insert mode


"========================== command  mode

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
au BufRead,BufNewFile *.as set ft=javascript syntax=javascript


"taglist
let Tlist_Ctags_Cmd = "/usr/bin/ctags " "ctagsのパス

"vimproc setting start
let g:vimproc_dll_path = $HOME.'/dotfiles/.vim/autoload/proc.so'
"vimproc setting end


"unite.vim setting start
" 入力モードで開始する
let g:unite_enable_start_insert=1
"インサート/ノーマルどちらからでも呼び出せるようにキーマップ
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer file mru<CR>
inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file mru<CR>
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
"unite.vim setting end
