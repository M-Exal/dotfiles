call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'https://github.com/jlcrochet/vim-ruby'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'tyru/open-browser.vim' " opens url in browser
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
 
call plug#end()
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
set autoindent
colorscheme gruvbox
set wildmenu
set showcmd
set smarttab
set wrap
set ruler
set mouse=a
set nu
set rnu
set bg=dark
set incsearch
set incsearch smartcase
set hlsearch
set tabstop=2
set shiftwidth=2
set expandtab
set encoding=UTF-8
set signcolumn=yes

autocmd BufNewFile,BufRead *.es6 set filetype=javascript

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:ruby_recommended_style = 1
let g:ruby_operators = 1
let g:ruby_pseudo_operators=1
let g:ruby_syntax_errors = 1
let g:neoformat_try_node_exe = 1
let g:coc_disable_startup_warning = 1
let g:NERDTreeWinSize=69

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

nmap <F1> :NERDTreeToggle<CR>

nmap <F2> :tabnext<CR>
nmap <C-T> :tabnew<CR>:NERDTreeToogle<CR>
nmap <C-Down> :m +1<CR>
nmap <C-Up> :m -2<CR>
