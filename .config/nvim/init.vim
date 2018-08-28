set shell=/bin/bash
let mapleader = "\<space>"

" =============================================================================
" # PLUGINS
" =============================================================================
" Load vundle
set nocompatible
filetype on

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

":PlugClean remove os plugins que não estão mais sendo usados
":PlugUpdate o nome já diz

call plug#begin('~/.local/share/nvim/plugged')

" Load plugins
" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'junegunn/vim-peekaboo'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'machakann/vim-highlightedyank'
Plug 'xero/sourcerer'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \}

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'

Plug 'Shougo/echodoc.vim'

call plug#end()

if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
    noremap <C-q> :confirm qall<CR>
end

if !has('gui_running')
  set t_Co=256
endif


" Plugin settings
let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "colorcolumn"
                \ ]


" Lightline
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
\ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" Linter
let g:ale_sign_column_always = 1
" only lint on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1

    "\ 'rust': ['rustup', 'run', 'nightly', 'rls']
" language server protocol
let g:LanguageClient_serverCommands = {
    \ 'rust': ['env', 'CARGO_TARGET_DIR=~/.cargo/bin/rls', 'rls'],
    \ }

let g:LanguageClient_completionPreferTextEdit = 1
let g:LanguageClient_autoStart = 1

nnoremap <silent> H :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <F3> :call LanguageClient_textDocument_documentSymbol()<CR> 
nnoremap <silent> <F4> :call LanguageClient_textDocument_references()<CR>

"rust
" https://github.com/rust-lang/rust.vim/issues/192
let g:rustfmt_command = "rustfmt +nightly"
let g:rustfmt_options = "--emit files"
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'
let $RUST_SRC_PATH = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src"

let g:deoplete#enable_at_startup = 1
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

set completeopt=menu,noinsert,menuone,noselect
" =============================================================================
" # Editor settings
" =============================================================================
filetype plugin indent on
set autoindent
"set timeoutlen=300 " http://sackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=3
set noshowmode
set hidden
set nowrap
set nojoinspaces

" disable arrow keys
noremap  <Up>    <Nop>
noremap  <Down>  <Nop>
noremap  <Left>  <Nop>
noremap <Right> <Nop>

"testar
" escape with double tapping j in insert mode
inoremap jj <Esc>

" wrap lines visually
set breakindent           " continue wrapped lines visually indented
set linebreak             " break at 'breakat' rather than last character
set showbreak=↪           " show ↪ before wrapped lines

" keymap timeout settings
set notimeout
set ttimeout
set ttimeoutlen=50


set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Sane splits
set splitright
set splitbelow

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz


" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/


" =============================================================================
" # GUI settings
" =============================================================================
set guioptions-=T " Remove toolbar
set vb t_vb= " No more beeps
set backspace=indent,eol,start
set foldmethod=marker " Only fold on marks
set ttyfast
" https://github.com/vim/vim/issues/1735#issuecomment-383353563
set lazyredraw
set laststatus=2
set relativenumber " Relative line numbers
set number
set diffopt+=iwhite " No whitespace in vimdiff
set showcmd " Show (partial) command in status line.
set mouse=a " Enable mouse usage (all modes) in terminals
set completeopt-=preview
set shortmess+=c " don't give |ins-completion-menu| messages.
set noswapfile            " don't use swap files


" Colors
set background=dark
colorscheme sourcerer
hi Normal ctermbg=NONE
syntax on

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set nolist
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --smart-case --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)



" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Help filetype detection
autocmd BufRead *.plot set filetype=gnuplot
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.lds set filetype=ld
autocmd BufRead *.tex set filetype=tex
autocmd BufRead *.trm set filetype=c
autocmd BufRead *.xlsx.axlsx set filetype=ruby

let g:EasyMotion_smartcase = 1

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Open hotkeys
map <C-p> :Files<CR>
nmap <leader>b :Buffers<CR>

nmap <leader>j <Plug>(easymotion-overwin-f2)

" <leader>= reformats current tange
nnoremap <leader>= :'<,'>RustFmtRange<cr>

"usar com quickfix list depois do resultado do rg/ag/fd apertar alt+a depois enter
"para chegar no quickfix list então poder trocar os nomes
nnoremap <leader><F3> :cfdo 

" Outro exemplo pra usar no quickfix list :cdo normal @q // pode usar macros
nnoremap <leader><F4> :cdo 

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>

" Neat X clipboard integration
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>

" Jump to next/previous error
"nnoremap <C-j> :cnext<cr>
"nnoremap <C-k> :cprev<cr>
nmap <silent> L <Plug>(ale_lint)
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
"nnoremap <C-l> :copen<cr>
"nnoremap <C-g> :cclose<cr>

" <leader><leader> toggles between buffers
nnoremap <leader><Tab> <c-^>

" Change Y behavior
nmap Y y$
nnoremap U <C-r>

" File Editings
nnoremap <silent><leader>fer :source ~/.config/nvim/init.vim<CR>
nnoremap <silent><leader>fs :w<CR>
nnoremap <silent><leader>fS :w!<CR>
nnoremap <silent><leader>fqq :q<CR>
nnoremap <silent><leader>fqf :q!<CR>
nnoremap <silent><leader>fed :e $MYVIMRC<CR>
" Open new file adjacent to current file
"nnoremap <silent><leader>ff :e <C-R>=expand("%:p:h") . "/" <CR>

nnoremap <leader>n :noh<CR>
nnoremap <Leader>wd :bd<CR>

nnoremap <silent><leader>ss :s/
nnoremap <silent><leader>sa :%sm/

nnoremap <silent><leader>; A;<Esc>

let g:peekaboo_window = 'vertical botright 50new'

" <leader>sr for Rg search
"noremap <leader>r :Rg 
noremap <silent><leader>/ :Rg 

