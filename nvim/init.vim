" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'conweller/findr.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'neovim/nvim-lspconfig'
Plug 'rhysd/vim-clang-format'
Plug 'sheerun/vim-polyglot'
Plug 'spinks/vim-leader-guide'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colors
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
Plug 'sonph/onehalf', {'rtp': 'vim' }
Plug 'sthendev/mariana.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

syntax enable                                        " syntax highlighting
set cursorline                                       " highlight line cursor is on 
set expandtab                                        " convert tab to whitespaces
set hidden
set lazyredraw
set mouse+=a
set nu
set showcmd
set showmatch
set splitright
set splitbelow
set tw=80
set ttyfast
set wildmenu
set wrap linebreak nolist
set clipboard=unnamedplus
set noshowmode
set ignorecase                                       " case insensitive search...
set smartcase                                        " ...unless there's a cap in it
" disable timeout for leader key but keep it for keycodes
set notimeout
set ttimeout
" set foldenable
" set foldlevelstart=2
" set foldnestmax=20
" set foldmethod=indent

" LSP
" lua << EOF
" require'lspconfig'.clangd.setup{}
" vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
"     vim.lsp.diagnostic.on_publish_diagnostics, {
"         virtual_text = false
"     }
" )
" EOF

" auto clang-format on save for these file types
autocmd FileType c,cpp,cc,h ClangFormatAutoEnable

" commentary
autocmd FileType c,cpp,cc,h setlocal commentstring=//\ %s

" Findr
let g:findr_highlight_matches = 1

" FZF
let g:rg_derive_root='true'

" misc
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab   " Set tab to 2 spaces
noremap <ESC><ESC> :noh<CR><CR>:<backspace>                      " ESC-ESC clears search highlighting
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
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
set background=dark
colorscheme onedark
" colorscheme mariana

" Leader keybinds
" Define prefix dictionary
let g:lmap = {}

" Register the dictionary with leader guide
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

let g:mapleader = ' '
let g:lmap.f = {'name' : 'files'}
" noremap <leader>ff :execute 'Findr ' . expand('%:.:h')<CR>
noremap <leader>ff :execute 'Files ' . expand('%:.:h')<CR>
let g:lmap.f.f = 'files'
noremap <leader>fe :echo expand('%:')<CR>

let g:lmap.s = {'name' : 'search'}
noremap <leader>sf :GFiles<CR>
let g:lmap.s.f = 'fzf'
noremap <leader>sb :Buffers<CR>
let g:lmap.s.b = 'buffers'
" noremap <leader>sr :Rg<CR>
noremap <leader>sr :exec ":Rg ".input("Rg for: ")<CR>
let g:lmap.s.r = 'ripgrep'

let g:lmap.w = {'name' : 'windows'}
noremap <leader>w <C-w>

let g:lmap.b = {'name' : 'buffers'}
noremap <leader>bn :bn<CR>
let g:lmap.b.n = 'next buffer'
noremap <leader>bp :bp<CR>
let g:lmap.b.p = 'prev buffer'
noremap <leader>bb :Buffers<CR>
let g:lmap.b.b = 'list buffers'
noremap <leader>bd :bp\|bd \#<CR>
let g:lmap.b.l = 'delete buffer'

let g:lmap.c = {'name' : 'code'}
noremap <leader>cc :Commentary<CR>
let g:lmap.c.c = 'comment'
noremap <leader>cd :<Cmd>lua vim.lsp.buf.definition()<CR><CR>
let g:lmap.c.d = 'jump to definition'
noremap <leader>ch :<Cmd>lua vim.lsp.buf.hover()<CR><CR>
let g:lmap.c.d = 'hover'
noremap <leader>cr :<Cmd>lua vim.lsp.buf.references()<CR><CR>
let g:lmap.c.r = 'references'

