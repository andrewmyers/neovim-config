call plug#begin(stdpath('data') . '/plugged')

" Language Client
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \  'coc-tsserver',
      \  'coc-powershell',
      \  'coc-phpls',
      \  'coc-json',
      \  'coc-html',
      \  'coc-css',
      \]

" TypeScript Highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" GraphQL Syntax
Plug 'jparise/vim-graphql'


" File Explorer with Icons
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'		          " Enhance directory browser
Plug 'ctrlpvim/ctrlp.vim'		          " Find file with ctrl p
Plug 'tpope/vim-surround' 		        " Surround Plugin: Change Surrounding text
Plug 'StanAngeloff/php.vim'		        " PHP Syntax
Plug 'pangloss/vim-javascript'        " Javascript Syntax
Plug 'leafgarland/typescript-vim'     " Typescript Syntax
Plug 'MaxMEllon/vim-jsx-pretty'       " Javascript jsx formatting
Plug 'peitalin/vim-jsx-typescript'    " Typescript tsx formatting
Plug 'tpope/vim-commentary'           " Comments (gc)
Plug 'christoomey/vim-sort-motion'    " Sort using text objects and motions (gs)

" Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Theme
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


call plug#end()
