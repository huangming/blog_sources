"==========================================================================="
"         Filename: vimrc
"           Author: HM
"            Email: wangbandi#gmail.com
"         Homepage: http://huangming.github.com
"          Created: 2013 五月 14
"===========================================================================


"                      ━━━━━━━━━━━━━━━━━   
"                            插 件             
"                                  安 装        
"                      ━━━━━━━━━━━━━━━━━         
"---------------------------------------------------------------------------
" => Vundle
"---------------------------------------------------------------------------
set nocompatible       " 取消兼容模式
filetype off                     " 侦测文件类型
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

 " let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'bufexplorer.zip'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'vim-scripts/Marks-Browser'
Bundle 'vim-scripts/ShowMarks7'
Bundle 'Vimball'
if executable('ctags')
    Bundle 'majutsushi/tagbar'
endif
if executable('git')
    Bundle 'tpope/vim-fugitive'
endif


Bundle "L9"
Bundle "FuzzyFinder"

Bundle 'xolox/vim-session'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'splitjoin.vim'
Bundle 'Align'
Bundle 'drmingdrmer/xptemplate'

Bundle 'mbcoguno/vimim-core-mirror'
Bundle 'calendar.vim'
Bundle 'vimwiki'
Bundle 'bolasblack/vimcdoc'

Bundle "Markdown"
Bundle "jQuery"
Bundle "hachibeeDI/vim-vbnet"
Bundle "rbtnn/vbnet_indent.vim"
Bundle 'VOoM'
Bundle 'vim-scripts/txt.vim--xu'
Bundle 'ap/vim-css-color'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'michaeljsmith/vim-indent-object'
let g:indentobject_meaningful_indentation = ["haml", "sass", "python", "yaml", "markdown", "vbnet"]

Bundle 'Lokaltog/vim-powerline'
Bundle 'Color-Scheme-Explorer'
Bundle 'huangming/darker-robin'
Bundle 'sjl/badwolf'
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'tomasr/molokai'
Bundle 'zaiste/Atom'
Bundle 'w0ng/vim-hybrid'

" non github repos

filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

"                      ━━━━━━━━━━━━━━━━━   
"                            常  规             
"                                  设 置        
"                      ━━━━━━━━━━━━━━━━━         

"---------------------------------------------------------------------------
" => 一般设定
"---------------------------------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
set ambiwidth=double
set termencoding=utf-8
language messages zh_CN.UTF-8       "解决输出乱码 

"解决菜单乱码  
set langmenu=zh_CN  
let $LANG = 'zh_CN.UTF-8'  
source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim  

set history=100             " history文件中需要记录的行数
syntax on                   " 语法高亮
set cursorline              " 突出显示当前行
"set nu!                     " 显示行号
set relativenumber          " 行号从当前行向上下递增
set scrolloff=5             " 在光标接近底端或顶端时，自动下滚或上滚
set cmdheight=2             " 命令行（在状态行下）的高度，默认为1，这里是2
set report=0            " 通过使用: commands命令，告诉我们文件的哪一行被改过
set helplang=cn             " 中文帮助
set t_Co=256
let g:solarized_termcolors=256
"set background=dark
set bsdir=buffer                " 设定文件浏览器目录为当前目录
set nocompatible            " 不要使用vi的键盘模式，而是vim自己的 
set iskeyword+=_,$,@,%,#,-      " 带有如下符号的单词不要被换行分割 
set autochdir               "设定工作目录为当前目录 
set tags=tags;
"set clipboard+=unnamed " Yanks go on clipboard instead
set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«  " Unprintable chars mapping 
set showbreak=»\ \ \ 
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
set showcmd            " n模式下敲数字右下角会有显示之类的 
set shortmess=at " Avoids 'hit enter'
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif              " 打开文件时光标置于上次关闭时的位置
let mapleader=',' " Change the mapleader
let maplocalleader='\' " Change the maplocalleader

