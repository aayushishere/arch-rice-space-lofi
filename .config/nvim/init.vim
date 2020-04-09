"   _   _ ________  _________  _____
"  | | | |_   _|  \/  || ___ \/  __ \
"  | | | | | | | .  . || |_/ /| /  \/
"  | | | | | | | |\/| ||    / | |
"  \ \_/ /_| |_| |  | || |\ \ | \__/\
" (_)___/ \___/\_|  |_/\_| \_| \____/


" % TO DO % "
" 1. setup auto complete for * and _ in markdown
" 2. setup coc.vim
" 3. spell check shortcut

let mapleader = ";"

" PLUGINS

call plug#begin('~/.config/nvim/plugged')

" plugins
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'

" colorschemes
Plug 'dylanaraps/wal.vim'
Plug 'morhetz/gruvbox'
Plug 'icymind/NeoSolarized'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'drewtempelmeyer/palenight.vim'

call plug#end()

" use system clipboard
set clipboard=unnamed
set clipboard+=unnamedplus

" set wordwrapping
"set wrap linebreak nolist
"set wrapmargin=79
"set textwidth=79
"set formatoptions=tjncroql

" set working dir to current file
set autochdir

" enable mouse
set mouse=a

" python issues fixer (macos)
""let g:python_host_prog='/Users/kevinnel/.pyenv/versions/neovim2/bin/python'
""let g:python3_host_prog='/Users/kevinnel/.pyenv/versions/neovim4/bin/python'

" windows
""let g:python_host_prog='C:\Python27\'
""let g:python3_host_prog='C:\Users\Kevin Nel\AppData\Local\Programs\Python\Python37\'

" linux
let g:python_host_prog='/usr/bin/python2.7'
let g:python3_host_prog='/usr/bin/python3.6'

" tree file viewer
let g:netrw_liststyle=3
noremap <leader>e :Vexplore<CR>

" GENERAL

" enable syntax processing and add colorscheme
"" enable true color
"
" if (empty($TMUX))
"         if(has("nvim"))
"                 let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"         endif
"         if (has("termguicolors"))
"                 set termguicolors
"         endif
" endif

syntax enable
colorscheme wal
set background=dark

" fix non transparent background
highlight Normal ctermbg=NONE


" lightline
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'wal',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }

"let g:airline_theme='dracula'
"let g:airline_powerline_fonts = 0

" VIMr
if has('gui_vimr') || has('gui_enabled')
    syntax enable
    colorscheme gruvbox
    set background=dark
    let g:airline_theme='gruvbox'
endif

" make sure filetype is detected
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.bib set filetype=tex
autocmd BufRead,BufNewFile *.bbl set filetype=tex
autocmd BufRead,BufNewFile *.mdown set filetype=markdown
autocmd BufRead,BufNewFile *.markdown set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown
autocmd BufRead,BufNewFile *.txt set filetype=markdown

" remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" enable line numbering
set number relativenumber

" basic stuff
filetype plugin on
set encoding=utf-8
set nocompatible

" open horizontal pane to edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" tabs and spaces
set tabstop=4 softtabstop=0  shiftwidth=4 smarttab
autocmd Filetype python set expandtab
" ui
set showcmd
filetype indent on

" omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
inoremap <leader><Tab> <C-p>
set complete+=k
set completeopt=menuone,preview,longest

" highlight matching parentheses
set showmatch

" REMAPS
" disable arrow keys and backspace in insert mode
"inoremap <up> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"inoremap <down> <nop>
"
"nnoremap <up> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"nnoremap <down> <nop>

" beginning and end
nnoremap B ^
nnoremap E $
vnoremap B ^
vnoremap E $

" autoclosing brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" markdown formatting
autocmd filetype markdown inoremap * **<left>
autocmd filetype markdown inoremap _ __<left>

" spellchecking for text documents
autocmd filetype markdown,tex,latex set spell

" Autocomplete
set wildmode=longest,list,full

" Navigating with guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" swithing panes
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" CONFIG

" SHORTCUTS
" toggle goyo
noremap <leader>g :Goyo<CR>

" easy align
" Start interactive EasyAlign in visual mode
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object
nmap ga <Plug>(EasyAlign)

" ale fix
noremap <leader>f :ALEFix<CR>
" ale completion
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['pep8'],
\   'html' : ['prettier'],
\   'css' : ['prettier'],
\}
let g:ale_lint_on_insert_leave=1

" emmet
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_complete_tag=1

" COMPILE SCRIPTS
" livereload notes tufte css
" autocmd filetype markdown noremap <leader>c :w <bar> :!pandoc % --mathjax --toc --css  "https://cdnjs.cloudflare.com/ajax/libs/tufte-css/1.4/tufte.min.css" -s -o %:r.html<CR>
" autocmd filetype markdown noremap <leader>p :w <bar> :!pandoc % --mathjax --toc --css "https://cdnjs.cloudflare.com/ajax/libs/tufte-css/1.4/tufte.min.css" -s -o %:r.html<CR> <bar> :!firefox %:r.html <CR>


" coc.nvim

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" LaTeX
autocmd filetype tex,latex noremap <leader>c :w <bar> :!latexmk % <CR>
autocmd filetype tex,latex noremap <leader>p :w <bar> :!latexmk % -pvc <CR> <bar> :!zathura %:r.pdf<CR>

" snippets
" markdown
autocmd Filetype markdown inoremap <leader>i	![<++>](<++>)
autocmd Filetype markdown inoremap <leader>l	[<++>](<++>)
autocmd Filetype markdown inoremap <leader>c	```<++><ESC>o<++><ESC>o```
" Latex
" math
autocmd Filetype tex,latex,markdown inoremap ;frac      \frac{<++>}{<++>}
autocmd Filetype tex,latex,markdown inoremap ;int       \int_{<++>}^{<++>}
autocmd Filetype tex,latex,markdown inoremap ;sum       \sum_{<++>}^{<++>}
autocmd Filetype tex,latex,markdown  inoremap $ $$<left>

" formatting
autocmd Filetype tex,latex  inoremap ;doc       \documentclass[a4page, 12pt]{article}<Enter><++><Enter>\begin{document}<Enter><++><Enter>\end{document}
autocmd Filetype tex,latex  inoremap ;rep      <ESC>:read ~/.config/nvim/snippets/latex/tuks.tex<CR>
autocmd Filetype tex,latex  inoremap ;sec       \section{<++>}<Enter><Tab>
autocmd Filetype tex,latex  inoremap ;sub       \subsection{<++>}<Enter><Tab>
autocmd Filetype tex,latex  inoremap ;ssub       \subsubsection{<++>}<Enter><Tab>
autocmd Filetype tex,latex  inoremap ;eq        \begin{equation}<Enter><Tab><++><Enter><BS>\label{eq:<++>}<Enter>\end{equation}
autocmd Filetype tex,latex  inoremap ;fig       \begin{figure}[h]<Enter><Tab>\centering<Enter>\includegraphics[width=0.7\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter><BS>\end{figure}
autocmd Filetype tex,latex  inoremap ;pb        \pagebreak<Enter>
autocmd Filetype tex,latex  inoremap ;toc       \tableofcontents<Enter>
autocmd Filetype tex,latex  inoremap ;pkg       \usepackage{<++>}<Enter>
autocmd Filetype tex,latex  inoremap ;er      	\eqref{eq:<++>}<ESC>2b
autocmd Filetype tex,latex  inoremap ;c			\cite{<++>}<ESC>2b


