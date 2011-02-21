" => Rhythm is our Business "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Created: Sat 13 Oct 2007 10:39:28 PM CEST
" Modified: Fri 25 Jun 2010 03:05:56 PM CEST
"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" About: Vim version >=700 configuration file (.vimrc).
" Maintainer: z10n <genzion@gmail.com>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General VIM related "
"{{{"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "Get out of VI's compatible mode..
    set nocompatible

    "Sets how many lines of history VIM har to remember
    set history=400

    "Enable filetype plugin
    filetype on
    filetype plugin on
    filetype indent on

    "Turn backup off
    set nobackup
    set nowb
    set noswapfile

    "Set to auto read when a file is changed from the outside
    set autoread

    "Have the mouse enabled all the time:
    set mouse=a

    " No messy swap files
    set directory=/var/tmp,/tmp

    "Set 7 lines to the curors - when moving vertical..
    set so=7

    "Turn on WiLd menu
    set wildmenu

    "Always show current position
    set ruler

    "The commandbar is 2 high
    set cmdheight=2

    "Show line number
    set number

    "Change buffer - without saving
    set hid

    " Makes it harder to lose stuff
    set scrolloff=1

    " Makes things faster, I guess
    set ttyfast

    "Ignore case when searching
    set ignorecase
    set incsearch

    "Set magic on
    set magic

    "No sound on errors.
    set noerrorbells
    set novisualbell
    set t_vb=

    "show matching bracets
    set showmatch

    "How many tenths of a second to blink
    set mat=2

    "Highlight search things
    set hlsearch

    "Highlight current line in insert mode.
    au InsertLeave * se nocul
    au InsertEnter * se cul

    "Indent stuff
    set autoindent
    set smartindent

    set shell=/bin/zsh

    if version >= 700
        set completeopt=menu,longest,preview
    endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Editing options"
"{{{"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set shiftwidth=4
    set softtabstop=4
    set tabstop=8
    set lbr
"    set tw=79
    set smarttab
    set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Colors and Fonts"
"{{{"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    if has("gui_running")
        " Remove menu bar
        set guioptions-=m
        " Remove toolbar
        set guioptions-=T
        " Style and typo
        set guifont=Inconsolata\ 9.5
        colorscheme fruity
        set background=dark
    elseif &term=~"linux"
        set t_Co=16
        colorscheme peachpuff
    else
        set t_Co=256
        colorscheme inkpot
    endif

    set encoding=utf8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => General mappings and abbrevs"
"{{{""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "Set mapleader
    let mapleader = 'c'
    let g:mapleader = 'c'

    "Informations
    iab crea Created: TIMESTAMP
    iab modi Modified: TIMESTAMP

    "Fast reloading of the .vimrc
    map <leader>s :source ~/.vimrc<cr>
    "Fast editing of .vimrc
    map <leader>e :e! ~/.vimrc<cr>
    "When .vimrc is edited, reload it
    au! bufwritepost .vimrc source ~/.vimrc

    "Toggle line numbers and fold column for easy copying:
    nnoremap <F3> :set nonumber!<CR>:set foldcolumn=0<CR>

    " Searching... Map space to / and c-space to ?
    map <space> /

    "Quit warn if changed
    map <ESC><ESC> :q<CR>
    "Quit drop changes
    map <F10> :q!<CR>
    "backspace delete tabs!
    set backspace=indent,eol,start

    " Setuje srpski
"    nmap <F7> :set keymap=serbian-latin<CR>
    " Vraca na default
"    nmap <F8> :set keymap=<CR>
   
"    if has("gui_running")
"        source $VIMRUNTIME/mswin.vim    
"    endif

    " Force saving
    map <F6> :w!<CR>

    " use ctrl-space for omni and keyword completion
    inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
    \ "\<lt>C-n>" :
    \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
    \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
    \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
    imap <C-@> <C-Space>

    " Favorite filetypes
    set ffs=unix,dos,mac
    nmap <leader>fd :se ff=dos<cr>
    nmap <leader>fu :se ff=unix<cr>

    " Tab configuration
    map <leader>n :tabnew<cr>
    map <C-t> :tabnew<cr>
    map <C-Tab> :tabnext<cr>
    map <C-S-Tab> :tabprevious<cr>
    map <leader>m :tabclose<cr>

    " Moving beetwen splits with Alt+Movement keys
    nmap <silent> <A-Up> :wincmd k<CR>
    nmap <silent> <A-Down> :wincmd j<CR>
    nmap <silent> <A-Left> :wincmd h<CR>
    nmap <silent> <A-Right> :wincmd l<CR>

    " FindFile
    nmap <C-f> :FindFile<CR>

    " File explorer (NERDTree)
    map <leader><up> :NERDTreeToggle /<cr>

    "Wrap lines
    set wrap

    "XML/XHTML Indenting
    vmap ,x :!tidy -q -i -xml<CR>
    vmap ,h :!tidy -q -i -html<CR>

    "Remove the Windows ^M
    noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

    "Paste toggle - when pasting something in, don't indent.
    set pastetoggle=<F3>

    "Remove indenting on empty lines
    map <F2> :%s/\s*$//g<cr>:noh<cr>''

    "Open documentation for VIM shortcuts
    map <leader>d :e ~/.vim/doc/shortcuts.vim<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Statusline"
