let initPath= stdpath('config') . '/init.vim'
let pluginsPath=stdpath('config') . '/plugins.vim'
let conquerOfCompletionPath=stdpath('config') . '/coc.vim'

" Load the plugins and conquer of completion
exec "source " . pluginsPath
exec "source " . conquerOfCompletionPath


set clipboard+=unnamedplus                      " Use the system clipboard

syntax enable
filetype plugin on                              " Enable filetype plugins
set encoding=UTF-8                              " Text encoding
set backspace=indent,eol,start                  " Make backspace behave like every other editor.
let mapleader = ' ' 		        	            	" The default is \, but a comma is much better.
set nonumber							                      " line numbers.
set ttyfast 					    	                    " Send more characters in fast terminals
set nowrap							                        " Don't wrap long lins
set noerrorbells visualbell t_vb=               " No bells
set autowriteall 		                            " Automaticall write the buffer when switching files

" Tabs
set tabstop=2                                   " Width of the tab key
set shiftwidth=2                                " Number of spaces for tabs in normal mode
set expandtab                                   " Use spaces instead of tabs
set softtabstop=2                               " Number of spaces per tab in insert mode
set autoindent

" Disable backups
set backupcopy=no
set nobackup
set nowritebackup

set complete=.,w,b,u   			                    " Autocomplete setting




"-------------Visuals--------------"
set t_CO=256							        " Use 256 colors. This is useful for Terminal Vim.
set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme ayu
let g:airline_theme='papercolor'




"-------------Search--------------"
set hlsearch					    	        "Highlight all matched terms.
set incsearch							          "Incrementally highlight, as we type.




"-------------Split Management--------------"
set splitbelow 						        	"Make splits default to below...
set splitright							        "And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>



"-------------Terminal--------------"
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
"au BufEnter * if &buftype == 'terminal' | :startinsert | endif
"
" open terminal on ctrl+n
function! OpenTerminal()
    split term://pwsh
    resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l



"-------------Mappings--------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :exec 'edit ' .initPath<cr>
nmap <Leader>ep :exec 'edit ' .pluginsPath<cr>
nmap <Leader>ec :exec 'edit ' .conquerOfCompletionPath<cr>

" paste the previous yank
nmap <Leader>k "2p
nmap <Leader>K "2P

" Formatting
nmap <Leader>p :Prettier<cr>

" Buffers
nmap <Leader>bp :bp<cr>
nmap <Leader>bn :bn<cr>
nmap <Leader>bd :bd<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle.
nmap <Leader>n :NERDTreeToggle<cr>
nmap <Leader>nr :NERDTree %<cr>

nmap <C-r> :CtrlPBufTag<cr>
nmap <C-m> :CtrlPMRUFiles<cr>

" Escape with jj
imap jj <Esc>

"-------------Plugins--------------"

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|music'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

"/
"/ NERDCommenter
"/
let g:NERDSpaceDelims = 1                   " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1               " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'             " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1                " Set a language to use its alternate delimiters by default
let g:NERDCommentEmptyLines = 1             " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1        " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1           " Enable NERDCommenterToggle to check all selected lines is commented or not

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

"/
"/ Airline
"/
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'


"/
"/ Netrw - built in
"/
let g:netrw_liststyle=3         " tree view


"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.

augroup autosourcing
    autocmd!
    autocmd BufWritePost ~/.config/nvim/init.vim source %
augroup END




"-------------Folds--------------"
augroup folds
  autocmd BufWinEnter * silent! :%foldopen!
  autocmd FileType javascript setlocal foldmethod=expr
  autocmd FileType javascript setlocal foldexpr=JSFolds()
augroup END


function! JSFolds()
  let thisline = getline(v:lnum)
  if thisline =~? '\v^\s*$'
    return '-1'
  endif

  if thisline =~ '^import.*$'
    return 1
  else
    return indent(v:lnum) / &shiftwidth
  endif
endfunction
