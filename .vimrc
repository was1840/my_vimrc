"  ------------------------------Vundle Start------------------------
set nocompatible  " 去除兼容vi模式
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 插件管理器
Plugin 'VundleVim/Vundle.vim'

" 状态栏
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" 标签系统
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'

"缩进指南
Plugin 'nathanaelkane/vim-indent-guides'

" YCM补全
Plugin  'Valloric/YouCompleteMe'

" 模糊搜索
Plugin 'Yggdroot/LeaderF'

" 启动页
Plugin 'mhinz/vim-startify'

" 主题色
Plugin 'altercation/vim-colors-solarized'
 
" 撤销管理，支持分支
Plugin 'sjl/gundo.vim'

" 按键指引
Plugin 'hecal3/vim-leader-guide'

" 注释
Plugin 'scrooloose/nerdcommenter'

" git插件
Plugin 'airblade/vim-gitgutter'

" 文本svn状态
Plugin 'mhinz/vim-signify'

" 异步搜索
Plugin 'mhinz/vim-grepper'

call vundle#end()            " required
filetype plugin indent on " 自动检测文件类型


"  ------------------------------Vundel End  ------------------------

"  ------------------------------常规配置 start ---------------------
filetype indent on " 自适应不同语言的智能缩进
set expandtab    "将制表符扩展为空格
syntax enable " 开启语法高亮
syntax on     " 允许指定语法高亮替换默认方案
set backspace=2       " 解决插入模式下delete/backspce键失效问题
set number " 显示行号
set relativenumber "显示相对行号
set mouse=a " 使用鼠标
set smartindent " 智能缩进
set autoindent  " 复制缩进
set clipboard=unnamedplus "默认复制到剪切版
set hlsearch " 设置搜索高亮
set cursorline    " 高亮当前列
set cursorcolumn  " 高亮当前行
set expandtab    "将制表符扩展为空格
set tabstop=4    " 设置编辑时制表符占用空格数
set shiftwidth=4 " 设置格式化时制表符占用空格数
set softtabstop=4 " 让VIM 把连续数量的空格视为一个制表符
set list  " 显示空格和TAB
set listchars=tab:>-,trail:- " 设置tab和空格样式
"set paste  " 设置粘贴模式，不附带其他变形
set encoding=utf-8 " 设置编码
set fileencoding=utf-8 " 设置文件编码
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030 " 设置尝试打开编码
set history=200    "设置命令行模式下的最大历史记录数
set wildmenu "命令行补全参数
set showmatch "设置匹配的括号
set incsearch   "很聪明的查找,输入一个字符马上自动匹配,而不是输入完再查找
set nobackup        "不备份(讨厌的~文件)
set laststatus=2   " 总是显示状态栏
"autocmd BufWritePost $MYVIMRC source $MYVIMRC " 让vimrc配置更改立即生效

"记忆上次打开文件的位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"  ------------------------------常规配置 End -----------------------

"  ------------------------------主题配置 start----------------------
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
" ------------------------------主题配置 End -----------------------

"  ------------------------------快捷键设置 start--------------------
let mapleader = "\<Space>" "设置leader键
"nmap <space> <leader>
map <C-v> +gP " 从剪切板粘贴 需要--with-x的支持
map <C-V> +gP " 从剪切板粘贴 需要--with-x的支持
map <C-c> +y  " 复制到剪切板
map <C-C> +y  " 复制到剪切板
map <silent> <F11> :call ToggleFullscreen()<CR> "全屏开/关快捷键 
"  ------------------------------快捷键设置 End ---------------------

"  ------------------------------leaderGuide start-------------------
" Define prefix dictionary
let g:lmap =  {}
let g:lmap.c = {'name' : '注释' } 
let g:lmap.g = {'name' : '代码导航' } 


let g:leaderGuide_run_map_on_popup = 1
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
"  ------------------------------leaderGuide End--------------------

"  ------------------------------标签系统 start---------------------
set cscopetag   " 使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳来跳去
set cscopeprg='gtags-cscope'
set csto=0         "cscope数据优先，再ctag

nmap <leader>gs :GscopeFind s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gg :GscopeFind g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gc :GscopeFind c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gt :GscopeFind t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ge :GscopeFind e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>gi :GscopeFind i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>gd :GscopeFind d <C-R>=expand("<cword>")<CR><CR>

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
"if executable('ctags')
""	let g:gutentags_modules += ['ctags']
"endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" 自动切换数据库
let g:gutentags_plus_switch = 1

let g:gutentags_define_advanced_commands = 1

"  ------------------------------标签系统 End----------------------

"  ------------------------------YCM配置 start---------------------
" 跳到定义或声明  
nnoremap <F4> :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" YCM 补全菜单配色
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey    " 菜单
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black " 选中项
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
"set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap <leader>; <C-x><C-o>
"set completeopt-=preview  " 补全内容不以分割子窗口形式出现，只显示补全列表
let g:ycm_min_num_of_chars_for_completion=1  " 从第一个键入字符就开始罗列匹配项
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

"  ------------------------------YCM配置 end-----------------------

"  ------------------------------airline start---------------------

set rtp+=~/.local/share/fonts
"let g:airline_section_b = '%{strftime("%c")}'  "显示时间
"let g:airline_section_y = 'BN: %{bufnr("%")}'
"let g:airline_theme='solarized256'         " 设置airline 主题  
let g:airline_powerline_fonts = 1       "显示箭头

let g:airline#extensions#tabline#enabled = 1   "当只打开一个选项卡时自动显示所有缓冲区
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'   "文件名的格式
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9nmap 
nmap <Tab> <Plug>AirlineSelectNextTab


"  ------------------------------airline end-----------------------

"  ------------------------------LeaderF配置 start-----------------

let g:Lf_ShortcutF = '<c-p>'
noremap <F3> :LeaderfBufTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.cache/Leader')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

"  ------------------------------LeaderF配置 end-------------------

"  ------------------------------缩进配置 start--------------------
let g:indent_guides_enable_on_vim_startup=1 "  缩进
let g:indent_guides_start_level=2 " 从第二层开始可视化显示缩进
let g:indent_guides_guide_size=1  " 色块宽度
":nmap <silent> <Leader>i <Plug>IndentGuidesToggle " 快捷键 i 开/关缩进可视化

"  ------------------------------缩进配置 end----------------------

"  ------------------------------NERDTree start--------------------

let NERDTreeWinSize=32           " 设置NERDTree子窗口宽度
let NERDTreeWinPos="left"        " 设置NERDTree子窗口位置
let NERDTreeShowHidden=1           " 显示隐藏文件
let NERDTreeMinimalUI=1            " NERDTree 子窗口中不显示冗余帮助信息 
let NERDTreeAutoDeleteBuffer=1    " 删除文件时自动删除文件对应 buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " 仅剩NERDtree窗口，自动关闭
"  ------------------------------NERDTree End--------------------

"  ------------------------------grepper start-------------------
let g:grepper = {
    \ 'tools': ['grep', 'svn' , 'sh'],
    \ 'grep': {
    \   'grepprg':    'grep',
    \   'grepformat': '%f:%l:%m',
    \   'escape':     '\+*^$()[]',
    \ },
    \ 'svn': {
    \   'grepprg':    'svn',
    \   'grepformat': '%f:%l:%m',
    \   'escape':     '\+*^$()[]',
    \ },
    \ 'sh': {
    \   'grepprg':    'sh',
    \   'grepformat': '%f:%l:%m',
    \   'escape':     '\+*^$()[]',
    \ },
    \}
"  ------------------------------grepper End---------------------
