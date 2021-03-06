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

" Font for gVim
set guifont=Hack\ Nerd\ Font\ Bold\ 11
"set guifont=SauceCodePro\ Nerd\ Font\ Mono\ 11
"set guifont=SauceCodePro\ Nerd\ Font\ Bold\ 11

" ignore ex mode
map q: <Nop>
nnoremap Q <nop>

" auto complete in insert mode using ctrl+n
autocmd Filetype html set omnifunc=htmlcomplete#CompleteTags
autocmd Filetype javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd Filetype css set omnifunc=csscomplete#CompleteCSS

" Set to PDF_LaTeX from Plain_TeX default
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'zathura'    

" Matchit - highlights pairs
let g:hl_matchit_enable_on_vim_startup = 1

" Lightline status bar on the bottom 
set laststatus=2

if !has('gui_running')
    set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" DevIcons & AirLine extensions
let g:WebDevIconsOS = 'GNU'
let g:airline_theme='wombat' "letg:airline_theme = 'random'
let g:WebDevIcons_enable = 1
let g:airline_section_y = ''
let g:airline_detect_spell = 0
let g:airline_section_error = 0
let g:airline_powerline_fonts = 1
let g:airline_section_warning = 0
let g:airline_skip_empty_sections = 0
let g:airline_stl_path_style = 'short'
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
let g:airline_section_b = '' " '%-0.10{getcwd()}'
let g:airline_section_c = '%t' " '%-0.10{getcwd()}' 
let g:WebDevIconsUnicodeGlpyhDoubleWidth= 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#wordcount#enabled = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#clock#updatetime = 1000
let g:airline#extensions#clock#format = '%H:%M:%S'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
"let g:airline#extensions#wordcount#formatter#default#fmt = '%d☷'
let g:airline#extensions#wordcount#formatter#default#fmt = '%d'
let g:airline#extensions#wordcount#filetypes = '\vasciidoc|help|mail|markdown|markdown.pandoc|org|rst|tex|text'
let g:airline_section_z = '%p%#__accent_bold#%%%{g:airline_symbols.linenr}%{g:airline_symbols.maxlinenr}%l%#__accent_bold#/%L%#__restore__#:%#__accent_bold#%v%#__restore__#' 

" NERDTree mapping
map <C-n> :NERDTreeToggle<CR>
"map <F2> :NERDTreeToggle<CR>

let g:ranger_terminal = 'urxvt -e'
map <leader>e :RangerEdit<cr>

" mapping to emulate 'system clipboard' shortcuts
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
nnoremap <C-a> ggVG

" mapping to emulate 'Ctrl-Backspace' to delete previous word in insert mode'
imap <C-H> <C-W>
imap <C-BS> <C-W>
"imap <C-BS> db

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
 " for java
 autocmd FileType java nnoremap <buffer> <c-f> :w <cr> :exec '!javac' shellescape(expand('%'), 1) '&& java' shellescape(expand('%:r'), 1) <cr>
 " for python
 autocmd FileType python nnoremap <buffer> <c-f> :w <cr> :exec '!python' shellescape(expand('%'), 1) <cr>
 " for octave
 autocmd FileType matlab nnoremap <buffer> <c-f> :w <cr> :exec '!octave' shellescape(expand('%'), 1) <cr>
 " for TeX
 autocmd FileType tex nnoremap <buffer> <c-f> :w <cr> :call Tex_CompileLatex() <cr><cr> :call Tex_ViewLaTeX() <cr>
 autocmd FileType tex nnoremap <buffer> <c-t> :w <cr> :call Tex_CompileLatex() <cr><cr>

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

function! ResCur()
    if line("'\"")<=line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

if has("folding")
    function! UnfoldCur()
        if !&foldenable
            return
        endif
        let cl = line(".")
        if cl <= 1
            return
        endif
        let cf = foldlevel(cl)
        let uf = foldlevel(cl - 1)
        let min = (cf > uf ? uf : cf)
        if min
            execute "normal!" min . "zo"
            return 1
        endif
    endfunction
endif

augroup resCur
    autocmd!
    if has("folding")
        autocmd BufWinEnter * if ResCur() | call UnfoldCur() | endif
    else
        autocmd BufWinEnter * call ResCur()
    endif
augroup END

set encoding=utf8

set spell spelllang=en_us,ru
set dictionary="/usr/share/dict/words"
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

