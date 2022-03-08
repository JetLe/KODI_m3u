" Disable compatibility with vi which can cause unexpected issues.
set nocompatible
let mapleader=" "
set encoding=UTF-8
set langmenu=en_US.UTF-8
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
syntax on " 语法高亮
set history =1000
set number
set relativenumber
set ts=4
set noeb
"  set nobackup "  禁止生成备份文件
set ruler
set autoindent " 自动缩进
set cursorline " 光标所在行增加下划线
set cursorcolumn
" set hlsearch "  高亮显示所有搜索内容
exec "nohlsearch"  
set ignorecase " 忽略大小写
set incsearch " 输入及时搜索
set smartcase
set fillchars=vert:\ ,stl:\ ,stlnc:\  " 在被分割的窗口间显示空白，便于阅读
set smartindent " 智能对齐
set nowrap " 超出屏幕自动换行

set wildmenu " 命令模式的提示
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set confirm " 在处理未保存或只读文件时弹出确认
set noeb
set vb t_vb=
set hidden "coc_set_config
set updatetime=100
set clipboard=unnamed
"Mode Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
set ambiwidth=double
set laststatus=2
set t_Co=256
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"
" key config
map tu :tabe<CR>
map = nzz
map - Nzz
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER><CR> :nohlsearch<CR>
map <C-a> :<Esc> ggvG
nmap <C-j> :res +5<CR>
nmap <C-k> :res -5<CR>
nmap <C-h> :vertical resize+5<CR>
nmap <C-l> :vertical resize-5<CR>
nmap W :w<CR>
nmap Q :q<CR>
nmap S :source $MYVIMRC<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
inoremap fj <Esc>
inoremap jf <Esc>
inoremap \  <Esc>A


" nmap <F1> :
" nmap <F2> :
" nmap <F3> :
" nmap <F4> :
" nmap <F5> :
" nmap <F6> :
" nmap <F7> :
" nmap <F8> :
" nmap <F9> :
" nmap <F10> :
" nmap <F11> :
                                             " nmap <F12> <Plug>(omnisharp_go_to_definition)
" nmap <F12> :OmniSharpGotoDefinition<CR>


"PLUG CONFIG
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline' " line theme
Plug 'vim-airline/vim-airline-themes' 

" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " File navigation
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'posva/vim-vue'
Plug 'MaraniMatias/vue-formatter'
"Plug 'Valloric/YouCompleteMe'
Plug 'OmniSharp/omnisharp-vim' " CSharp
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line <space>cu to uncomment a line
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " find files 
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs' "auto-pairs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Linting/error highlighting
Plug 'dense-analysis/ale'
"Plug 'prabirshrestha/asyncomplete.vim' " Autocompletion
Plug 'nickspoons/vim-sharpenup'
"Plug 'SirVer/ultisnips' " Track the engine.
Plug 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them:
"Plug 'tmhedberg/SimpylFold'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/taglist.vim'
Plug 'easymotion/vim-easymotion'
call plug#end()

" nerdcommenter config
"
" let g:NERDSpaceDelims            = 1                                    " 在注释符号后加一个空格
" let g:NERDCompactSexyComs        = 1                                    " 紧凑排布多行注释
" let g:NERDDefaultAlign           = 'left'                               " 逐行注释左对齐
" "let g:NERDAltDelims_java         = 1                                    " JAVA 语言使用默认的注释符号
" let g:NERDCustomDelimiters       = {'c': {'left': '/*', 'right': '*/'}} " C 语言注释符号
" let g:NERDCommentEmptyLines      = 1                                    " 允许空行注释
" let g:NERDTrimTrailingWhitespace = 1                                    " 取消注释时删除行尾空格
" let g:NERDToggleCheckAllLines    = 1                                    " 检查选中的行操作是否成功

" taglist config
let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_Update = 1    " 自动更新
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window=1
map <silent> <c-m> :TlistToggle<cr>

