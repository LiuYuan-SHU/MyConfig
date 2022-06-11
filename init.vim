" ===============================================================
" /							Notes								/
" ===============================================================
" /	1.	/ Path of config file:									/
" /		/	1.1	Windows: C:\Users\<User Name>\AppData\Local\nvim/
" /		/	1.2	Ubuntu: ~/.config/nvim							/
" /	2.	/ Steps to install plugins:								/
" /		/	2.1	Install curl									/
" /		/	2.2 Install vim-plug: github.com/junegunn/vim-plug	/ 
" /		/	2.3 :PlugInstall									/
" /		/	2.4 Config plugins									/
" ===============================================================

" Config file from https://www.youtube.com/watch?v=JWReY93Vl6g

" hotkey config
nmap J 6j
nmap K 6k
nmap H ^
nmap L $
imap jk <Esc>
imap <C-s> <Esc>:w<CR>
nmap <C-s> :w<CR>
imap <C-z> <Esc>ui
nmap <C-z> u
imap <C-y> <Esc><C-r>
nmap <C-y> <C-r>

let mapleader = ","
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

"  vim config
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

Plug 'jiangmiao/auto-pairs'								" Swallow brackets
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
" C:\User\<User Name>\AppData\Local\nvim-data\plugged\coc.nvim for Windows
" 
" sudo npm install -g yarn
" yarn install				" If you are in windows, you might to run set-executionpolicy remotesigned as admin
" yarn build
" ========================================
" if the version of node is too low
" ========================================
" 1. install nvm and check node version
" touch ~/.bash_profile
" curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
" source ~/.nvm/nvm.sh
" nvm --version
" 2. update node to specific version
" nvm install <version>  # Example: nvm install 16.0.0
" ========================================
" 
" After finished installation, download coc for C:
" 1. :CocInstall coc-clangd
" 2. :CocCommand clangd.install in a cpp file
" 
" install ccls for coc
" https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/
" Plug 'https://github.com/neoclide/coc.nvim'				" Auto Completion
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}	" Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons'		" Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal'			" Vim Terminal
" tagbar needs: sudo apt install exuberant-ctags
Plug 'https://github.com/preservim/tagbar'				" Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors'	" CTRL + N for multiple cursors
" nvim LSP
Plug 'https://github.com/neovim/nvim-lspconfig'			" lsp of neovim
Plug 'https://github.com/godlygeek/tabular' | Plug 'https://github.com/plasticboy/vim-markdown'	" Markdown support
Plug 'https://github.com/iamcco/markdown-preview.nvim', { 'do': 'cd ~/AppData/Local/nvim-data/plugged/markdown-preview.nvim & yarn install' } " Markdown Preview
Plug 'https://github.com/Shirk/vim-gas'					" support for assembly
" Windows Terminal Preview Background Preview
Plug 'https://github.com/xiyaowong/nvim-transparent'	" background plugin

set encoding=UTF-8

call plug#end()

" NERDTree config
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
" Open nerdtree if no file is chosen in command line
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()

" Tagbar config
nnoremap <F8> :TagbarToggle<CR>

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

" MarkdownPreviewToggle
nnoremap <F9> :MarkdownPreviewToggle<CR>

" vim-gas config
let g:gasDisablePreproc = 1		" Globally diasable preprocessor macro detection

" nvim-transparent config
let g:transparent_enabled = v:true		" enable defaultly
nnoremap <F10> :TransparentToggle<CR>

" =======================================
" /			plit window notes			/
" =======================================
" / 1. Splitting Vim Screen Vertically	/
" /		<C-w>v							/
" / 2. Splitting Vim Screen Horizontally/
" /		<C-w>s							/
" / 3. Switch Pane						/
" /		<C-w> h/j/k/l					/
" / 4. Increase Width/Height of pane	/
" /		Width	<C-w><Shift>'>'/'<'		/
" /		Height	<C-w><Shift>'+'/'-'		/
" =======================================
"
" =======================================
"			vim-Markdown keymaps
" =======================================
" The following commands are useful to open and close folds:
" 
" zr: reduces fold level throughout the buffer
" zR: opens all folds
" zm: increases fold level throughout the buffer
" zM: folds everything all the way
" za: open a fold your cursor is on
" zA: open a fold your cursor is on recursively
" zc: close a fold your cursor is on
" zC: close a fold your cursor is on recursively
