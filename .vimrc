
" 作者：harvey.li
" 日期：2019.08.03
" 快捷键说明：
" F1：          查看最近修改
" F2：          打开/关闭文件目录
" F3：          打开/关闭函数列表
" F5：          建立tag
"
" ,f：          模糊搜索文件
" ,b：          模糊搜索字串
" ,g：          搜索字串
"
" ,ca：         切换格式
" ,c<space>：   添加/删除注释
" ,cs：         添加美化注释
"
" ,<space>：    删除行尾空格

set nocompatible " 关闭与vi的兼容模式
filetype off	 " 闭文件类型检查

" 自行编译新版本vim "
" 环境问题请自行参考此博客：https://blog.csdn.net/Asdfffy/article/details/81417432
" git clone https://github.com/vim/vim.git
" ./configure --with-features=huge \
"    --enable-multibyte \
"    --enable-python3interp \
"    --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu \
"    --enable-cscope \
"    --prefix=/home/harvey/vimInstall
" make && make install

" vim中文帮助手册安装 "
" wget https://jaist.dl.sourceforge.net/project/vimcdoc/vimcdoc/vimcdoc-2.1.0.tar.gz ~/
" tar -zxvf vimcdoc-2.1.0.tar.gz
" cd vimcdoc-2.1.0
" ./vimcdoc.sh -i

" 安装 vundle "
" mkdir ~/.vim
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" 使用vundle作为vim的插件管理 "
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" 在此处添加新的插件 "
Bundle 'VundleVim/Vundle.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'chxuan/change-colorscheme'
"Bundle 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer',  'for': ['c', 'cpp'] }
Bundle 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer',  'for': ['c', 'cpp']  }
" 若安装失败请用以下步骤尝试 "
" rm ~/.vim/bundle/YouCompleteMe -rf
" git clone https://gitee.com/mirrors/youcompleteme.git
" mv youcompleteme YouCompleteMe
" cd YouCompleteMe/
" python3 install.py --clang-completer
" 若提示错误：git submodule update --init --recursive
" 若遇到third_party/ycmd/third_party/go/src/golang.org/x/tools因谷歌无法访问报错
" cd third_party/ycmd/third_party/go/src/golang.org/x/
" rm tools/
" git clone https://github.com/golang/tools.git
" cd YouCompleteMe/
" git submodule update --init --recursive继续sync
" sync完毕后，继续尝试编译 python3 install.py --clang-completer
" 若遇到YouCompleteMe/third_party/ycmd/third_party/cregex" does not appear to contain CMakeLists.txt."此错误
" rm -rf YouCompleteMe/third_party/ycmd/third_party/cregex
" git submodule update --init --recursive
" 继续重编python3 install.py --clang-completer
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'jiangmiao/auto-pairs'
Bundle 'mbbill/undotree'
Bundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Bundle 'junegunn/fzf.vim'
Bundle 'vim-scripts/ag.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-syntastic/syntastic'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'chrisbra/changesPlugin'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'vim-scripts/DoxygenToolkit.vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'godlygeek/tabular'
Bundle 'easymotion/vim-easymotion'
Bundle 'Shougo/echodoc.vim'
Bundle 'altercation/vim-colors-solarized'
call vundle#end()

