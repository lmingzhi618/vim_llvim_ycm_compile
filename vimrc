if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

"let $VIM = "/opt/vim81/share/vim/"
"let $VIMRUNTIME = "/opt/vim81/share/vim/vim80"

let mapleader=";"
let maplocalleader=";"

syntax enable
syntax on
filetype plugin indent on

" 设置快捷键将选中文本块复制至系统剪贴板
"vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
"nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>

" 让配置变更立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC
"手动读取配置文件
"nnoremap <leader>sv :source $MYVIMRC<cr>

set nocompatible	" 关闭兼容模式
set wildmenu		" vim 自身命令行模式智能补全

set rtp+=~/.vim/bundle
set rtp+=~/opt/go-1.9.2/misc/vim
set rtp+=~/.vim/bundle/Vundle.vim
"set rtp+=/opt/vim-8/share/vim/bundle
" vundle 管理的插件列表必须位于 vundle#begin()和vundle#end()之间
call vundle#begin()
   Plugin 'gmarik/Vundle.vim' 
   Plugin 'Valloric/YouCompleteMe'
"  Plugin 'VundleVim/Vundle.vim'
   Plugin 'Lokaltog/vim-powerline'
   Plugin 'octol/vim-cpp-enhanced-highlight'
"  Plugin 'nathanaelkane/vim-indent-guides'                        " 打开后报错
   Plugin 'derekwyatt/vim-fswitch'
   Plugin 'kshenoy/vim-signature'
   Plugin 'majutsushi/tagbar'
   Plugin 'fatih/vim-go'
"  Plugin 'terryma/vim-multiple-cursors'
"  Plugin 'scrooloose/nerdcommenter'
"  Plugin 'vim-scripts/DrawIt'
"  Plugin 'SirVer/ultisnips'
"  Plugin 'ctrlpvim/ctrlp.vim'
"  Plugin 'YouCompleteMe'
   Plugin 'LargeFile'

"  Plugin 'derekwyatt/vim-protodef'
   Plugin 'scrooloose/nerdtree'
   Plugin 'fholgado/minibufexpl.vim'		" 文件名选项卡
"  Plugin 'gcmt/wildfire.vim'                   " 选中结对符内的文本
   Plugin 'sjl/gundo.vim'
"  Plugin 'Lokaltog/vim-easymotion'
"  Plugin 'suan/vim-instant-markdown'
   Plugin 'lilydjwg/fcitx.vim'
 
" ###### 多语言语法检查 
   Plugin 'scrooloose/syntastic'		" 语法检查
   set statusline+=%#warningmsg# 
"  set statusline+=%{SyntasticStatuslineFlag()} 
   set statusline+=%* " 检测到错误和警告时的标志 
   let g:syntastic_enable_signs = 1
   let g:syntastic_error_symbol='✗' 
   let g:syntastic_warning_symbol='►' 
   let g:syntastic_check_on_open=1 
   "修改Locaton List窗口高度
   let g:syntastic_loc_list_height = 2
   "进行实时检查，如果觉得卡顿，将下面的选项置为1
   let g:syntastic_check_on_wq=0 
   "总是打开Location List（相当于QuickFix）窗口，
   "如果你发现syntastic因为与其他插件冲突而经常崩溃，将下面选项置0
   "let g:syntastic_always_populate_loc_list = 1
   let g:syntastic_check_on_open = 1
   "高亮错误
   "let g:syntastic_enable_highlighting=1
   "让syntastic支持C++11, syntastic 默认不支持对C++11进行语法检查，clang相比gcc提供的错误信息更加友好
   "let g:syntastic_cpp_compiler = 'clang++'
   "let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
   " gcc 对 C++11 进行语法检查
   let g:syntastic_cpp_checkers = ['gcc']
   let g:syntastic_cpp_compiler = 'gcc'
   let g:syntastic_cpp_compiler_options = '-std=c++11'

   let g:syntastic_cpp_include_dirs = ['/home/lmz/formax_trunk/','/home/lmz/formax_trunk/formax_social', '/opt/opencv-2.4.13.6/include']
   let g:syntastic_cpp_check_header = 1
   let g:syntastic_cpp_remove_include_errors = 1

   nmap <F4> :Errors<CR>

    Bundle 'nsf/gocode'
" ##### 插件管理工具
    Bundle 'gmarik/vundle'
    Bundle 'Blackrush/vim-gocode'
    Bundle 'ervandew/supertab'
"   Bundle 'rizzatti/funcoo.vim'
"   Bundle 'rizzatti/dash.vim'
"   Bundle 'msanders/snipmate.vim'
    Bundle 'a.vim'
"   Bundle 'node'
"   Bundle 'DoxygenToolkit.vim'

    " 插件列表结束
call vundle#end()


map <SPACE> viw

set background=dark

"vim-cpp-enhanced-highlight 主要通过vim/bundle/vim-cpp-enhanced-highlight/after/syntax/cpp.vim
"控制高亮关键字及规则，所以，当你发现某个 STL 容器类型未高亮，那么将该类型追加进 cpp.vim 即可。
"如，initializer_list 默认并不会高亮，需要添加
let g:cpp_class_scope_highlight=1
let g:cpp_experimental_template_highlight=1
syntax keyword cppSTLtype initializer_list

