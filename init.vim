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
set tabstop=4                                   " Width of the tab key
set shiftwidth=4                                " Number of spaces for tabs in normal mode
set expandtab                                   " Use spaces instead of tabs
set softtabstop=4                               " Number of spaces per tab in insert mode
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

"{{{ Commands

" Close all other buffers
command! BufOnly silent! execute "%bd\|e#\|bd#"

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
let g:netrw_liststyle = 3       " expand directories instead of opening in a new tab
let g:netrw_browse_split = 4    " open in previous window to the right
let g:netrw_altv = 1          
let g:netrw_winsize = 40        " set the width of the window

" open with space n
nmap <Leader>n :Lexplore<cr>

"/
"/ Nvim Tree
"/
let g:nvim_tree_side = 'left' 
let g:nvim_tree_width = 40 
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_gitignore = 1 
let g:nvim_tree_auto_open = 1 " opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 " closes the tree when it's the last window
let g:nvim_tree_auto_ignore_ft = [] " don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 0 " closes the tree when you open a file
let g:nvim_tree_follow = 1 " this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 " this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 0 " this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 " will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 " will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_tab_open = 1 " will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_auto_resize = 1 " will resize the tree to its saved width when opening a file
let g:nvim_tree_disable_netrw = 0 " disables netrw
let g:nvim_tree_hijack_netrw = 0 " prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_group_empty = 1 " compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_hijack_cursor = 0 "1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
let g:nvim_tree_update_cwd = 1 " will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.

let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
"}}}

"{{{ Folding
 augroup folds
   autocmd FileType vim setlocal foldmethod=marker
 augroup END
"}}}
