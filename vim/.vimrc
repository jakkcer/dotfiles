"------------------------------------------
" .vimrc using dein.vim
"------------------------------------------

"------------------------------------------
" set encoding
"------------------------------------------
set encoding=utf-8
scriptencoding utf-8

"------------------------------------------
" python setting
"------------------------------------------
" PATH auto update function
" | add path to $PATH only when path not in $PATH and path exists
function! IncludePath(path)
    if has('win16') || has('win32') || has('win64')
        let delimiter = ";"
    else
        let delimiter = ":"
    endif
    let pathlist = split($PATH, delimiter)
    if isdirectory(a:path) && index(pathlist, a:path) == -1
        let $PATH=a:path.delimiter.$PATH
    endif
endfunction

" add '~/.pyenv/shims' to $PATH
call IncludePath(expand('~/.pyenv/shims'))

"------------------------------------------
" initial autocmd setting
"------------------------------------------
augroup InitAutoCmd
  autocmd!
augroup END

"------------------------------------------
" Leader setting
"------------------------------------------
let mapleader="\<Space>"

"------------------------------------------
" dein Scripts-----------------------------
if &compatible
  set nocompatible " Be iMproved
endif

let s:dein_dir = expand('$HOME/.cache/dein') " plugin installation directory
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim' " body of dein.vim

" if no dein.vim, install fron github
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Required:
" start setting
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, ['$HOME/.vimrc'])

  " plugin list TOML file
  let g:rc_dir = expand('$HOME/.vim/rc')
  let s:toml = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " read and cache TOML
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" End dein Scripts-------------------------
"------------------------------------------


"------------------------------------------
" encoding
"------------------------------------------
set fileencoding=utf-8 " encoding for saving file
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " detect encoding automatically when reading file, left has priority
set fileformats=unix,dos,mac " detect newline char automatically, left prior
set ambiwidth=double " treat ambiguous char as double width
set list " show unvisible char

"------------------------------------------
" tab, indent
"------------------------------------------
set smarttab " indent when tab input in margin
set expandtab " replace tab input as several space input
set tabstop=2 " displayed width of tab char
set softtabstop=2 " moving width of cursor for continuous spaces or tabs
set autoindent " continue indent when indention
set smartindent " check prev line indent and set new line indent properly
set shiftwidth=2 " width of indent used in smartindent
" set python indent
autocmd InitAutoCmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4

"------------------------------------------
" string search
"------------------------------------------
set incsearch " incrimental search; search string for each input character
set ignorecase " ignore capital/small case when search string
set smartcase " if search pattern include capital case, distinct capital/small case
set hlsearch " highlight search words
" switch higlight or not
nnoremap <silent><Esc><Esc> :<C-u>set noslsearch<CR>

"------------------------------------------
" cursor
"------------------------------------------
set whichwrap=b,s,h,l,<,>,[,],~ " L/R cursor moves to next line head from prev line end
set number " show line number
set cursorline " highlight current line
" if line is wraped, move cursor by viewed line
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
" activate delete key
set backspace=indent,eol,start

"------------------------------------------
" key setting
"------------------------------------------
set showmatch " show matching parenthesis
source $VIMRUNTIME/macros/matchit.vim " expand Vim % key

"------------------------------------------
" command completion
"------------------------------------------
set wildmenu " completion of command
set history=100 " memory number of command

"------------------------------------------
" no backup
"------------------------------------------
set nobackup

"------------------------------------------
" swapfile setting
"------------------------------------------
set directory=~/.vim/swp

"------------------------------------------
" enable mouse
"------------------------------------------
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

"------------------------------------------
" paste setting
"------------------------------------------
set clipboard=unnamed " use OS clipboard for copy(yank)
" no indent when paste from clipboard
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"------------------------------------------
" key mapping
"------------------------------------------
nnoremap <CR> o<ESC>  " start new line with return key
nnoremap <Leader>wh <C-w>h  " move window to left
nnoremap <Leader>wj <C-w>j  " move window to down
nnoremap <Leader>wk <C-w>k  " move window to up
nnoremap <Leader>wl <C-w>l  " move window to right
nnoremap Y y$  " yank from cursor position
nnoremap <C-h> :<C-u>help<Leader>
nnoremap <C-h><C-h> :<C-u>help<Leader><C-r><C-w>

"------------------------------------------
" change vim default setting
"------------------------------------------
let g:tex_conceal=''

"------------------------------------------
" HTML 5 tags
"------------------------------------------
syn keyword htmlTagName contained article aside audio bb canvas command
syn keyword htmlTagName contained datalist details dialog embed figure
syn keyword htmlTagName contained header hgroup keygen mark meter nav output
syn keyword htmlTagName contained progress time ruby rt rp section time
syn keyword htmlTagName contained source figcaption
syn keyword htmlArg contained autofocus autocomplete placeholder min max
syn keyword htmlArg contained contenteditable contextmenu draggable hidden
syn keyword htmlArg contained itemprop list sandbox subject spellcheck
syn keyword htmlArg contained novalidate seamless pattern formtarget
syn keyword htmlArg contained formaction formenctype formmethod
syn keyword htmlArg contained sizes scoped async reversed sandbox srcdoc
syn keyword htmlArg contained hidden role
syn match   htmlArg "\<\(aria-[\-a-zA-Z0-9_]\+\)=" contained
syn match   htmlArg contained "\s*data-[-a-zA-Z0-9_]\+"

"------------------------------------------
" filetype setting
"------------------------------------------
au InitAutoCmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx

"------------------------------------------
" custom functions
"------------------------------------------

" get syntax info under cursor
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()
