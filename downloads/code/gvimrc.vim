"==========================================================================="         
"         Filename: vimrc
"           Author: HM
"            Email: wangbandi#gmail.com
"         Homepage: http://huangming.org
"          Created: 2012-4-25
"===========================================================================

"                      ━━━━━━━━━━━━━━━━━   
"                            常  规             
"                                  设 置        
"                      ━━━━━━━━━━━━━━━━━         

"---------------------------------------------------------------------------"
"一般设定
"-------------------------------------------------------------------
set encoding=utf-8
set fenc=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=cp936
language messages zh_CN.UTF-8       "解决输出乱码 
set history=100             " history文件中需要记录的行数
syntax on                   " 语法高亮
set nocompatible	    " 取消兼容模式
set cursorline              " 突出显示当前行
set nu!                     " 显示行号
set scrolloff=5             " 在光标接近底端或顶端时，自动下滚或上滚
set cmdheight=2             " 命令行（在状态行下）的高度，默认为1，这里是2
set report=0            " 通过使用: commands命令，告诉我们文件的哪一行被改过
set helplang=cn             " 中文帮助
set t_Co=256
let g:solarized_termcolors=256
set background=dark
set bsdir=buffer                " 设定文件浏览器目录为当前目录
set nocompatible            " 不要使用vi的键盘模式，而是vim自己的 
set iskeyword+=_,$,@,%,#,-      " 带有如下符号的单词不要被换行分割 
set autochdir               "设定工作目录为当前目录 
set wildmenu            " 增强模式中的命令行自动完成操作 
"---------------------------------------------------------------------------"
"状态栏相关的设置[包括文件路径、文件类型、坐标、所占比例、时间等]
"--------------------------------------------------------------------------
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %y%r%m%*%=\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
highlight StatusLine guifg=SlateBlue guibg=Yellow  " 状态行颜色
highlight StatusLineNC guifg=Gray guibg=White      " 状态行颜色
set laststatus=2     " 总是显示状态行
set ruler            " 在编辑过程中，在右下角显示光标位置的状态行
if version >= 700    " 进入插入模式时改变状态栏颜色（仅限于Vim 7）
   au InsertEnter * hi StatusLine guibg=#818D29 guifg=#FCFCFC gui=none
   au InsertLeave * hi StatusLine guibg=Yellow guifg=SlateBlue gui=none
endif

"---------------------------------------------------------------------------
" 菜单栏与工具栏
"---------------------------------------------------------------------------
if has("gui_running")
    "au GUIEnter * simalt ~x  " 窗口启动时自动最大化
    set guioptions+=m        " 不隐藏菜单栏
    set guioptions+=T        "  不隐藏工具栏
    "set guioptions-=L        " 隐藏左侧滚动条
    "set guioptions-=r        " 隐藏右侧滚动条
    "set guioptions-=b        " 隐藏底部滚动条
    "set showtabline=0        " 隐藏Tab栏
endif

"---------------------------------------------------------------------------
"设置窗口的起始位置和大小
"---------------------------------------------------------------------------
winpos 350 120
winpos 250 200
set lines=28
set columns=90

"---------------------------------------------------------------------------"
"配色方案(按照当前时间的秒数的个位数决定使用哪个方案)
"--------------------------------------------------------------------------
if (strftime("%S")-floor(strftime("%S")/10)*10) <= 5
colorscheme navajo
elseif   (strftime("%S")-floor(strftime("%S")/10)*10) > 5
colorscheme darker-robin
endif

"---------------------------------------------------------------------------
"字体设置
"---------------------------------------------------------------------------
"set guifont=Dejavu_Sans_Mono:h11:cANSI
"set gfn=YaHei\ Consolas\ Hybrid:h10 
"set gfn=YaHei\ Consolas\ Hybrid:h11
"set guifontwide=YaHei\ Consolas\ Hybrid:h11
"set guifont=Courier_New:h11
"set guifontwide=YaHei\ Consolas\ Hybrid:h11

"---------------------------------------------------------------------------
" 文件设置
"---------------------------------------------------------------------------
filetype on                     " 侦测文件类型
filetype plugin on              " 载入文件类型插件
filetype indent on              " 为特定文件类型载入相关缩进文件
set confirm                     " 在处理未保存或只读文件的时候，弹出确认
set autoread                    " 当文件在外部被修改，自动更新该文件
"set shortmess=atI              " 启动的时候不显示那个援助索马里儿童的提示