"{{{""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set laststatus=2
    function! CurDir()
        let curdir = substitute(getcwd(), '$HOME', "~/", "g")
        return curdir
    endfunction

    " Format the statusline
    set statusline=\FILE:\ %F%m%r%h\ %w\ \ PWD:\ %r%{CurDir()}%h\ \ LINE:\ %l/%L:%c
    set statusline+=\ TYPE:\ [%{strlen(&ft)?&ft:'none'}, " filetype
    set statusline+=%{&encoding},                " encoding
    set statusline+=%{&fileformat}]              " file format

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Window title "{
"{{{""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Nice window title
    if has('title') && (has('gui_running') || &title)
        set titlestring=
        set titlestring+=%f\                     " file name
        set titlestring+=%h%m%r%w                " flags
        set titlestring+=\ -\ %{v:progname}      " program name
        set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')} " working directory
    endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Visual"
"{{{""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " From an idea by Michael Naumann
    function! VisualSearch(direction) range
        let l:saved_reg = @"
        execute "normal! vgvy"
        let l:pattern = escape(@", '\\/.*$^~[]')
        let l:pattern = substitute(l:pattern, "\n$", "", "")
        if a:direction == 'b'
            execute "normal ?" . l:pattern . "^M"
        else
            execute "normal /" . l:pattern . "^M"
        endif
        let @/ = l:pattern
        let @" = l:saved_reg
    endfunction

    "Basically you press * or # to search for the current selection !! Really useful
    vnoremap <silent> * :call VisualSearch('f')<CR>
    vnoremap <silent> # :call VisualSearch('b')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Buffer related"
"{{{""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "Restore cursor to file position in previous editing session
    set viminfo='10,\"100,:20,%,n~/.viminfo
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Don't close window, when deleting a buffer
    command! Bclose call <SID>BufcloseCloseIt()

    function! <SID>BufcloseCloseIt()
        let l:currentBufNum = bufnr("%")
        let l:alternateBufNum = bufnr("#")

        if buflisted(l:alternateBufNum)
            buffer #
        else
            bnext
        endif

        if bufnr("%") == l:currentBufNum
            new
        endif

        if buflisted(l:currentBufNum)
            execute("bdelete! ".l:currentBufNum)
        endif
    endfunction

    "Bclose function ca be found in "Buffer related" section
    "map <down> <leader>bd
    map <leader><delete> :Bclose<cr>
    "Use the arrows to something usefull
    map <leader><right> :bn<cr>
    map <leader><left> :bp<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Folding"
"{{{""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "Enable folding
    "set nofen
    set fdl=0
    "Auto close folds
    " set foldclose=all

    " Toggle fold state between closed and opened.
    "
    " If there is no fold at current line, just moves forward.
    " If it is present, reverse it's state.
      fun! ToggleFold()
      if foldlevel('.') == 0
      normal! l
      else
      if foldclosed('.') < 0
      . foldclose
      else
      . foldopen
      endif
      endif
      " Clear status line
      echo
      endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Syntax and filetypes "
"{{{"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    syntax enable
    " Mapping to switch syntax 
    " (useful if one mixes different languages in one file)
    map <leader>1 :set syntax=smarty<cr>
    map <leader>2 :set syntax=html<cr>
    map <leader>3 :set syntax=css<cr>
    map <leader>4 :set ft=javascript<cr>
    map <leader>5 :set ft=zsh<cr>
    map <leader>6 :set ft=asciidoc<cr>

    au BufEnter * :syntax sync fromstart

    " => Markdown
    au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown} set filetype=markdown

    " => Vim section
    au FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>
    au FileType vim set nofen

    " => HTML related
    " HTML entities - used by xml edit plugin
    let xml_use_xhtml = 1
    let xml_no_auto_nesting = 0

    " To HTML
    let html_use_css = 1
    let html_number_lines = 0
    let use_xhtml = 1

    " => Smarty
    au BufRead,BufNewFile *.tpl set filetype=smarty
    au Filetype smarty exec('set dictionary=~/.vim/syntax/smarty.vim')
    au Filetype smarty set complete+=k

    " => JavaScript section
    au FileType javascript so ~/.vim/syntax/javascript.vim
    au FileType javascript setl fen
    au FileType javascript setl nocindent

    " => Smarty
    au BufNewFile,BufRead *.tpl setlocal filetype=smarty
    au FileType tpl set syntax=smarty

    " => HTML
    au BufNewFile,BufRead *.html setlocal filetype=html
    au FileType html set syntax=html

    " => CSS
    "Set folding for CSS
    set foldmethod=marker

    " => ZSH
    au BufNewFile,BufRead *.zsh set filetype=zsh
    au FileType zsh set syntax=zsh

    " => Python
    au BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class 
    au BufWritePre *.py normal m`:%s/\s\+$//e ``
    au BufRead,BufNewFile *.py set textwidth=79
    au FileType python set omnifunc=pythoncomplete#Complete

    " If you want all Python highlightings above:
    let python_highlight_all = 1

    " For fast machines:
    let python_slow_sync = 1

    " For "print" builtin as function:
    " python_print_as_function

    " Python syntax
    "au FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

    "let g:pydiction_location = '~/.vim/ftplugin/pydiction/complete-dict'

    " => ASCIIDOC
    au BufNewFile,BufRead *.txt set filetype=asciidoc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Plugin specific settings  
"{{{"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    
    " Mappings for Tasklist and Taglist plugins
    map T :TaskList<CR> 
    map P :TlistToggle<CR>
    
    " MiniBuffer Explorer
"    let g:miniBufExplMapWindowNavVim = 1
"    let g:miniBufExplMapWindowNavArrows = 1
"    let g:miniBufExplMapCTabSwitchBufs = 1
"    let g:miniBufExplModSelTarget = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
