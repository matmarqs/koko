setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal backspace=indent,eol,start

" functions
inoremap <Leader>v void (<++>) {<CR><++>;<CR>}<CR><++><Esc>3kf(i
inoremap <Leader>d double (<++>) {<CR><++>;<CR>}<CR><++><Esc>3kf(i
inoremap <Leader>I int (<++>) {<CR><++>;<CR>}<CR><++><Esc>3kf(i
inoremap <Leader>m int main(int argc, char *argv[]) {<CR>;<CR>return 0;<CR>}<Esc>2kf;i
inoremap <Leader>c /*  */<Esc>2hi
nnoremap <Leader>c i/*  */<Esc>2hi
" function prototypes
nnoremap çF "fyy/\/\*<Space>DEFINITIONS<CR>"fp$T)C;<Esc>

" Vim indent file
" Language:	C++
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2008 Nov 29

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

" C++ indenting is built-in, thus this is very simple
setlocal cindent

let b:undo_indent = "setl cin<"
