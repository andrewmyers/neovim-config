"{{{ Source
let initPath= stdpath('config') . '/init.vim'
let pluginsPath=stdpath('config') . '/plugins.vim'
let conquerOfCompletionPath=stdpath('config') . '/coc.vim'
let markdownPreviewPath = stdpath('config') . '/markdown-preview.vim'

" Load the plugins and conquer of completion
exec "source " . pluginsPath
exec "source " . conquerOfCompletionPath
exec "source " . markdownPreviewPath

augroup autosourcing
    autocmd!
    autocmd BufWritePost ~/.config/nvim/init.vim source %
augroup END
"}}}

"{{{ Settings
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

"{{{ Tabs
set tabstop=2                                   " Width of the tab key
set shiftwidth=2                                " Number of spaces for tabs in normal mode
set expandtab                                   " Use spaces instead of tabs
set softtabstop=2                               " Number of spaces per tab in insert mode
set autoindent
"}}}

"{{{ Disable backups
set backupcopy=no
set nobackup
set nowritebackup
"}}}

set complete=.,w,b,u   			                    " Autocomplete setting
"}}}

"{{{ Visuals
set t_CO=256							        " Use 256 colors. This is useful for Terminal Vim.
set termguicolors                 " enable true colors support
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
"}}}

"{{{ Neovide
set guifont=SourceCodePro\ Nerd\ Font:h16
set mouse=a
let g:neovide_fullscreen=v:true
let g:neovide_cursor_antialiasing=v:true
"}}}

"{{{ Search
set hlsearch					    	        "Highlight all matched terms.
set incsearch							          "Incrementally highlight, as we type.
"}}}

"{{{ Split Management
set splitbelow 						        	"Make splits default to below...
set splitright							        "And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
"}}}

"{{{ Terminal
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
"}}}

"{{{ Mappings
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :exec 'edit ' .initPath<cr>
nmap <Leader>ep :exec 'edit ' .pluginsPath<cr>
nmap <Leader>ec :exec 'edit ' .conquerOfCompletionPath<cr>
nmap <Leader>em :exec 'edit ' .markdownPreviewPath<cr>

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

" Escape with jj
imap jj <Esc>

" Rename
nmap <leader>rn <Plug>(coc-rename)

" Copy file path
nmap <leader>cp :let @+ = expand("%")<cr>

"}}}

"{{{ Plugins

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|music'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'


"/
"/ Airline
"/
let g:airline#extensions#tabline#enabled = 1


"/
"/ Netrw - built in
"/
let g:netrw_banner = 0          " enable/disable banner
let g:netrw_liststyle = 3       " expand directorories instead of opening in a new tab
let g:netrw_browse_split = 4    " open in previous window to the right
let g:netrw_altv = 1          
let g:netrw_winsize = 15        " set the width of the window

" open with space n
nmap <Leader>n :Lexplore<cr>

"}}}

"{{{ Folding
 augroup folds
   autocmd FileType vim setlocal foldmethod=marker
 augroup END
"}}}
