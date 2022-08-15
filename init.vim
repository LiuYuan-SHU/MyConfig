" ===============================================================
" /							Notes								
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
imap <C-s> <Esc>:w<CR>
nmap <C-s> :w<CR>
imap <C-z> <Esc>u
nmap <C-z> u
imap <C-y> <Esc><C-r>
nmap <C-y> <C-r>

let mapleader = ","
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
imap <C-`> ``<Esc>ha
" code block insert
map <C-`> i<C-`>

" adapt to Chinese
nmap ： :
imap · ``<Esc>ha
nmap ， <leader>

"  vim config
:set number
" :set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
" spell languages
" cjk is used for Asian characters
set spelllang=en,cjk
" Show nine spell checking candidates at most
set spellsuggest=best,9
" Activate Spelling checker at the beginging
" set spell!
" inoremap spell <C-g>u<Esc>[s1z=`]a<C-g>u
" ========================================
" Notes for correcting spell errors
" ========================================
" 1. correct an error: <C-x>
" 2. go to previous spell error: [s
" 3. go to next spell error: ]s
" 4. show candidates and choose one: z=
" 5. add an word to dictionary: zg
" ========================================
" vim-plug in https://github.com/junegunn/vim-plug
" needing curl
" All plugins are under 
" ~/.local/share/nvim/plugged on Linux
" C:\User\<User Name>\AppData\Local\nvim-data\plugged for Windows
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
" 1. Install coc packages for different languages:
"	1. :CocInstall coc-clangd
"	2. :CocInstall coc-julia
"	3. :CocInstall coc-python
"	4. :CocInstall coc-vimtex
" 2. :CocCommand clangd.install in a cpp file
" 
" install ccls for coc
" https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/
" Plug 'https://github.com/neoclide/coc.nvim'				" Auto Completion
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}	" Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons'		" Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal'			" Vim Terminal
" tagbar needs: sudo apt install exuberant-ctags on Linux or download it from http://ctags.sourceforge.net/ on Windows
Plug 'https://github.com/preservim/tagbar'				" Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors'	" CTRL + N for multiple cursors
" nvim LSP
Plug 'https://github.com/neovim/nvim-lspconfig'			" lsp of neovim
Plug 'https://github.com/godlygeek/tabular' | Plug 'https://github.com/plasticboy/vim-markdown'	" Markdown support
Plug 'https://github.com/iamcco/markdown-preview.nvim', { 'do': 'cd ~/AppData/Local/nvim-data/plugged/markdown-preview.nvim & yarn install' } " Markdown Preview
Plug 'https://github.com/Shirk/vim-gas'					" support for assembly
" Background Preview
Plug 'https://github.com/xiyaowong/nvim-transparent'	" background plugin

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " so we can type :Files to search the tontents of files

" Better syntax highlighter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" better fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" or                                , { 'branch': '0.1.x' }

" tabline plugin
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Mac Dash for nvim
Plug 'mrjones2014/dash.nvim', { 'do': 'make install' }

" LaTex
Plug 'lervag/vimtex'

" snippets
Plug 'norcalli/snippets.nvim'

" UltiSnips
Plug 'sirver/ultisnips'

" translator
Plug 'voldikss/vim-translator'

" ranger, <leader>f to open
Plug 'francoiscabrol/ranger.vim'

" ranger.vim dependency
Plug 'rbgrouleff/bclose.vim'

call plug#end()

set encoding=UTF-8

" coc config
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" NERDTree config
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
" Open nerdtree if no file is chosen in command line
" function! NerdTreeStartUp()
" if 0 == argc()
"         NERDTree
"     end
" endfunction
" autocmd VimEnter * call NerdTreeStartUp()

" Open ranger if no file is chose in command line
function! RangerStartUp()
	if 0 == argc()
		Ranger
	end
endfunction
autocmd VimEnter * call RangerStartUp()

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
" :CocInstall coc-lua
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

" bar bar configure
" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:false

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" Excludes buffers from the tabline
let bufferline.exclude_ft = ['javascript']
let bufferline.exclude_name = ['package.json']

" Enable/disable icons
" if set to 'buffer_number', will show buffer number in the tabline
" if set to 'numbeer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
" if set to 'buffer_number_with_icon', will show buffer number and icons in the tabline
let bufferline.icons = v:true

" Sets the icon's highlight group.
" If false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = '車'

" If true, new buffers will be inserted at the start/end of the list.
" Default is to insert after current buffer.
let bufferline.insert_at_start = v:false
let bufferline.insert_at_end = v:false

" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 4

" Sets the maximum buffer name length.
let bufferline.maximum_length = 30

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]"
" where X is the buffer number. But only a static string is accepted here.
let bufferline.no_name_title = v:null

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
"

" =======================================
" /              bar bar                /
" =======================================
" Move to previous/next
nnoremap <silent>    tp <Cmd>BufferPrevious<CR>
nnoremap <silent>    tn <Cmd>BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    t< <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    t> <Cmd>BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    t1 <Cmd>BufferGoto 1<CR>
nnoremap <silent>    t2 <Cmd>BufferGoto 2<CR>
nnoremap <silent>    t3 <Cmd>BufferGoto 3<CR>
nnoremap <silent>    t4 <Cmd>BufferGoto 4<CR>
nnoremap <silent>    t5 <Cmd>BufferGoto 5<CR>
nnoremap <silent>    t6 <Cmd>BufferGoto 6<CR>
nnoremap <silent>    t7 <Cmd>BufferGoto 7<CR>
nnoremap <silent>    t8 <Cmd>BufferGoto 8<CR>
nnoremap <silent>    t9 <Cmd>BufferGoto 9<CR>
nnoremap <silent>    t10 <Cmd>BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    tp <Cmd>BufferPin<CR>
" Close buffer
nnoremap <silent>    tq <Cmd>BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout
" Close commands
"                          :BufferCloseAllButCurrent
"                          :BufferCloseAllButPinned
"                          :BufferCloseAllButCurrentOrPinned
"                          :BufferCloseBuffersLeft
"                          :BufferCloseBuffersRight
" Magic buffer-picking mode
nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
" Sort automatically by...
nnoremap <silent> tbn <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> tbd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> tbl <Cmd>BufferOrderByLanguage<CR>
nnoremap <silent> twn <Cmd>BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used

" Telescope
nnoremap fzf <Cmd>Telescope<CR>

" =============================================================================
" =================================  vimtex  ==================================
" =============================================================================
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

let g:tex_flavor='latex'

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" hide code block character
set conceallevel=1
let g:tex_conceal='abdmg'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

" ==============================================
" translator
" ==============================================
let g:translator_history_enable = v:true
let g:translator_window_max_height = 10
let g:translator_default_engines = ['youdao']
