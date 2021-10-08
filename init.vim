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

"{{{ Nvim Tree
lua << EOF
-- following options are the default
require'nvim-tree'.setup {
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = false,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = false,
  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir   = {
    -- enable the feature
    enable = true,
    -- allow to open the tree if it was previously closed
    auto_open = true,
  },
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = true,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = true,
  -- show lsp diagnostics in the signcolumn
  lsp_diagnostics     = false,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = true,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 30,
    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    height = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  }
}
EOF

nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

"}}}

"}}}

"{{{ Folding
 augroup folds
   autocmd FileType vim setlocal foldmethod=marker
 augroup END
"}}}
