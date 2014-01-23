""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Customize by Yansheng Jiang
" 2011-11-26
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=7000

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
"colorscheme desert  "8 colors
colorscheme darkburn  "256 colors

" Tell vim to remember certain things when we exit
" '10  :  marks will be remembered for up to 10 previously edited files
" "100 :  will save up to 100 lines for each register
" :20  :  up to 20 lines of command-line history will be remembered
" %    :  saves and restores the buffer list
" n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set cmdheight=2 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set tm=500

" set foldmethod to toggle code blocks
"set fdm=syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl
set modeline

" Set font
set gfn=Monospace\ 10
set shell=/bin/bash

"set encoding=utf8
set encoding=utf-8 "fileencodings=ucs-bom,utf-8,cp936
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types
set t_Co=256 "set avail colors for vim

""set color scheme for vimdiff
"if &diff
"    "colorscheme evening
"    highlight DiffAdd cterm=NONE ctermfg=White ctermbg=Green gui=NONE guifg=White guibg=Green
"    highlight DiffDelete cterm=NONE ctermfg=White ctermbg=Red gui=NONE guifg=White guibg=Red
"    highlight DiffChange cterm=NONE ctermfg=White ctermbg=Yellow gui=NONE guifg=White guibg=Yellow
"    highlight DiffText cterm=NONE ctermfg=White ctermbg=Magenta gui=NONE guifg=White guibg=Magenta
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try
    set undodir=~/.vim_runtime/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines
set cindent "c/c++ indent style


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE '
    else
        return ''
    endif
endfunction

""""""""""""""""""""""""""""""""""
" => paste mode settings
""""""""""""""""""""""""""""""""""
set pastetoggle=<C-p> " Ctrl-p toggles paste mode

""""""""""""""""""""""""""""""""""
" => cscope settings
""""""""""""""""""""""""""""""""""
if has("cscope")
    "set csprg=/usr/local/bin/cscope
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
    "set csverb "turn cscope verbose mode on
    
    "map ctrl + space key
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

""""""""""""""""""""""""""""""
" => DoxyGenToolkit plugin
""""""""""""""""""""""""""""""
let g:DoxygenToolkit_briefTag_pre="@brief " 
let g:DoxygenToolkit_paramTag_pre="@param " 
let g:DoxygenToolkit_returnTag="@return " 
let g:DoxygenToolkit_blockHeader="" 
let g:DoxygenToolkit_blockFooter="" 
let g:DoxygenToolkit_authorName="mikejiang" 
let g:DoxygenToolkit_licenseTag=""

""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplSplitBelow=1
if &diff
    " in diff mod, shutdown miniBuf window
    let g:miniBufExplVSplit = 0
else
    " in vim mod, open miniBuf window
    let g:miniBufExplVSplit = 20
endif

""""""""""""""""""""""""""""""
" => Nerdtree plugin
""""""""""""""""""""""""""""""
let NERDTreeWinSize=30
"autocmd VimEnter * NERDTree "auto open nerd tree
"if &diff
"    "auto close nerd tree
"    autocmd VimEnter * NERDTreeClose 
"else
"    "focus in editor window
"    autocmd VimEnter * wincmd l 
"endif

"""""""""""""""""""""""""""""""
"" => C-Support plugin
"""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""
"" => SuperTab plugin
"""""""""""""""""""""""""""""""
let g:SuperTabMappingTabLiteral = '<c-tab>'


""""""""""""""""""""""""""""""
" => Taglist
""""""""""""""""""""""""""""""
let Tlist_Use_Left_Window   = 1
let Tlist_WinWidth = 25

""""""""""""""""""""""""""""""""""
"" => Hide the carriage return '^M'
""""""""""""""""""""""""""""""""""
match ignore /\r$/
