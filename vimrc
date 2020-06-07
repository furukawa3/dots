set nocompatible
" Directory to be installed plugins
let s:dein_dir = expand('~/.cache/dein')
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
" Start setting
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/unite-outline.git')
  call dein#add('Shougo/unite.vim.git')
  call dein#add('Shougo/neocomplete.git')
  call dein#add('Shougo/neobundle.vim.git')
  call dein#add('Shougo/neosnippet.git')
  call dein#add('Shougo/neosnippet-snippets.git')
  call dein#add('thinca/vim-quickrun.git')
  call dein#add('vim-scripts/svndiff.vim.git')
  call dein#add('tpope/vim-surround.git')
  call dein#add('bling/vim-airline.git')
  call dein#add('nathanaelkane/vim-indent-guides.git')
  call dein#add('vim-scripts/wombat256.vim.git')
  call dein#add('5t111111/alt-gtags.vim')
  call dein#add('Shougo/tabpagebuffer.vim.git')
  call dein#add('tpope/vim-fugitive.git')
  call dein#add('osyo-manga/shabadou.vim.git')
  call dein#add('osyo-manga/vim-watchdogs.git')
  call dein#add('dannyob/quickfixstatus.git')
  call dein#add('KazuakiM/vim-qfstatusline.git')
  call dein#add('tomtom/quickfixsigns_vim')
  call dein#add('itchyny/lightline.vim.git')
  call dein#add('jceb/vim-hier.git')
  call dein#add('fatih/vim-go.git')
  call dein#add('morhetz/gruvbox.git')
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

syntax on
set nu
"set relativenumber
set vb t_vb=
set title
set diffopt+=vertical
filetype on
filetype indent on
filetype plugin on
set ffs=unix,dos,mac
source $VIMRUNTIME/macros/matchit.vim
set autoindent
set showmode
set showmatch
set list
set nobackup
set shiftwidth=4
set smartindent
set expandtab
set tabstop=4
set showcmd
"set cursorline
set hlsearch
"set cursorcolumn
set background=dark
set laststatus=2
set noundofile
autocmd FileType text setlocal textwidth=0
set lazyredraw
set ttyfast
set hidden
set ambiwidth=double

augroup highlightIdegraphicSpace
    autocmd!
    autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
set clipboard=unnamed,autoselect
set list listchars=tab:\ \ ,eol:$,trail:-,
""------------------------------------------------------------------------------
"" Key-bind configuration
""------------------------------------------------------------------------------
inoremap &color &color(black,yellow){};<LEFT><LEFT>
inoremap &size  &size(black,yellow){};<LEFT><LEFT>
inoremap <C-l> <ESC>
noremap  <SPACE> gt
"
""
set textwidth=80
if exists('&colorcolumn')
  set colorcolumn=+1
endif

set wildmode=list:longest
set tags=tags,./tags
set complete+=k

"------------------------------------------------------------------------------
" Color configuration
"------------------------------------------------------------------------------
set t_Co=256
colorscheme wombat256mod

hi Normal ctermfg=252 ctermbg=233 cterm=none guifg=#e3e0d7 guibg=#242424 gui=none
hi Search     ctermfg=black ctermbg=lightyellow
hi PmenuBar   ctermfg=white ctermbg=gray
hi PmenuSel   ctermfg=black ctermbg=lightgreen
hi StatusLine term=NONE    cterm=NONE ctermfg=white ctermbg=darkred
hi cursorline term=reverse cterm=none ctermbg=0
hi cursorline term=reverse cterm=reverse
hi link NonText LineNr
"let g:molokai_original=1

""------------------------------------------------------------------------------
"" Command shortcut
""------------------------------------------------------------------------------
"function Plane()
"  let number_status = (call set nu? == 'number') ? 'nonumber' : "number"
"  echo number_status
"endfunction
"command Nono :call Plane()
"
"TODO: Specify file format 4 TOML file
"TODO: Fix vimproc settings
""------------------------------------------------------------------------------
"" Plug-in configuration
""------------------------------------------------------------------------------
"==============================================================================
" neocomplete
"==============================================================================
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-g>  neocomplete#undo_completion()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"
"==============================================================================
" quickrun
"==============================================================================
let g:quiickrun_config={'*': {'sp': ''}}
set splitbelow
"set splitright
"
"==============================================================================
" quickfixsigns_vim
"==============================================================================
let g:quickfixsigns_sign_may_use_double = 0

"==============================================================================
" watchdogs
"==============================================================================
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner': "vimproc"}
let g:quickrun_config["watchdogs_checker/_"] = {
      \ "runner" : "vimproc",
      \ "outputter" : "quickfix",
      \ "hook/quickfix_status_enable/enable_exit" : 1,
      \ "hook/quickfixsigns_enable/enable_exit" : 1,
      \ "hook/qfixgrep_enable/enable_exit" : 1,
      \ 'runmode' : "async:remote:vimproc",
      \ }
let g:quickrun_config['watchdogs_checker/nop'] = {
      \ "command" : "echo",
      \ "exec" : "%c nop",
      \}
"let g:quickrun_config['scala/watchdogs_checker'] = {"type" : "watchdogs_checker/nop"}
let g:watchdogs_check_BufWritePost_enables = {
      \ "scala" : 0
      \ }
let g:watchdogs_check_BufWritePost_enable = 1

let s:pyflakes = 'python'
"      \ executable('python3') ? 'python3' :
"      \ executable('pyflakes') ? 'pyflakes' :
"      \ 'python'
let s:cmdopt = executable('pyflakes3') ? '' :
      \ executable('python3') ? '-m pyflakes' :
      \ executable('pyflakes') ? '' :
      \ '-m pyflakes'