set bs=indent,eol,start		    " allow backspacing over everything in insert mode
set ai			                " always set autoindenting on
set backup		                " keep a backup file
set viminfo='20,\"50	        " read/write a .viminfo file, don't store more than 50 lines of registers
set history=50		            " keep 50 lines of command line history

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
set relativenumber 
"set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 高亮显示当前行/列
set cursorline
hi cursorline   cterm=NONE ctermbg=Black ctermfg=NONE guibg=Black guifg=NONE  
"hi Search ctermbg=darkblue ctermfg=white
nmap <F9> :set cursorline <CR> <ESC>
" Change Color when entering Insert Mode
"autocmd InsertEnter * highlight  CursorLine ctermbg=Green ctermfg=Red
" Revert Color to default when leaving Insert Mode
"autocmd InsertLeave * highlight  CursorLine ctermbg=Black ctermfg=None
autocmd InsertLeave * se cul  " 用浅色高亮当前行
autocmd InsertEnter * se cul    " 用浅色高亮当前行  

set showcmd         " 输入的命令显示出来，看的清楚些

"禁止折行
set nowrap

" 设置状态栏主题风格, Powerline插件能在状态显示 文件名, 函数名,
" 文件编码格式,文件类型等信息
let g:Powerline_colorscheme='solarized256'       " 状态栏带底色
let g:Powerline_symbols='unicode'               " 带小箭头,'fancy':带大箭头
set t_Co=256
set term=screen-256color

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=2
" 设置格式化时制表符占用空格数
set shiftwidth=2
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=2

" 4.6 标识符列表
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_right=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <F8> :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1

"基于语义的声明/定义跳转
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处  
nnoremap <F3>       :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处  

" 自动补全 YCM 配置  
 set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)  
 autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口  
 inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项  
 let g:ycm_show_diagnostics_ui = 0                  "关闭语法提示
 let g:ycm_global_ycm_extra_conf = '/opt/vim81/share/vim/ycm_extra_conf.py'  
 let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示  
 let g:ycm_autoclose_preview_window_after_completion=1 
 let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎  
 let g:ycm_min_num_of_chars_for_completion=1 " 从第2个键入字符就开始罗列匹配项  
 let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项  
 let g:ycm_seed_identifiers_with_syntax=0    " 语法关键字补全  

 " force recomile with syntastic
 nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>  
 "在注释输入中也能补全  
 let g:ycm_complete_in_comments = 0  
 "在字符串输入中也能补全  
 let g:ycm_complete_in_strings = 0  
 "注释和字符串中的文字也会被收入补全  
 let g:ycm_collect_identifiers_from_comments_and_strings = 0  
 let g:clang_user_options='|| exit 0'  

 let g:ycm_keep_logfiles = 1
 let g:ycm_log_level = 'debug'

"同时，YCM可以打开location-list来显示警告和错误的信息:YcmDiags
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
nmap <F6> :YcmDiags<CR>

set tags+=/usr/include/c++/4.8.5/stdcpp.tags
" #####YouCompleteMe Configure

let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]

" 5.4 由接口快速生成实现框架
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1
" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1

" 启用:Man命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim
" 定义:Man命令查看各类man信息的快捷键
nmap <Leader>man :Man 3 <cword><CR>

" 6 工程文件浏览
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <F7> :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=28
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif


if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" 匹配模式,若输入一个左括号,会匹配相应的右括号
set showmatch
set autoindent
set smartindent

"highlight Functions，这可以高亮函数
syn match cFunction /\<\w\+\%(\s*(\)\@=/
hi default link cFunction Include

" 按//选中光标所在位置变量
noremap ,, viwy/\<<C-R>"\><CR><C-O>
noremap // viwy/<C-R>"<CR><C-O>
noremap ;; vey/<C-R>"<CR><C-O>
noremap .. /<C-V><C-M><CR><C-O>
"noremap // gd <C-O>

set matchtime=1                 " key  显示配对括号的十分之一秒数
"set numberwidth=6              " key  显示行号宽度

"为光标所在单词添加引号
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel<cr>
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel<cr>

"输入个人签名
iabbrev ssig --<cr>Mingzhi Lee<cr>mingzhi198@qq.com

autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>

"使用本地缓冲区的缩写和自动命令来创建一个简单的“snippet”系统。
autocmd FileType python     :iabbrev <buffer> iff if:<left>
autocmd FileType javascript :iabbrev <buffer> iff if ()<left>

" for golang 
nmap <silent> <Leader>rg :! go run %<cr>
nmap <silent> <Leader>bg :! go build %<cr>
nmap <silent> <Leader>bc :! gcc %<cr>
nmap <silent> <Leader>bp :! g++ %<cr>

au BufRead, BufNewFile *.go set filetype=go

set mouse=a

let g:godef_split=3 "打开新窗口的时候左右split
let g:godef_same_file_in_same_window=1 "函数在同一个文件中时不需要打开新窗口


" a.vim switch .h/.c* 
nmap <F2> :A<cr>
"nmap <F2> :FSHere<cr>

"set vbs=4

set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030

" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

command! BcloseOthers call <SID>BufCloseOthers()  
function! <SID>BufCloseOthers()  
   let l:currentBufNum   = bufnr("%")  
   let l:alternateBufNum = bufnr("#")  
   for i in range(1,bufnr("$"))  
     if buflisted(i)  
       if i!=l:currentBufNum  
         execute("bdelete ".i)  
       endif  
     endif  
   endfor  
endfunction  
nmap <leader>bdo :BcloseOthers<cr>

" Quickly open/reload vim
"nnoremap <leader>ev :split $VIM/vimrc<CR>  
 nnoremap <leader>sv :source $VIM/vimrc<CR>   

" DoxygenToolKit BEGIN "
    let g:DoxygenToolkit_briefTag_funcName = "yes"

let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