" vim的基础配置 "
func VimBaseSetting()
	set nu						" 显示行号 "
	filetype plugin indent on	" 打开文件类型检查以及相关插件 "
	set backspace=indent,eol,start
                                " 使能backspace "
	syntax on					" 语法高亮 "
	set tabstop=4				" 制表符转4个空格 "
	set softtabstop=4
	set shiftwidth=4			" 递进宽度为4个空格 "
	set expandtab
	set autoindent				" 自动缩进 "
	set smartindent				" 智能缩进 "
    set smarttab                " 行首自动插入空格 "
	set cindent					" C语言自动对齐 "
	set showmatch				" 显示匹配(主要用于各种括号的高亮) "
	set hlsearch				" 搜索高亮 "
    set ignorecase              " 搜索忽略大小写 "
    set smartcase
    set incsearch               " 显示搜索匹配项 "
    set magic                   " 正则表达式依赖此项 "
	set mouse=n					" vim鼠标可用，方便在xshell中复制粘贴 "
								" 设置支持的编码格式 "
	set fileencodings=utf-8,gb18030,gb2312,gbk,big5
    set history=1000            " 保留1000条历史记录 "
    set autoread                " 当文件在其他地方被更改时，自动重新加载 "
    set wildmenu                " 命令行补全 "
    set ruler                   " 显示光标位置 "
    set cmdheight=2             " 命令行高度 "
    set noerrorbells            " 关闭提示音，超级重要 "
    set novisualbell

    " 配色 "
    colorscheme zellner
    set background=dark
    set wrap                    " 长行回绕 "
    set linespace=2             " 行距 "
    set foldmethod=marker       "开启代码折叠，并保存折叠信息"

    " 分屏窗口大小调整 "
    nnoremap <c-up> <c-w>-
    nnoremap <c-down> <c-w>+
    nnoremap <c-left> <c-w><
    nnoremap <c-right> <c-w>>

    nnoremap <c-h> <c-w>h
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-l> <c-w>l

    nnoremap <F5> :!ctags -R --languages=c,c++<cr>

    " MAPPING BUFFER "
    nnoremap <leader>ba :babd
    nnoremap <leader>bq :bd
    nnoremap <S-b> :b
    " MAPPING TAB "
    nnoremap <leader>ta :tabe
    nnoremap <leader>tq :tabc<CR>
    nnoremap <S-t> gT
    " MAPPING WINDOW "
    nnoremap <leader>wh :sp<CR>
    nnoremap <leader>wv :vsp<CR>
    nnoremap <S-w> <C-w>w<CR>"

    set cursorcolumn
    set cursorline
    highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
    highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
endfunc

" tarbar 相关配置 "
func TarbarSetting()
    " F3 打开/关闭函数列表 "
    nmap <F3> :TagbarToggle<CR>
endfunc

" nerdtree 相关配置 "
func NerdtreeSetting()
    " 打开vim时，同时显示文件目录 "
    autocmd vimenter * NERDTree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
    " F2 打开/关闭文件目录 "
    map <F2> :NERDTreeToggle<CR>
    " 只剩文件目录时，直接关闭vim "
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endfunc

func NerdtreeGitPluginSetting()
    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }
endfunc

func AirlineSetting()
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#formatter = 'default'
endfunc

func AutoPairsSetting()
    let g:AutoPairsFlyMode = 1
endfunc

func YcmSetting()
    let g:ycm_server_python_interpreter='/usr/bin/python3'
    let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_show_diagnostics_ui = 0
    let g:ycm_server_log_level = 'info'
    let g:ycm_min_num_identifier_candidate_chars = 2
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_complete_in_strings=1
    let g:ycm_key_invoke_completion = '<c-x>'
    set completeopt=menu,menuone

    noremap <c-x> <NOP>

    let g:ycm_semantic_triggers =  {
                \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
                \ 'cs,lua,javascript': ['re!\w{2}'],
                \ }

    let g:ycm_filetype_whitelist = {
                \ "c":1,
                \ "cpp":1,
                \ "objc":1,
                \ "sh":1,
                \ "zsh":1,
                \ "zimbu":1,
                \ }
endfunc

func UndotreeSetting()
    nnoremap <F1> :UndotreeToggle<cr>
endfunc

func FzfSetting()
    nnoremap <silent> <Leader>f :Files<CR>
    nnoremap <silent> <Leader>b :Buffers<CR>
endfunc

func AgSetting()
    nmap <leader>g :norm yiw<CR>:Ag! -t -Q "<C-R>""
endfunc

func NerdcommenterSetting()
    let g:NERDSpaceDelims = 1
    let g:NERDCompactSexyComs = 1
    let g:NERDDefaultAlign = 'left'
    let g:NERDAltDelims_c = 1
    let g:NERDCommentEmptyLines = 1
    let g:NERDTrimTrailingWhitespace = 1
    let g:NERDToggleCheckAllLines = 1
endfunc

func SyntasticSetting()
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
endfunc

func VimNerdtreeTabSetting()
    let g:nerdtree_tabs_open_on_console_startup = 1
    let g:nerdtree_tabs_no_startup_for_diff = 1
    let g:nerdtree_tabs_smart_startup_focus = 1
    let g:nerdtree_tabs_open_on_new_tab = 1
    let g:nerdtree_tabs_meaningful_tab_names = 1
    let g:nerdtree_tabs_autoclose = 1
    let g:nerdtree_tabs_synchronize_view = 1
    let g:nerdtree_tabs_synchronize_focus = 1
    let g:nerdtree_tabs_startup_cd = 1
endfunc

func ChangesPluginSetting()
    let g:changes_autocmd=1
    let g:changes_use_icons = 1
    let g:changes_sign_text_utf8 = 1
endfunc

