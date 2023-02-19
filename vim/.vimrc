if has("eval")                               " vim-tiny lacks 'eval'
  let skip_defaults_vim = 1
endif

set nocompatible

"####################### Vi Compatible (~/.exrc) #######################

" automatically indent new lines
set autoindent

" automatically write files when changing when multiple files open
set autowrite

" activate line numbers
" set nonumber
set number

" turn col and row position on in bottom right
set ruler " see ruf for formatting

" show command and insert mode
set showmode

set tabstop=4

"#######################################################################

set softtabstop=4

set shiftwidth=4

set noexpandtab

set smartindent

set smarttab

%retab

if v:version >= 800
  " stop vim from silently messing with files that it shouldn't
    set nofixendofline
    
    " better ascii friendly listchars
    set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>
    
    " i hate automatic folding
    set foldmethod=manual
    set nofoldenable
endif

" disable relative line numbers, remove no to sample it
set norelativenumber

" more risky, but cleaner
set nobackup
set noswapfile
set nowritebackup

" not a fan of bracket matching or folding
if has("eval") " vim-tiny detection
  let g:loaded_matchparen=1
endif
set noshowmatch

" wrap around when searching
set wrapscan

" Just the formatoptions defaults, these are changed per filetype by
" plugins. Most of the utility of all of this has been superceded by the use of
" modern simplified pandoc for capturing knowledge source instead of
" arbitrary raw text files.

set fo-=t   " don't auto-wrap text using text width
set fo+=c   " autowrap comments using textwidth with leader
set fo-=r   " don't auto-insert comment leader on enter in insert
set fo-=o   " don't auto-insert comment leader on o/O in normal
set fo+=q   " allow formatting of comments with gq
set fo-=w   " don't use trailing whitespace for paragraphs
set fo-=a   " disable auto-formatting of paragraph changes
set fo-=n   " don't recognized numbered lists
set fo+=j   " delete comment prefix when joining
set fo-=2   " don't use the indent of second paragraph line
set fo-=v   " don't use broken 'vi-compatible auto-wrapping'
set fo-=b   " don't use broken 'vi-compatible auto-wrapping'
set fo+=l   " long lines not broken in insert mode
set fo+=m   " multi-byte character line break support
set fo+=M   " don't add space before or after multi-byte char
set fo-=B   " don't add space between two multi-byte chars
set fo+=1   " don't break a line after a one-letter word


" stop complaints about switching buffer with changes
set hidden

" command history
set history=10

" here because plugins and stuff need it
if has("syntax")
  syntax enable
endif


" faster scrolling
set ttyfast

" allow sensing the filetype
filetype plugin on

if filereadable(expand("~/.vim/autoload/plug.vim"))

    " github.com/junegunn/vim-plug

    call plug#begin()

    Plug 'vim-syntastic/syntastic'
    Plug 'tomasiser/vim-code-dark'

    call plug#end()

    "##################### Vim-syntastic/syntastic ######################
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    ""let g:syntastic_always_populate_loc_list=1
    ""let g:syntastic_loc_list_height=3
    ""let g:syntastic_auto_loc_list=0
    let g:syntastic_check_on_open=1
    let g:syntastic_check_on_wq=1

    " cpp-language settings
    let g:syntastic_cpp_checkers=["gcc"]
    if filereadable(expand("/usr/bin/clang++-12"))
        let g:syntastic_cpp_compiler="clang++-12"
    else
        autocmd FileType cpp,c echo "Clang not avaliable, try installing clang with setup file"
    endif
	
    " shell-language settings
    if filereadable(expand("/usr/bin/shellcheck"))
        let g:syntastic_sh_checkers=["shellcheck"]
    else
        autocmd FileType sh echo "ShellCheck not avaliable, try installing shellcheck with setup file"
    endif

    " Reset the syntastic_mode_map setting to prevent any overrides, 
    " also turn off syntastic for some filetypes
    let g:syntastic_mode_map={
        \ "mode": "active",
        \ "passive_filetypes": ["vim"] }

    " Enable Syntastic by default
    let g:syntastic_enable_mode="active"


    "##################### tmoasiser/vim-code-dark ######################

    set enc=utf-8
    set renderoptions=type:directx,gamma:1.5,contrast:0.5,geom:1,renmode:5,taamode:1,level:0.5

    colorscheme codedark

else
    colorscheme default
endif

inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha

" high contrast
"set background=dark

