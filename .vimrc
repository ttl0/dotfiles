" not compatible with vi
call pathogen#infect()
syn enable

set nocompatible 

let s:cpo_save=&cpo

set cpo&vim

" some default map!s

map! <xHome> <Home>
map! <xEnd> <End>
map! <S-xF4> <S-F4>
map! <S-xF3> <S-F3>
map! <S-xF2> <S-F2>
map! <S-xF1> <S-F1>
map! <xF4> <F4>
map! <xF3> <F3>
map! <xF2> <F2>
map! <xF1> <F1>

" and some default nmaps for html
" gracefully copied from somewhere

nmap ,hx wbF<df>f<df>
nmap ,ht wbi<tt>ea</tt>bb
nmap ,hs wbi<strong>ea</strong>bb
nmap ,hu wbi<u>ea</i>bb
nmap ,hi wbi<i>ea</i>bb
nmap ,he wbi<em>ea</em>bb
nmap ,hb wbi<b>ea</b>bb
nmap ,h6 _i<h6>A</h6>
nmap ,h5 _i<h5>A</h5>
nmap ,h4 _i<h4>A</h4>
nmap ,h3 _i<h3>A</h3>
nmap ,h2 _i<h2>A</h2>
nmap ,h1 _i<h1>A</h1>
nmap ,mh wbgueyei<ea></pa>bba

" dunno
let &cpo=s:cpo_save
unlet s:cpo_save

set fileencodings=utf-8,latin1
" dont remember too much
set history=50
" no incremental search, but do highlight matches
set hlsearch
" show cursor
set ruler
" dunno, not critical anywy
set viminfo='20,\"50


" refresh the file 
map <F1> :e! <enter>

" show line numbers
se nu
" yep
" set backspace=4
" that's how much a tab/indent takes
se shiftwidth=4
" actually, _that_'s how much a tab takes
se tabstop=4
" expand tabs into spaces for compatibility
se expandtab
" when to wrap. 
se textwidth=79
" set showmatch, show matching braces/parens
se showmatch

"
" tab stuff
"
function! TabNext()
    exe "tabnext"
endfunction

map ''  <Esc>:tabn<CR>
map ;; <Esc>:tabp<CR>
map <S-Space> <Esc>:tabn<CR>
map <C-S-Space> <Esc>:tabp<CR>
map <S-M-1> <esc>1gt
map <S-M-2> <esc>2gt
map <S-M-3> <esc>3gt

"
" color stuff
"
set background=dark
" default colorscheme
colorscheme darkblue
" show syntax highlighting
syn on

" function to switch between two colorschemes
" evening works better with dark displays, zellner, vice versa
function! SwitchColorSchemes()
    if g:colors_name == "zellner"
        execute "colorscheme" "evening"
    elseif g:colors_name == "evening"
        execute "colorscheme" "darkblue"
    elseif g:colors_name == "darkblue"
        execute "colorscheme" "zenburn"
    elseif g:colors_name == "zenburn"
        execute "colorscheme" "xterm16"
    elseif g:colors_name == "xterm16"
        execute "colorscheme" "oceandeep"
    else
        execut "colorscheme" "zellner"
    endif
endfunction

" function to toggle mouse on/off
function! ToggleMouse()
    if &mouse == "a"
        exe "set mouse="
        echo "Mouse is off"
    else
        exe "set mouse=a"
        echo "Mouse is on"
    endif
endfunction
" set it to off first (default)
"set mouse=
" map it to a call
"map <C-m> :call ToggleMouse()<Enter>


" unless i ask for it, i want cindent (parens, curlies, etc.)
set cindent
se cinoptions=t0
" yep
set smartindent
" detect filetype and indent accordingly
filetype on
filetype plugin indent on

" abbreviations; i hardly use these anymore
abbr #i #include
abbr #d #define
" no incremental search, i toldya
se noincsearch


" finally, some homage to vimrc itself
" from http://www.oreillynet.com/onlamp/blog/2006/08/make_your_vimrc_trivial_to_upd_1.html
" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)

map ,v :vsp ~/.vimrc<CR><C-W>_
map <silent> ,V :source /home/avr/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

let xterm16_colormap	= 'soft'
let xterm16_brightness	= 'high'


" SVN stuff

nnoremap \diff :silent call <SID>SVNDiff()<Enter>
function! s:SVNDiff()
  new
  setlocal buftype=nofile
  r ! svn diff #
  1 delete
  filetype detect
endfunction

nnoremap \ci :!svn commit <Enter>
nnoremap \up :!svn update <Enter> :tabdo e! <Enter>

" dont cindent when we're using tex/txt files; gets painful
autocmd BufNewFile,BufRead *.txt,*.tex setl nocindent | setl nosi
" autocmd BufNewFile,BufRead *.tex :source ~/.vimrc.tex
autocmd BufRead,BufNewFile * if &ft == 'mail' | set nocindent


" python shit
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class
autocmd FileType python setl autoindent tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType make setl noexpandtab


noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