let g:quickrun_config["watchdogs_checker/pyflakes3"] = {
      \ "command" : s:pyflakes,
      \ "cmdopt" : s:cmdopt,
      \ "exec" : "%c %o %s:p",
      \ "errorformat" : '%f:%l:%m',
      \ }
unlet s:pyflakes
unlet s:cmdopt
let g:quickrun_config["python/watchdogs_checker"] = {
      \ "type" : "watchdogs_checker/pyflakes3",
      \ }
call watchdogs#setup(g:quickrun_config)

augroup my_watchdogs
    autocmd!
"    autocmd InsertLeave,BufWritePost,TextChanged *.py WatchdogsRun
    autocmd BufRead,BufNewFile *.py WatchdogsRun
augroup END

"==============================================================================
" syntastic
" syntastic recommend setting from github
"==============================================================================
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_python_checkers = ['pyflakes', 'pep8']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_mode_map = {
"            \ 'mode': 'active',
"            \ 'active_filetypes': ['php', 'coffeescript', 'sh', 'vim'],
"            \ 'passive_filetypes': ['html', 'haskell', 'python']
"            \}
"
"==============================================================================
" vim indent-guides
"==============================================================================
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size=1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']

let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=52
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=233

"==============================================================================
" unite setting from h
"==============================================================================
" map f as unite prefix key
nnoremap ff f

imap <silent> <expr> <Tab> <SID>tab_wrapper()
smap  <TAB> <Plug>(neocomplcache_snippets_expand)
function! s:tab_wrapper()
  if neosnippet#expandable_or_jumpable()
    return "\<Plug>(neosnippet_expand_or_jump)"
  endif
  return "\<TAB>"
endfunction
nmap f [unite]
xmap f [unite]

nnoremap [unite] <Nop>
xnoremap [unite] <Nop>
" mapping for Unite functions
nnoremap <silent> [unite]u :Unite -buffer-name=files file<CR>
nnoremap <silent> [unite]m :Unite -buffer-name=file file_mru<CR>
nnoremap <silent> [unite]r :Unite file_rec<CR>
nnoremap [unite]R :Unite ref/
nnoremap <silent> [unite]b :UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> [unite]c :UniteWithCurrentDir -buffer-name=files file file/new<CR>
nnoremap <silent> [unite]t :Unite tab<CR>
nnoremap <silent> [unite]T :Unite tag<CR>
nnoremap <silent> [unite]y :Unite register<CR>
nnoremap <silent> [unite]a :UniteBookmarkAdd<CR>
nnoremap <silent> [unite]p :Unite bookmark -default-action=cd -no-start-insert<CR>
"nnoremap <silent> [unite]j :Unite jump<CR>
" Explore home dir
nnoremap <silent> <expr> [unite]h ':UniteWithInput -buffer-name=files file file/new -input='. $HOME .'/<CR>'
nnoremap <silent> [unite]j :Unite buffer_tab -no-start-insert<CR>
nnoremap <silent> [unite]l :Unite line<CR>
nnoremap <expr>   [unite]g ':Unite grep:'. expand("%:h") . ':-r'
nnoremap <silent> [unite]* :UniteWithCursorWord line<CR>
nnoremap <silent> [unite]o :Unite -buffer-name=outline outline<CR>
nnoremap <silent> [unite]q :Unite qf -no-start-insert<CR>
nnoremap [unite]s<SPACE> :Unite svn/
nnoremap <silent> [unite]sd :Unite svn/diff<CR>
nnoremap <silent> [unite]sb :Unite svn/blame<CR>
nnoremap <silent> [unite]ss :Unite svn/status<CR>
noremap [unite]] :<C-u>Unite -immediately -no-start-insert tag:<C-r>=expand('<cword>')<CR><CR>
let g:unite_enable_ignore_case              = 1
let g:unite_enable_smart_case               = 1
let g:unite_enable_start_insert             = 1
let g:unite_enable_split_vertically         = 0
let g:unite_source_file_mru_limit           = 300
let g:unite_source_file_rec_min_cache_files = 300
let g:unite_source_file_rec_max_depth       = 10
let g:unite_winheight                       = 20
"let g:unite_kind_openable_cd_command      = 'TabpageCD'
"let g:unite_kind_openable_lcd_command     = 'TabpageCD'

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  nnoremap <silent><buffer> <C-o> :call unite#mappings#do_action('tabopen')<CR>
  nnoremap <silent><buffer> <C-v> :call unite#mappings#do_action('vsplit')<CR>
  nnoremap <silent><buffer> <C-s> :call unite#mappings#do_action('split')<CR>
  nnoremap <silent><buffer> <C-r> :call unite#mappings#do_action('rec')<CR>
  nnoremap <silent><buffer> <C-f> :call unite#mappings#do_action('preview')<CR>
  inoremap <silent><buffer> <C-o> <Esc>:call unite#mappings#do_action('tabopen')<CR>
  inoremap <silent><buffer> <C-v> <Esc>:call unite#mappings#do_action('vsplit')<CR>
  inoremap <silent><buffer> <C-s> <Esc>:call unite#mappings#do_action('split')<CR>
  inoremap <silent><buffer> <C-r> <Esc>:call unite#mappings#do_action('rec')<CR>
  inoremap <silent><buffer> <C-e> <Esc>:call unite#mappings#do_action('edit')<CR>
  inoremap <silent><buffer> <C-f> <C-o>:call unite#mappings#do_action('preview')<CR>
  " I hope to use <C-o> and return to the selected item after action...
  imap <silent><buffer> <C-j> <Plug>(unite_exit)
  nmap <silent><buffer> <C-j> <Plug>(unite_all_exit)
  inoremap <silent><buffer> <SPACE> _
  inoremap <silent><buffer> _ <SPACE>
endfunction "}}}
"}}}
