" plugins
filetype off                  " required
filetype plugin on          

set rtp+=/usr/share/doc/fzf/examples

"general settings
set encoding=utf-8
set hidden
set confirm
set noerrorbells
syntax on
nnoremap <space> <nop>
let mapleader=" "
set autoindent
set background=dark
set tabstop=2
set shiftwidth=2
set dir=/tmp/
set relativenumber
set number
set ignorecase
set cursorline
set smartcase
set smartindent
set cindent
set nowrap
set spell spelllang=en_us
set clipboard^=unnamed,unnamedplus
set incsearch
set hlsearch
set laststatus=2
set wildmenu
set wildignorecase
set formatoptions-=o
set formatoptions-=q
set formatoptions-=l
packadd! matchit " turn on find matching bracket
set timeoutlen=1000 ttimeoutlen=0
set showcmd
set mouse=a
filetype plugin indent on

" status-line
set statusline=
set statusline+=%#cursorlinenr#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#cursorlinenr#
set statusline+=\ %f
set statusline+=%= "right side settings
set statusline+=%#search#
set statusline+=\ %l/%l
set statusline+=\ [%c]

" key-bindings
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap H 0
nnoremap L $
nnoremap J 20j
vnoremap J 20j
nnoremap K 20k
vnoremap K 20k
nnoremap cs :noh<cr>
nnoremap <leader>sp z=
nnoremap ]q :cnext<cr>
nnoremap [q :cprev<cr>
nnoremap * *n
xnoremap t "*y
nnoremap tt V"*y

nnoremap <leader>l <c-w>l
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>rw :Sex<cr>
nmap <leader>f :FZF<cr>
nmap <leader>r :rg<cr>
nmap <leader>vv :e ~/.vimrc<cr>
xnoremap <tab> >gv
xnoremap <s-tab> <gv

nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>n :cn<cr>
nnoremap <leader>p :cp<cr>
nnoremap <leader>bl :ls<cr>:b<space>
nnoremap <leader>w :w<cr>
nnoremap <leader><enter> :goyo<cr>

inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<cr> {<cr>}<esc>O
inoremap {;<cr> {<cr>};<esc>O
inoremap [<cr> [<cr>]<esc>O
inoremap [;<cr> [<cr>];<esc>O
inoremap (<cr> (<cr>)<esc>O
inoremap (;<cr> (<cr>);<esc>O
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<right>" : ")"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<right>" : "}"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<right>" : "]"
inoremap <NUL> <C-[>
"inoremap </ </<c-x><c-o>

" abbreviations
au bufnewfile,bufread *.etl set filetype=sql
au bufnewfile,bufread *.htm set filetype=html
autocmd filetype sql,html iabbrev <buffer> create CREATE
autocmd filetype sql,html iabbrev <buffer> alter ALTER
autocmd filetype sql,html iabbrev <buffer> where WHERE
autocmd filetype sql,html iabbrev <buffer> and AND
autocmd filetype sql,html iabbrev <buffer> add ADD
autocmd filetype sql,html iabbrev <buffer> select SELECT
autocmd filetype sql,html iabbrev <buffer> from FROM
autocmd filetype sql,html iabbrev <buffer> delete DELETE
autocmd filetype sql,html iabbrev <buffer> update UPDATE
autocmd filetype sql,html iabbrev <buffer> column COLUMN
autocmd filetype sql,html iabbrev <buffer> integer INTEGER
autocmd filetype sql,html iabbrev <buffer> varchar VARCHAR
autocmd filetype sql,html iabbrev <buffer> cascade CASCADE
autocmd filetype sql,html iabbrev <buffer> split_part SPLIT_PART
autocmd filetype sql,html iabbrev <buffer> insert INSERT
autocmd filetype sql,html iabbrev <buffer> into INTO
autocmd filetype sql,html iabbrev <buffer> copy COPY
autocmd filetype sql,html iabbrev <buffer> ilike ILIKE
autocmd filetype sql,html iabbrev <buffer> distinct DISTINCT
autocmd filetype sql,html iabbrev <buffer> null NULL
autocmd filetype sql,html iabbrev <buffer> drop DROP
autocmd filetype sql,html iabbrev <buffer> count COUNT
autocmd filetype sql,html iabbrev <buffer> count( COUNT(
autocmd filetype sql,html iabbrev <buffer> values VALUES
autocmd filetype sql,html iabbrev <buffer> order ORDER
autocmd filetype sql,html iabbrev <buffer> by BY
autocmd filetype sql,html iabbrev <buffer> left LEFT
autocmd filetype sql,html iabbrev <buffer> outer OUTER
autocmd filetype sql,html iabbrev <buffer> join JOIN
autocmd filetype sql,html iabbrev <buffer> on ON
autocmd filetype sql,html iabbrev <buffer> union UNION
autocmd filetype sql iabbrev <buffer> table TABLE
autocmd filetype sql iabbrev <buffer> if IF
autocmd filetype sql iabbrev <buffer> exists EXISTS
autocmd filetype sql iabbrev <buffer> set SET
autocmd filetype sql iabbrev <buffer> default DEFAULT

augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap
augroup END

" functions
" vimgrep magic
vnoremap vim y:execute 'vimgrep /\V' . substitute(escape(@@, '/\'),"\n",'\\n','ge') . '/ %:h/**/*'

" run javascript file and get output in the terminal
autocmd filetype javascript nnoremap <leader>t :w<cr> :!clear; /usr/local/bin/node %<cr>
"autocmd filetype java nnoremap <leader>t :w<cr> :!clear; javac %; java substitute(%, ".java", "") <cr>

" auto-delete pairs
let g:couples = ['(#)', '[#]', '{#}', '<#>', '<div>#</div>', '<var>#</var>', '<arg>#</arg>']
function Betterbs()
	for l:couple in g:couples
		if ! (l:couple =~ '#')
			continue
		endif
		let l:regex = substitute(escape(l:couple, '/\^$*.[~'), '#', '\\%#', '')
		if search(l:regex, 'n')
			let l:out = repeat("\<bs>", len(matchstr(l:couple, '^.\{-}\ze#')))
			let l:out .= repeat("\<del>", len(matchstr(l:couple, '#\zs.\{-}$')))
			return l:out
		endif
	endfor
	return "\<bs>"
endfunction
inoremap <silent> <bs> <c-r>=Betterbs()<cr>

"Use TAB to complete when typing words, else inserts TABs as usual.
""Uses dictionary and source files to find matching words to complete.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"


" auto enter and exit paste mode
let &t_si .= "\<esc>[?2004h"
let &t_ei .= "\<esc>[?2004l"

inoremap <special> <expr> <esc>[200~ Xtermpastebegin()

function! Xtermpastebegin()
  set pastetoggle=<esc>[201~
  set paste
  return ""
endfunction

"color settings
colorscheme gruvbox

hi! normal ctermbg=NONE guibg=NONE 
hi! nontext ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 