func VimIndentGuidesSetting()
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_auto_colors = 0
    let g:indent_guides_guide_size = 1
    let g:indent_guides_start_level = 1
    let g:indent_guides_space_guides = 1
    let g:indent_guides_tab_guides = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=238
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=darkgray
endfunc

func VimTrailingWhitespaceSetting()
    nnoremap <leader><space> :FixWhitespace<cr>
endfunc

func RainbowParentheses()
    let g:rbpt_colorpairs = [
          \ ['gray',        'RoyalBlue3'],
          \ ['brown',       'RoyalBlue3'],
          \ ['Darkblue',    'SeaGreen3'],
          \ ['darkgray',    'DarkOrchid3'],
          \ ['darkgreen',   'firebrick3'],
          \ ['darkcyan',    'RoyalBlue3'],
          \ ['darkred',     'SeaGreen3'],
          \ ['darkmagenta', 'DarkOrchid3'],
          \ ['brown',       'firebrick3'],
          \ ['darkmagenta', 'DarkOrchid3'],
          \ ['Darkblue',    'firebrick3'],
          \ ['darkgreen',   'RoyalBlue3'],
          \ ['darkcyan',    'SeaGreen3'],
          \ ['darkred',     'DarkOrchid3'],
          \ ]

    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
endfunc

func DoxygenToolkitSetting()
    let g:DoxygenToolkit_blockHeader  = "-------------------------------------------------------"
    let g:DoxygenToolkit_briefTag_pre = "@Function: "
    let g:DoxygenToolkit_paramTag_pre = "@Param: "
    let g:DoxygenToolkit_returnTag    = "@Returns: "
    let g:DoxygenToolkit_versionTag    = "@Version: "
    let g:DoxygenToolkit_versionString = "1.0"
    let g:DoxygenToolkit_authorTag    = "@Author: "
    let g:DoxygenToolkit_authorName   = "你的的名字"
    let g:DoxygenToolkit_dateTag      = "@Date: "
    let g:DoxygenToolkit_blockFooter  = "-------------------------------------------------------"
    let g:DoxygenToolkit_commentType = "C++"
    let g:DoxygenToolkit_compactDoc = "yes"   " 单行模式

    nnoremap fcb :Dox<cr>
    nnoremap fca :DoxAll<cr>
    nnoremap fcv :DoxAuthor<cr>"
endfunc

func VimEasyAligSetting()
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
endfunc

func VimMultipleCursors()
    let g:multi_cursor_use_default_mapping=0

    " Default mapping
    let g:multi_cursor_start_word_key      = '<C-n>'
    let g:multi_cursor_select_all_word_key = '<A-n>'
    let g:multi_cursor_start_key           = 'g<C-n>'
    let g:multi_cursor_select_all_key      = 'g<A-n>'
    let g:multi_cursor_next_key            = '<C-n>'
    let g:multi_cursor_prev_key            = '<C-p>'
    let g:multi_cursor_skip_key            = '<C-x>'
    let g:multi_cursor_quit_key            = '<Esc>'
endfunc

func VimEasymotionSetting()
    let g:EasyMotion_smartcase = 1
    "let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
    map <Leader><leader>h <Plug>(easymotion-linebackward)
    map <Leader><Leader>j <Plug>(easymotion-j)
    map <Leader><Leader>k <Plug>(easymotion-k)
    map <Leader><leader>l <Plug>(easymotion-lineforward)
    " 重复上一次操作, 类似repeat插件, 很强大  "
    map <Leader><leader>. <Plug>(easymotion-repeat)
endfunc

func EchodocSetting()
    set cmdheight=2
    let g:echodoc_enable_at_startup = 1
endfunc

func VimColorsSolarizedSetting()
    syntax enable
    set background=dark
    colorscheme solarized
endfunc

let mapleader=','			" 设置Leader键为, "

" 调用相关配置函数 "
call VimBaseSetting()
call TarbarSetting()
call NerdtreeSetting()
call NerdtreeGitPluginSetting()
call AirlineSetting()
call AutoPairsSetting()
call UndotreeSetting()
call FzfSetting()
call AgSetting()
call NerdcommenterSetting()
call SyntasticSetting()
call VimNerdtreeTabSetting()
call YcmSetting()
call ChangesPluginSetting()
call VimIndentGuidesSetting()
call VimTrailingWhitespaceSetting()
call RainbowParentheses()
call DoxygenToolkitSetting()
call VimMultipleCursors()
call VimEasymotionSetting()
call EchodocSetting()
call VimColorsSolarizedSetting()
