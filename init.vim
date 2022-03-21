" Config file from https://www.youtube.com/watch?v=JWReY93Vl6g

:set number
" :set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

" vim-plug in https://github.com/junegunn/vim-plug
" needing curl
" All plugins are under 
" ~/.local/share/nvim/plugged
call plug#begin()

Plug 'http://github.com/tpope/vim-surround'				" Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree'			" NerdTree
Plug 'https://github.com/tpope/vim-commentary'			" For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline'		" Status bar
" Plug 'https://github.com/lifepillar/pgsql.vim'		" PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color'				" CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
" coc needs:
" sudo apt install nodejs
" sudo apt install npm
" 
" if plugged is not under the same directory as init.vim
" switch to ~/.local/share/nvim/plugged/coc.nvim
" 
" sudo npm install -g yarn
" yarn install
" yarn build
" 
" if the version of node is too low
" 1. install nvm and check node version
" touch ~/.bash_profile
" curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
" source ~/.nvm/nvm.sh
" nvm --version
" 2. update node to specific version
" nvm install <version>  # Example: nvm install 12.14.1
"
" install ccls for coc
" https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/
Plug 'https://github.com/neoclide/coc.nvim', {'do': { -> coc#util#install()}}				" Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons'		" Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal'			" Vim Terminal
" tagbar needs: sudo apt install exubrant-ctags
Plug 'https://github.com/preservim/tagbar'				" Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors'	" CTRL + N for multiple cursors

set encoding=UTF-8

call plug#end()

" NERDTree config
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Tagbar config
nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme jellybeans

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" coc config

