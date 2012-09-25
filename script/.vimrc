" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" BundleInstall

set nocompatible               " be iMproved
filetype off                   " required!

" set tags for code"
set tags=/home/soffolk/.rvm/gems/ruby-1.9.3-p125/gems/tags

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:

Bundle 'Align'
Bundle 'tpope/vim-rails'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kchmck/vim-coffee-script'
Bundle 'hallison/vim-markdown'
Bundle 'groenewege/vim-less'
Bundle 'bbommarito/vim-slim'
Bundle 'kien/ctrlp.vim'
Bundle 'grep.vim'
Bundle 'scrooloose/nerdcommenter'

" 设置注释 leader
let mapleader=","

"设置grep快捷键
nnoremap <silent> <F5> :Rgrep<CR>


" 字体
set guifont=monaco\ 10

set nobackup
set nowritebackup

"语法高亮
syntax on

"打开命令行补全菜单
set wildmenu
"关闭响铃，闪屏
set vb t_vb=
"显示行号
set nu
"马上跳到搜索匹配
set incsearch
" colorscheme
:colorscheme torte

"根据文件格式载入插件和缩进
filetype plugin indent on
set autoindent

"打开鼠标功能
set mouse=a

"显示特殊字符"
"set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅,eol:$

"指标符宽度
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set foldmethod=manual
nnoremap <space> za

"设置NERDTree
let g:NERDTreeMouseMode = 2
let g:NERDTreeWinSize = 40

" Display extra whitespace
"set list listchars=tab:»·,trail:·

"设置竖线分隔
"set list listchars=tab:\|\
autocmd FileType make     set noexpandtab
autocmd FileType python   set noexpandtab
autocmd FileType eruby  set tabstop=2 shiftwidth=2
autocmd FileType ruby,rdoc set tabstop=2 shiftwidth=2
autocmd FileType html set tabstop=2 shiftwidth=2
autocmd FileType javascript set tabstop=2 shiftwidth=2
autocmd FileType coffee set tabstop=2 shiftwidth=2
au! BufRead,BufNewFile *.json setfiletype json


" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    "   Preparation :  save  last  search ,   and  cursor position .
    echo expand("%:p")
    if expand("%") =~ '_spec'
        return
    endif

    if expand("%:p") =~ 'buychina'
        let _s =@/
        let l = line(".")
        let c = col(".")
        " Do the business:
        %s/ \ s \+ $ //e
        " Clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endif
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

fun! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'markdown'
        return
    endif
    %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()

" 快捷键
nmap <Up> <c-w>k
nmap <Down> <c-w>j
nmap <Right> <c-w>l
nmap <Left> <c-w>h

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

nmap <F2> <c-w>w
nmap <F3> :w!<cr>
nmap <F4> :q!<cr>
nmap <F8> gg=G<C-o>
nmap nv :vsplit<cr>

" 设置vim默认剪切版为系统剪切板
set clipboard=unnamed
