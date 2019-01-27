"  ------------------------------Vundle Start------------------------
set nocompatible  " 去除兼容vi模式
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 插件管理器
Plugin 'VundleVim/Vundle.vim'
" YCM补全
Plugin  'Valloric/YouCompleteMe'
" 模糊搜索
Plugin 'Yggdroot/LeaderF'
" 状态栏
Plugin 'vim-airline/vim-airline'
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

call vundle#end()
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
set paste  " 设置粘贴模式，不附带其他变形
set encoding=utf-8 " 设置编码
set fileencoding=utf-8 " 设置文件编码
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030 " 设置尝试打开编码
set history=200    "设置命令行模式下的最大历史记录数
set wildmenu "命令行补全参数
set showmatch "设置匹配的括号
set incsearch   "很聪明的查找,输入一个字符马上自动匹配,而不是输入完再查找
set nobackup        "不备份(讨厌的~文件)
"autocmd BufWritePost $MYVIMRC source $MYVIMRC " 让vimrc配置更改立即生效


"  ------------------------------常规配置 End -----------------------

"  ------------------------------主题配置 start----------------------
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
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

" Define prefix dictionary
let g:lmap =  {}
let g:lmap.c = {'name' : '注释' } 


let g:leaderGuide_run_map_on_popup = 1
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
