编译环境及源码版本

    cmake－3.12.0

    llvm-4.0.1

    vim-81

一. llvm-clang 编译安装
1. 从clang官网上下载包含llvm、clang和libcxx等7个文件：

    wget -c http://releases.llvm.org/4.0.1/llvm-4.0.1.src.tar.xz

    wget -c http://releases.llvm.org/4.0.1/cfe-4.0.1.src.tar.xz

    wget -c http://releases.llvm.org/4.0.1/clang-tools-extra-4.0.1.src.tar.xz

    wget -c http://releases.llvm.org/4.0.1/compiler-rt-4.0.1.src.tar.xz

    wget -c http://releases.llvm.org/4.0.1/libcxx-4.0.1.src.tar.xz

    wget -c http://releases.llvm.org/4.0.1/libcxxabi-4.0.1.src.tar.xz

    wget -c http://releases.llvm.org/4.0.1/libunwind-4.0.1.src.tar.xz

2. 解压所有文件,并按以下操作移动目录到指定位置

    2.1 mv llvm-4.0.1.src llvm

    2.2 mv cfe-4.0.1.src llvm/tools/clang

    2.3 mv clang-tools-extra-4.0.1.src llvm/tools/clang/tools/extra

    2.4 mv compiler-rt-4.0.1.src llvm/projects/compiler-rt

    2.5 mv libcxx-4.0.1.src llvm/projects/libcxx

    2.6 mv libcxxabi-4.0.1.src llvm/projects/libcxxabi

    2.7 mv libunwind-4.0.1.src llvm/projects/libunwind

3. 创建cmake的编译目录：build
4. 进入build目录，开始编译生成Makefile文件

    cmake -G "Unix Makefiles" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCLANG_DEFAULT_CXX_STDLIB=libc++ -DCMAKE_BUILD_TYPE="Release" ../llvm

5. 开始编译

    make -j4

6. 编译完成，安装llvm

    make install

7. 安装 libcxx 和 libcxxabi

    使用命令 make install-cxx install-cxxabi 安装 clang/clang++ 所需要的 libc++ 库

二. 编译vim81
1. 下载并解压vim81源码

    wget -c ftp://ftp.vim.org/pub/vim/unix/vim-8.1.tar.bz2 tar jxf vim-8.1.tar.bz2

2. 编译安装

    cd vim-8.1

    ./configure --with-features=huge --enable-pythoninterp=yes --enable-cscope --enable-perlinterp=yes --enable-multibyte --with-x --enable-fail-if-missing --with-python-config-dir=/usr/lib64/python2.7/config/ --prefix=/opt/vim81

    make -j4

    make install

三. 编译ycm_core
1. 下载最新的 YouCompleteMe

    git clone --recursive https://github.com/Valloric/YouCompleteMe.git

2. 检查完整性

    git submodule update --init --recursive

3. 安装python开发环境

    yum install python-devel

4. 拷贝YouCompleteMe到～/.vim/bundle 目录
5. 在 YouCompleteMe 目录下新建 ycm_build，并进入目录执行下面命令生成 Makefile 文件

    cmake -G "Unix Makefiles" -DUSE_CLANG_COMPLETER=ON -DPATH_TO_LLVM_ROOT=/opt/llvm-4.0.1/ -DEXTERNAL_LIBCLANG_PATH=/opt/llvm-4.0.1/lib/libclang.so ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/

6. 编译以生成 ycm_core 文件

    make ycm_core

至此，YouCompleteMe 安装成功

四. 详细配置

1. 配置 ycm_extra_conf.py

    cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/

2. 配置 .vimrc

  2.1 加载YCM插件

    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'

    Plugin 'Valloric/YouCompleteMe'

    call vundle#end()

  2.2 YCM配置

    －－－－－－－－－－－－－－－－－ YCM CONFIG BEGIN －－－－－－－－－－－－－－－－－

    set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)

    autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口

    inoremappumvisible() ? "\" : "\" "回车即选中当前项

    let g:ycm_show_diagnostics_ui = 0 "关闭语法提示

    let g:ycm_global_ycm_extra_conf = '/opt/vim81/share/vim/ycm_extra_conf.py'

    let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

    let g:ycm_autoclose_preview_window_after_completion=1

    let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎

    let g:ycm_min_num_of_chars_for_completion=1 " 从第2个键入字符就开始罗列匹配项

    let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项

    let g:ycm_seed_identifiers_with_syntax=0 " 语法关键字补全

    " force recomile with syntastic

    nnoremap <F5> :YcmForceCompileAndDiagnostics

    let g:ycm_complete_in_comments = 0 "在注释输入中也能补全

    let g:ycm_complete_in_strings = 0"在字符串输入中也能补全

    let g:ycm_collect_identifiers_from_comments_and_strings = 0 "注释和字符串中的文字也会被收入补全

    let g:clang_user_options='|| exit 0'

    let g:ycm_keep_logfiles = 1

    let g:ycm_log_level = 'debug'

    "同时，YCM可以打开location-list来显示警告和错误的信息:YcmDiags

    let g:ycm_error_symbol = '✗'

    let g:ycm_warning_symbol = '⚠'

    nmap <F6> :YcmDiags

    set tags+=/usr/include/c++/4.8.5/stdcpp.tags

    let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]

    let mapleader=";"

    let maplocalleader=";"

    nnoremap:YcmCompleter GoToDefinitionElseDeclaration " 按 F3键 跳转到定义处

    －－－－－－－－－－－－－－－－－ YCM CONFIG END  －－－－－－－－－－－－－－－－－

3. 自动补全C++

      cd /usr/include/c++/4.8.5

      ctags -R --c++-kinds=+l+x+p --fields=+iaSl --extra=+q --language-force=c++ -f stdcpp.tags

  在 vim 中引入该标签文件。在 .vimrc 中增加如下内容：

        set tags+=/usr/include/c++/4.8/stdcpp.tags

        let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"] 

让 OmniCppComplete 成功识别标签文件中的标准库接口。C++ 标准库源码文件中使用了 _GLIBCXX_STD 名字空间，

（GNU C++ 标准库的实现是这样，如果你使用其他版本的标准库，需要自行查找对应的名字空间名称），

标签文件里面的各个标签都嵌套在该名字空间下，要让 OmniCppComplete 正确识别这些标签，

必须显式告知 OmniCppComplete 相应的名字空间名称。

4. 配置 ycm_extra_conf.py

    将 系统和项目的头文件地址加到 flags 中
  4.1 添加是系统 include 路径

    用命令查看库路径

    echo | clang -v -E -x c++ -

    #include "..." search starts here:

    #include <...> search starts here:

    /opt/llvm-4.0.1/bin/../include/c++/v1

    /usr/local/include

    /opt/llvm-4.0.1/bin/../lib/clang/4.0.1/include

    /usr/include

    End of search list.

    将上面的 include 目录加入到 flags中

    '-isystem',

    '/opt/llvm-4.0.1/bin/../include/c++/v1',

    '-isystem',

    '/usr/local/include',

    '-isystem',

    '/opt/llvm-4.0.1/bin/../lib/clang/4.0.1/include',

    '-isystem',

    '/usr/include',

  4.2 添加项目头文件路径到 flags 中

    '-I',

    '/home/user/projects/include', # 此处填写项目头文件路径

5. 验证YCM

    用 vim81 打开一个cpp源码文件，输入命令  :YcmDiags,查看 ycmd 正常运行

    将光标移动到一个函数名上，按F3或输入命令 :YcmCompleter GoToDefinitionElseDeclaration，跳到 声明或定义处