" easymotion config
" nmap ss <Plug>(easymotion-s2)
let g:EasyMotion_do_mapping = 0  " Disable default mappings
let g:EasyMotion_smartcase  = 1  " Turn on case-insensitive feature
" Find {char}{char} forward and backward at the same timse
nmap <Leader>s <Plug>(easymotion-sn)
xmap <Leader>s <Plug>(easymotion-sn)
omap <Leader>s <Plug>(easymotion-sn)
" Beginning of word forward and backward
nmap <Leader>w <Plug>(easymotion-overwin-w)
xmap <Leader>w <Plug>(easymotion-bd-w)
omap <Leader>w <Plug>(easymotion-bd-w)
" Line downward and upward
nmap <Leader>ej <Plug>(easymotion-overwin-line)
xmap <Leader>ej <Plug>(easymotion-bd-jk)
omap <Leader>ej <Plug>(easymotion-bd-jk)
" jump to anywhere in line
nmap <Leader>ea <Plug>(easymotion-lineanywhere)

"" Colors: {{{
"augroup ColorschemePreferences
  "autocmd!
  """ These preferences clear some gruvbox background colours, allowing transparency
  "autocmd ColorScheme * highlight Normal     ctermbg=NONE guibg=NONE
  "autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
  "autocmd ColorScheme * highlight Todo       ctermbg=NONE guibg=NONE
  """ Link ALE sign highlights to similar equivalents without background colours
  "autocmd ColorScheme * highlight link ALEErrorSign   WarningMsg
  "autocmd ColorScheme * highlight link ALEWarningSign ModeMsg
  "autocmd ColorScheme * highlight link ALEInfoSign    Identifier
"augroup END

"" Use truecolor in the terminal, when it is supported
"if has('termguicolors')
  "set termguicolors
"endif

set background=dark
colorscheme gruvbox

"" SimpylFold Config
"let g:SimpylFold_docstring_preview = 1
"
" youcompleteme config
"let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']

"asyncomplete config
set completeopt=menuone,noinsert,noselect,popuphidden
set completepopup=highlight:Pmenu,border:off


" OMNISHARP 
autocmd FileType cs nmap <buffer> gd <Plug>(omnisharp_go_to_definition)
autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
" Navigate up and down by method/property/field
autocmd FileType cs nmap <silent> <buffer> <C-[> <Plug>(omnisharp_navigate_up)
autocmd FileType cs nmap <silent> <buffer>  <C-]> <Plug>(omnisharp_navigate_down)
" Find all code errors/warnings for the current solution and populate the quickfix window
autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
" Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
" Repeat the last code action performed (does not use a selector)
autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)
"can replace vim R
autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
"autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
"autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
let g:OmniSharp_diagnostic_listen = 2
let g:OmniSharp_server_use_net6 = 1

"Supprot for different goto definitions for different file types.
let g:OmniSharp_selector_ui = 'fzf' 
"  Use fzf
let g:OmniSharp_selector_findusages = 'fzf'
let g:OmniSharp_popup_mappings = { 
\ 'sigNext': '<C-n>', 
\ 'sigPrev': '<C-p>', 
\ 'sigParamNext': '<C-l>', 
\ 'sigParamPrev': ['<C-h>'],
\ 'lineDown': ['<C-e>', 'j'],
\ 'lineUp': ['<C-y>', 'k']
\}
let g:Omnisharp_prefer_popups=1

"ALE CONFIG
let g:ale_sign_error = 'e'
let g:ale_sign_warning = 'w'
let g:ale_sign_info = 'i'
let g:ale_sign_style_error = 'se'
let g:ale_sign_style_warning = 'sw'
let g:ale_lint_on_text_changed       = 'normal'                     " 代码更改后启动检查 
let g:ale_lint_on_insert_leave       = 1                            " 退出插入模式即检查
let g:ale_sign_column_always         = 1                            " 总是显示动态检查结果
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:ale_lint_on_enter = 1
" " <F9> 触发/关闭代码动态检查
map <F9> :ALEToggle<CR>
"普通模式下，ak 前往上一个错误或警告，aj 前往下一个错误或警告
nmap ak <Plug>(ale_previous_wrap)
nmap aj <Plug>(ale_next_wrap)
nmap ad :ALEDetail<CR> " ad 查看错误或警告的详细信息


"" Asyncomplete: {{{
"let g:asyncomplete_auto_popup = 1
"let g:asyncomplete_auto_completeopt =0
"" }}}
""
" Sharpenup: {{{
" All sharpenup mappings will begin with `<Space>os`, e.g. `<Space>osgd` for
" :OmniSharpGotoDefinition
let g:sharpenup_map_prefix = '<Space>os'
let g:sharpenup_statusline_opts = { 'Text': '%s (%p/%P)' }




 "OmniSharp: {{{
let g:OmniSharp_popup_position = 'peek'
if has('nvim')
  let g:OmniSharp_popup_options = {
  \ 'winhl': 'Normal:NormalFloat'
  \}
else
  let g:OmniSharp_popup_options = {
  \ 'highlight': 'Normal',
  \ 'padding': [0, 0, 0, 0],
  \ 'border': [1]
  \}
endif
"\}

" NERDTREE CONFIG
" 启动 vim 时打开 NERDTree
 " autocmd vimenter * NERDTree
" 当打开 VIM，没有指定文件时和打开一个目录时，打开 NERDTree
autocmd StdinReadPre * let s:std_in = 1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
" autocmd StdinReadPre * let s:std_in = 1
let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.egg$', '^\.git$', '^\.repo$', '^\.svn$', '^\.hg$' ]
" map ff :NERDTreeToggle<CR>
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
" let NERDTreeHighlightCursorline = 1       " 高亮当前行
"let NERDTreeShowLineNumbers     = 1       " 显示行号
" let NERDTreeShowHidden=1
" let NERDTreeShowBookmarks = 1
" let NERDTreeMapOpenExpl = ""
" let NERDTreeMapOpenSplit = ""
" let NERDTreeOpenVSplit = ""
" let NERDTreeMapActivateNode = "i"
" let NERDTreeMapOpenInTab = "o"
" let NERDTreeMapPreview = ""
" let NERDTreeMapCloseDir = "n"
" let NERDTreeMapChangeRoot = "y"
" let g:NERDTreeGitStausIndicatorMapCustom = {
"         \ "Modified"  : "✹",
" \ "Staged"    : "✚",
" \ "Untracked" : "✭",
" \ "Renamed"   : "➜",
" \ "Unmerged"  : "═",
" \ "Deleted"   : "✖",
" \ "Dirty"     : "✗",
" \ "Clean"     : "✔︎",
" \ 'Ignored'   : '☒',
" \ "Unknown"   : "?"
" \ }
"
"AIRLINE CONFIG 
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#airline_left_sep = " "
let g:airline#extensions#tabline#airline_left_alt_sep = "|"
let g:airline#extensions#fzf#enabled = 1
let g:airline_detect_spell=1
let g:airline#extensions#tabline#buffer_nr_show = 1 " 显示 buffer 编号
let g:airline#extensions#ale#enabled = 1 " enable ale integration

" <leader>1~9 切到 buffer1~9
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

"" FZF CONFIG
let g:fzf_buffers_jump = 1
command! -bang -nargs=* Ag
 \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', 'ctrl-/'),
  \                 <bang>0)


"link project files for fzf
command! -bang Fdotnet call fzf#vim#files('/home/vac/code/centaline.com.cn/dotnet', <bang>0)

nnoremap <silent> <LEADER>a :Ag<CR>
nnoremap <silent> <LEADER>\ :Files ~<CR>
let g:fzf_preview_window = ['right:30%', 'ctrl-/']
"let g:fzf_layout = { 'down': '40%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'down': '30%' }
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


"snippets config
"let g:UltiSnipsExpandTrigger=";"
let g:UltiSnipsJumpForwardTrigger="<c><RC>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"


"COC CONFIG
"
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
let g:coc_global_extensions = ["coc-json","coc-tsserver","coc-explorer","coc-vimlsp"]

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" coc-explorer config
"
:nmap ff <Cmd>CocCommand explorer<CR>
"use tab for trigger completion with characters ahead and navigate.
" note: use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <tab>
	   \ pumvisible() ? "\<c-n>" :
	   \ <sid>check_back_space() ? "\<tab>" :
	   \ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" make <cr> auto-select the first completion item and notify coc.nvim to

" " format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
					   \: "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"
inoremap <silent><expr> <c-p> coc#refresh()

nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
autocmd CursorHold * silent call CocActionAsync('highlight')
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>m  <Plug>(coc-codeaction-selected)
"nmap <leader>m  <Plug>(coc-codeaction-selected)
"test git pull