"--------------------------------------------------------------------------
" => 配色方案(按照当前时间的秒数的个位数决定使用哪个方案)
"--------------------------------------------------------------------------
"colorscheme solarized
if has('gui_running')
    exec 'colorscheme '.["solarized","solarized","Tomorrow","badwolf","molokai","molokai","darker-robin","solarized","hybrid","atom"][strftime("%S")%10]
else
    exec 'colorscheme '.["solarized","solarized","badwolf","badwolf","molokai","molokai","darker-robin","solarized","atom","atom"][strftime("%S")%6]
endif

"--------------------------------------------------------------------------
" => 状态栏相关的设置[包括文件路径、文件类型、坐标、所占比例、时间等]
"--------------------------------------------------------------------------
" Only have cursorline in current window and in normal window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline
auto InsertEnter * set nocursorline
auto InsertLeave * set cursorline
set statusline=%F%m%r%h%w\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %y%r%m%*%=\ [%l,%v]\ [%p%%]\ [共%L行]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
highlight StatusLine guifg=SlateBlue guibg=Yellow  " 状态行颜色
highlight StatusLineNC guifg=Gray guibg=White      " 状态行颜色
set laststatus=2     " 总是显示状态行
set ruler            " 在编辑过程中，在右下角显示光标位置的状态行
if version >= 700    " 进入插入模式时改变状态栏颜色（仅限于Vim 7）
   au InsertEnter * hi StatusLine guibg=#818D2d guifg=#FCFCFC gui=none
   au InsertLeave * hi StatusLine guibg=Yellow guifg=SlateBlue gui=none
endif

"---------------------------------------------------------------------------
" => 菜单栏与工具栏
"---------------------------------------------------------------------------
if has("gui_running")
    "au GUIEnter * simalt ~x  " 窗口启动时自动最大化
    set guioptions+=m        " 不隐藏菜单栏
    set guioptions-=T        "  不隐藏工具栏
    "set guioptions-=L        " 隐藏左侧滚动条
    "set guioptions-=r        " 隐藏右侧滚动条
    "set guioptions-=b        " 隐藏底部滚动条
    set showtabline=1        " 隐藏Tab栏
endif

"---------------------------------------------------------------------------
" => 设置窗口的起始位置和大小
"---------------------------------------------------------------------------
winpos 350 150
"winpos 250 200
set lines=28
set columns=100

"---------------------------------------------------------------------------
" => 字体设置
"---------------------------------------------------------------------------
if has('gui_running')
    if has("win32")
        set guifont=Consolas:h11:cANSI  
    endif
endif

"---------------------------------------------------------------------------
" => 标签定制
"---------------------------------------------------------------------------
" Set up tab labels
set guitablabel=%m%N:%t\[%{tabpagewinnr(v:lnum)}\]
set tabline=%!MyTabLine()
function! MyTabLine()
    let s=''
    let t=tabpagenr() " The index of current page
    let i=1
    while i<=tabpagenr('$') " From the first page
      let buflist=tabpagebuflist(i)
      let winnr=tabpagewinnr(i)
      let s.=(i==t?'%#TabLineSel#':'%#TabLine#')
      let s.='%'.i.'T'
      let s.=' '
      let bufnr=buflist[winnr - 1]
      let file=bufname(bufnr)
      let m=''
      if getbufvar(bufnr, "&modified")
          let m='[+]'
      endif
      if file=~'\/.'
          let file=substitute(file,'.*\/\ze.','','')
      endif
      if file==''
        let file='[No Name]'
      endif
      let s.=m
      let s.=i.':'
      let s.=file
      let s.='['.winnr.']'
      let s.=' '
      let i=i+1
    endwhile
    let s.='%T%#TabLineFill#%='
    let s.=(tabpagenr('$')>1?'%999XX':'X')
    return s
  endfunction
" Set up tab tooltips with every buffer name
set guitabtooltip=%F

