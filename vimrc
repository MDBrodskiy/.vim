execute pathogen#infect()
filetype plugin indent on
syntax on
set nocompatible
set tabstop=4
set shiftwidth=4
set expandtab ts=4 sw=4 sts=4
set number
set hlsearch
set incsearch
set mouse=a
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" ignore ex mode
map q: <Nop>
nnoremap Q <nop>

" auto complete in insert mode using ctrl+n
autocmd Filetype html set omnifunc=htmlcomplete#CompleteTags
autocmd Filetype javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd Filetype css set omnifunc=csscomplete#CompleteCSS

" Set to PDF_LaTeX from Plain_TeX default
let g:tex_flavor='latex'

" Matchit - highlights pairs
let g:hl_matchit_enable_on_vim_startup = 1

" Lightline status bar on the bottom 
set laststatus=2

if !has('gui_running')
    set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" NERDTree mapping
map <C-n> :NERDTreeToggle<CR>
"map <F2> :NERDTreeToggle<CR>

" mapping to emulate 'system clipboard' shortcuts
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
nnoremap <C-a> ggVG

" jshint2
set runtimepath+=~/.vim/bundle/jshint2.vim/

" jshint validation
 nnoremap <silent><F1> :JSHint<CR>
 inoremap <silent><F1> <C-O>:JSHint<CR>
 vnoremap <silent><F1> :JSHint<CR>

" show next jshint error
 nnoremap <silent><F2> :lnext<CR>
 inoremap <silent><F2> <C-O>:lnext<CR>
 vnoremap <silent><F2> :lnext<CR>

" show previous jshint error
 nnoremap <silent><F3> :lprevious<CR>
 inoremap <silent><F3> <C-O>:lprevious<CR>
 vnoremap <silent><F3> :lprevious<CR>

 " css color
 "let g:cssColorVimDoNotMessMyUpdatetime = 1

 " Beautify
 autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
 " for json
 autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
 " for jsx
 autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
 " for html
 autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
 " for css or scss
 autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" C++11 for syntastic
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 '

autocmd BufNewFile,BufRead *.nc   set syntax=c

set visualbell t_vb=
if has("autocmd") && has("gui")  
    au GUIEnter * set t_vb= 
endif

function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

set spell spelllang=en_us
set dictionary="/usr/share/dict/words"