"---------------------------------------------------------------------------
" 文本格式和排版
"---------------------------------------------------------------------------
set nolinebreak                 " 不在单词中间断行
set textwidth=150               " 设置最大列数，超出后自动换行
set matchtime=5                 " 匹配括号高亮的时间（单位是十分之一秒）
set showmatch                   " 高亮显示匹配的括号
:inoremap ( ()<ESC>i
:inoremap { {}<ESC>i
:inoremap [ []<ESC>i
:inoremap < <><ESC>i
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap ` ``<ESC>i

"---------------------------------------------------------------------------
" 查找/替换相关的设置
"---------------------------------------------------------------------------
set hlsearch       "高亮显示搜索结果 
set incsearch      "如要查找book，当输入到/b时，会自动找到第一个b开头的单词
set gdefault       " 替换时所有的行内匹配都被替换，而不是只有第一个
set ignorecase     " 在搜索的时候忽略大小写

"---------------------------------------------------------------------------
" 代码折叠
"---------------------------------------------------------------------------
set foldmarker={,}
"set foldmethod=marker
set foldenable           " 开始折叠
set foldmethod=syntax    " 设置语法折叠
set foldlevel=100        " 禁止启动VIM时自动折叠
set foldcolumn=0         " 设置折叠区域的宽度
set foldclose=all        " 设置为自动关闭折叠                            
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开关折叠
"set foldopen-=search    " Don't autofold anything (but I can still fold manually)
"set foldopen-=undo      " don't open folds when you search into them
"set foldcolumn=4        " don't open folds when you undo stuff
"zR打开全部；zr打开当前；zM折叠全部；zm折叠当前

"--------------------------------------------------------------------------
" 自定义快捷键
"---------------------------------------------------------------------------
nmap <C-a> ggvG$                    "全选
imap <C-s> <Esc>:wa<cr>             "保存
nmap <C-s> :wa<cr>

"---------------------------------------------------------------------------
" 窗口操作的快捷键
"---------------------------------------------------------------------------
nmap wv      <C-w>v      " 垂直分割当前窗口
nmap wc      <C-w>c      " 关闭当前窗口
nmap ws      <C-w>s      " 水平分割当前窗口
nnoremap <C-h> <C-w>h    " 窗口切换
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"---------------------------------------------------------------------------
" F5编译和运行C程序，F6编译和运行C++程序 
" 请注意，下述代码在windows下使用会报错 
" 需要去掉./这两个字符 
"---------------------------------------------------------------------------
" C的编译和运行 
map <F6> :call CompileRunGcc()<CR> 
func! CompileRunGcc() 
exec "w" 
exec "!gcc % -o %<" 
exec "! ./%<" 
endfunc 

" C++的编译和运行 
map <F5> :call CompileRunGpp()<CR> 
func! CompileRunGpp() 
exec "w" 
exec "!g++ % -o %<" 
exec "! ./%<" 
endfunc 

"---------------------------------------------------------------------------
" authorinfo.vim
"---------------------------------------------------------------------------
let g:vimrc_author='HM' 
let g:vimrc_email='wangbandi@gmail.com' 
let g:vimrc_homepage='http://huangming.org' 

"---------------------------------------------------------------------------
" Taglist.vim
"---------------------------------------------------------------------------
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"---------------------------------------------------------------------------
" WinManager.vim
"---------------------------------------------------------------------------
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

"---------------------------------------------------------------------------
" MiniBufExplorer
"---------------------------------------------------------------------------
let g:miniBufExplMapCTabSwitchBufs = 1  "<C-Tab>向前切换,并在 当前窗口打开
let g:miniBufExplMapWindowNavVim = 1 "可用<C-h,j,k,l>切换到上下左右的窗口

"---------------------------------------------------------------------------
"Cscope
"---------------------------------------------------------------------------
:set cscopequickfix=s-,c-,d-,i-,t-,e-

"---------------------------------------------------------------------------
" SuperTab
"---------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType="context"  

"---------------------------------------------------------------------------
" Calendar
"---------------------------------------------------------------------------
map <silent> <leader>cal :Calendar<cr>

"---------------------------------------------------------------------------
" Txtbrows
"---------------------------------------------------------------------------
"au BufEnter *.txt setlocal ft=txt

"---------------------------------------------------------------------------
" VimWiki
"---------------------------------------------------------------------------

" 使用鼠标映射
let g:vimwiki_use_mouse = 1

" 不要将驼峰式词组作为 Wiki 词条
let g:vimwiki_camel_case = 0

" 标题带上自动编号
let g:vimwiki_html_header_numbering = 2

let g:vimwiki_html_header_numbering = '.'

let g:vimwiki_valid_html_tags ='b,i,s,u,sub,sup,kbd,br,hr,div'

    let wiki_1 = {}
    let wiki_1.path = '~/dev/vimwiki/'
    let wiki_1.path_html = '~/dev/huangming.github.com/source/vimwiki/'
    let wiki_1.template_path = '~/dev/vimwiki/template/'
    let wiki_1.template_default = 'template1'
    let wiki_1.template_ext = '.html'
    
    let g:vimwiki_list = [wiki_1]