" Alt+n快速切换标签"
if has("gui_running") 
     :map <silent> <C-S> :if expand("%") == ""<CR>:browse confirm w<CR>:else<CR>:confirm w<CR>:endif<CR> 
     noremap <M-1> 1gt 
     noremap <M-2> 2gt 
     noremap <M-3> 3gt 
     noremap <M-4> 4gt 
     noremap <M-5> 5gt 
     noremap <M-6> 6gt 
     noremap <M-7> 7gt 
     noremap <M-8> 8gt 
     noremap <M-9> 9gt 
     noremap <M-0> 10gt 
     noremap <C-TAB> gt 
     noremap <C-F4> <ESC>:bd<CR> 
     noremap tx <ESC>:bd<CR> 
endif 


"---------------------------------------------------------------------------
" => 文件设置
"---------------------------------------------------------------------------
set confirm                     " 在处理未保存或只读文件的时候，弹出确认
set autoread                    " 当文件在外部被修改，自动更新该文件
set backspace=indent,eol,start
"set shortmess=atI              " 启动的时候不显示那个援助索马里儿童的提示
" Set directories
"set noswapfile
" Automatically remove fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

set backup " Set backup
set undofile " Set undo
" Set directories
set backupdir=$VIMRUNTIME/tmp/backup " backups
set directory=$VIMRUNTIME/tmp/swap   " swap files
set viewdir=$VIMRUNTIME/tmp/view   " view files
set undodir=$VIMRUNTIME/tmp/undo   " undo files

autocmd BufWinLeave *.* silent! mkview " Make Vim save view (state)(folds,cursor,etc)
autocmd BufWinEnter *.* silent! loadview " Make Vim load view(state)(folds,cursor,etc)

"---------------------------------------------------------------------------
" => 文本格式和排版
"---------------------------------------------------------------------------
"set nowrap
set formatoptions=tcrqn         " 自动格式化
set textwidth=10000             " 设置最大列数，超出后自动换行
set matchtime=5                 " 匹配括号高亮的时间（单位是十分之一秒）
set showmatch                   " 高亮显示匹配的括号
set nolinebreak                 " 不在单词中间断行
set cindent                     " 使用C样式的缩进
set tabstop=4                   " 缩进相关
set shiftwidth=4
set expandtab
set modeline                    "自动载入缩进模式行
au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
"au BufRead,BufNewFile *.css set ft=css syntax=css3
"自动插入modeline
func! AppendModeline()
 let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d :",
 \ &tabstop, &shiftwidth, &textwidth)
 let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
 call append(line("$"), l:modeline)
endfunc
"按\ml,自动插入modeline
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

"---------------------------------------------------------------------------
" => 自动补全
"---------------------------------------------------------------------------
" 补全相关
inoremap <C-]>             <C-X><C-]>
inoremap <C-F>             <C-X><C-F>
imap <Leader><TAB>         <C-x><C-k>
"整行补全                        CTRL-X CTRL-L
"根据当前文件里关键字补全        CTRL-X CTRL-N
"根据字典补全                    CTRL-X CTRL-K
"根据同义词字典补全              CTRL-X CTRL-T
"根据头文件内关键字补全          CTRL-X CTRL-I
"根据标签补全                    CTRL-X CTRL-]
"补全文件名                      CTRL-X CTRL-F
"补全宏定义                      CTRL-X CTRL-D
"补全vim命令                     CTRL-X CTRL-V
"用户自定义补全方式              CTRL-X CTRL-U
"拼写建议                        CTRL-X CTRL-S 
"拼写检查
set wildmenu                                " 命令行命令补全
set completeopt=longest,menuone             " 补全窗口相关
set wildmode=list:longest,full              " Use powerful wildmenu
set ic                                      " 补全忽略大小写

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap {<CR> {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i

function! ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
     return "\<Right>"
 else
     return a:char
 endif
endfunction

"---------------------------------------------------------------------------
" => 查找/替换相关的设置
"---------------------------------------------------------------------------
set hlsearch       "高亮显示搜索结果 
set incsearch      "如要查找book，当输入到/b时，会自动找到第一个b开头的单词
set gdefault       " 替换时所有的行内匹配都被替换，而不是只有第一个
set ignorecase     " 在搜索的时候忽略大小写

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Highlight word 
highlight InterestingWord  ctermbg=yellow guibg=yellow ctermfg=black guifg=#000000
highlight InterestingWord1 ctermbg=green  guibg=green  ctermfg=black guifg=#000000
highlight InterestingWord2 ctermbg=blue   guibg=blue   ctermfg=black guifg=#000000
highlight InterestingWord3 ctermbg=red    guibg=red    ctermfg=white guifg=#FFFFFF
nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>

" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

" Use sane regexes
nnoremap / /\v
vnoremap / /\v
cnoremap s/ s/\v
nnoremap ? ?\v
vnoremap ? ?\v
cnoremap s? s?\v

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv

" Visual search mappings
function! s:VSetSearch()
    let temp=@@
    normal! gvy
    let @/='\V'.substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@=temp
endfunction
vnoremap * :<C-U>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-U>call <SID>VSetSearch()<CR>??<CR>

"-------------------------------------------------
" => Fold Related
"-------------------------------------------------

set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码


" Space to toggle and create folds.
nnoremap <silent><Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Set foldtext
function! MyFoldText()
    let line=getline(v:foldstart)
    let nucolwidth=&foldcolumn+&number*&numberwidth
    let windowwidth=winwidth(0)-nucolwidth-3
    let foldedlinecount=v:foldend-v:foldstart+1
    let onetab=strpart('          ', 0, &tabstop)
    let line=substitute(line, '\t', onetab, 'g')
    let line=strpart(line, 0, windowwidth-2-len(foldedlinecount))
    let fillcharcount=windowwidth-len(line)-len(foldedlinecount)
    return line.'…'.repeat(" ",fillcharcount).foldedlinecount.'…'.' '
endfunction
set foldtext=MyFoldText()

"--------------------------------------------------------------------------
" => 特殊文件类型
"---------------------------------------------------------------------------
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
au BufRead,BufNewFile {*.txt}                         set ft=txt
au! BufRead,BufNewFile {*.Q}   set ft=vbnet  fdm=syntax fenc=cp936 
au FileType vbnet call AddvbnetFunctionList()
function! AddvbnetFunctionList()
  set dictionary+=C:\Users\hm\.vim\dict\vbnet_funclist.txt
  set complete+=k
endfunction
autocmd BufNewFile  *.Q	0r ~/.vim/template/skeleton.q
autocmd BufWritePre,FileWritePre *.Q   ks|call Scriptstartline()|'s
fun! Scriptstartline()
  let l = line("$")
  exe "1," . l . "g/Scriptstart = /s/Scriptstart = .*/Scriptstart = " .line('.')
endfun

" Markdown
augroup ft_markdown
    autocmd!
    " Use <localLeader>1/2/3/4/5/6 to add headings
    autocmd Filetype markdown nnoremap <buffer> <localLeader>1 I# <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>2 I## <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>3 I### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>4 I#### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>5 I##### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>6 I###### <ESC>
    " Use <LocalLeader>b to add blockquotes in normal and visual mode
    autocmd Filetype markdown nnoremap <buffer> <localLeader>b I> <ESC>
    autocmd Filetype markdown vnoremap <buffer> <localLeader>b :s/^/> /<CR>
    " Use <localLeader>ul and <localLeader>ol to add list symbols in visual mode
    autocmd Filetype markdown vnoremap <buffer> <localLeader>ul :s/^/* /<CR>
    autocmd Filetype markdown vnoremap <buffer> <LocalLeader>ol :s/^/\=(line(".")-line("'<")+1).'. '/<CR>
    " Use <localLeader>e1/2/3 to add emphasis symbols
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e1 I*<ESC>A*<ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e2 I**<ESC>A**<ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e3 I***<ESC>A***<ESC>
    " Use <Leader>P to preview markdown file in browser
    autocmd Filetype markdown nnoremap <buffer> <Leader>P :MarkdownPreview<CR>
augroup END

"--------------------------------------------------------------------------
" => 自定义快捷键
"---------------------------------------------------------------------------

nmap wv      <C-w>v      " 垂直分割当前窗口
nmap wc      <C-w>c      " 关闭当前窗口
nmap ws      <C-w>s      " 水平分割当前窗口

" Begining & End of line in Normal mode
noremap H ^
noremap L g_

" Redesign moving keys in insert mode
"inoremap <C-K> <Up>
"inoremap <C-J> <Down>
inoremap <C-H> <Left>
inoremap <C-L> <Right>

" Make j and k work the way you expect
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Navigation between windows
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-O> <C-W>o

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Copy paste system clipboard
map <leader>y "+y
map <leader>p "+p
map <leader>P "+P

" Quit help easily
function! QuitWithQ()
  if &buftype == 'help'
    nnoremap <buffer> <silent> q :q<cr>
  endif
endfunction
autocmd FileType help exe QuitWithQ()

" Easy buffer navigation
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>


" Quick editing 
nnoremap <Leader>ev :tabedit $MYVIMRC<CR>
nnoremap <silent> <LocalLeader>rs :source $MYVIMRC<CR>

" When vimrc is edited, reload it
autocmd! BufWritePost _vimrc source $MYVIMRC

" better ESC
inoremap jk <Esc>
inoremap jkl <Esc>:
nmap ; :
nmap <leader>n :execute 'set ' . (&relativenumber ? 'number' : 'relativenumber') <CR>

" Fast saving and closing current buffer without closing windows displaying the buffer
nmap <leader>wq :w!<cr>:bdelete<cr>

"---------------------------------------------------------------------------
" => 编译和运行程序
"---------------------------------------------------------------------------

" Q的编译和运行 
"function QfMakeConv()
"   let qflist = getqflist()
"   for i in qflist
"      let i.text = iconv(i.text, "cp936", "utf-8")
"   endfor
"   call setqflist(qflist)
"endfunction
"au QuickfixCmdPost make call QfMakeConv()

map <F9> :call CompileRunQ()<CR>
func! CompileRunQ()
    set errorformat=%f，第%l行：%m
"    let &errorformat=iconv("%f第%l行%m", "utf-8", &enc)
    exec "cexpr[]"
    exec "caddf E:\\Dropbox\\tmp\\tmp.txt"
    exec "copen"
"    call QfMakeConv()
endfunc

"---------------------------------------------------------------------------
" => sessions
"---------------------------------------------------------------------------
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_default_to_last = 1
if (has("win32"))
 let g:session_directory = 'C:\Users\hm\.vim\sessions'
endif
autocmd VimLeave * SaveSession default.vim
let g:session_blacklist=['\.swp$','\.tmp$','^\.']
let g:session_whitelist=['^\_vimrc$']

"--------------------------------------------------
" => Tagbar
"--------------------------------------------------
nnoremap <Leader>t :TagbarToggle<CR>
"let g:tagbar_ctags_bin='ctags'
let g:tagbar_autofocus=1
let g:tagbar_expand=1
let g:tagbar_foldlevel=2
let g:tagbar_ironchars=['▾', '▸']
let g:tagbar_autoshowtag=1
let g:tagbar_width = 30

"--------------------------------------------------
" => NERD_tree
"--------------------------------------------------
nnoremap <Leader>d :NERDTreeTabsToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeDirArrows=1
let g:nerdtree_tabs_open_on_gui_startup=0     "(default: 1)Open NERDTree on gvim/macvim startup
let g:nerdtree_tabs_open_on_console_startup=0     "(default: 0)Open NERDTree on console vim startup



"--------------------------------------------------
" => Splitjoin
"--------------------------------------------------
nnoremap sj :SplitjoinSplit<CR>
nnoremap sk :SplitjoinJoin<CR>
let g:splitjoin_normalize_whitespace=1
let g:splitjoin_align=1

"---------------------------------------------------------------------------
" => Cscope
"---------------------------------------------------------------------------
:set cscopequickfix=s-,c-,d-,i-,t-,e-

"--------------------------------------------------
" => fugitive
"--------------------------------------------------
if executable('git')
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
endif

"--------------------------------------------------------
" => xptemplate.vim设置
"--------------------------------------------------------
let g:xptemplate_brace_complete = 0
" if nothing matched in xpt, try c-p 
let g:xptemplate_fallback = '<C-p>' 

" avoid key conflict
"let g:SuperTabMappingForward = '<Plug>supertabKey'

" if nothing matched in xpt, try supertab
"let g:xptemplate_fallback = '<Plug>supertabKey'

" xpt uses <Tab> as trigger key
let g:xptemplate_key = '<Tab>'
"let g:xptemplate_always_show_pum=1 
" use <tab>/<S-tab> to navigate through popup menu  //NOT necessary. 
let g:xptemplate_pum_tab_nav = 1 
" xpt triggers only when you typed whole name of a snippet.   //NOT necessary. 
let g:xptemplate_minimal_prefix = 'full' 
inoremap <expr> <CR> pumvisible() ? "\<C-Y><c-r>=XPTemplateStart(0)<cr>" : "\<CR>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType vbnet set omnifunc=javascriptcomplete#CompleteJ


"---------------------------------------------------------------------------
" => surround.vim
"---------------------------------------------------------------------------
xmap <Leader>sa <Plug>Vsurround

"---------------------------------------------------------------------------
" => Calendar
"---------------------------------------------------------------------------
"let g:calendar_diary='/home/cactus/dev/diary'

"---------------------------------------------------------------------------
" => VimWiki
"---------------------------------------------------------------------------
" 使用鼠标映射
let g:vimwiki_use_mouse = 1
" 不要将驼峰式词组作为 Wiki 词条
let g:vimwiki_camel_case = 0
" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1
" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1
let g:vimwiki_ext2syntax = {'.md': 'markdown',
                  \ '.mkd': 'markdown',
                  \ '.wiki': 'media'}
let g:vimwiki_valid_html_tags ='b,i,s,u,sub,sup,kbd,br,hr,div'
    let wiki_1 = {}
"    let wiki_1.index = 'VimWiki-@HM'
    let wiki_1.path = '~/vimwiki/'
    let wiki_1.path_html = '~/vimwiki/html'
    let wiki_1.template_path = '~/vimwiki/template/'
    let wiki_1.template_default = 'template1'
    let wiki_1.template_ext = '.html'
    let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
"    let wiki_1.syntax = 'markdown'
"    let wiki_1.ext = '.md'
    let g:vimwiki_list = [wiki_1]

"---------------------------------------------------------------------------
" => Grep
"---------------------------------------------------------------------------
nnoremap <silent> <F3> :Grep<CR>

"---------------------------------------------------------------------------
" => vim-indent-guides
"---------------------------------------------------------------------------
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
"nmap <silent> <Leader>ig <Plug>IndentGuidesToggle

"---------------------------------------------------------------------------
" => FuzzyFinder
"---------------------------------------------------------------------------
let g:fuf_modesDisable = []
nnoremap <silent> <LocalLeader>h :FufHelp<CR>
nnoremap <silent> <LocalLeader>2  :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <LocalLeader>@  :FufFile<CR>
nnoremap <silent> <LocalLeader>3  :FufBuffer<CR>
nnoremap <silent> <LocalLeader>4  :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> <LocalLeader>$  :FufDir<CR>
nnoremap <silent> <LocalLeader>5  :FufChangeList<CR>
nnoremap <silent> <LocalLeader>6  :FufMruFile<CR>
nnoremap <silent> <LocalLeader>7  :FufLine<CR>
nnoremap <silent> <LocalLeader>8  :FufBookmark<CR>
nnoremap <silent> <LocalLeader>*  :FuzzyFinderAddBookmark<CR><CR>
nnoremap <silent> <LocalLeader>9  :FufTaggedFile<CR>

"---------------------------------------------------------------------------
" => vim-powerline
"---------------------------------------------------------------------------
"let g:Powerline_symbols = 'fancy'
set t_Co=256
"let g:Powerline_symbols = 'unicode'

"---------------------------------------------------------------------------
" => vimim
"---------------------------------------------------------------------------
let g:vimim_map='m-space'
let g:vimim_cloud='qq'


