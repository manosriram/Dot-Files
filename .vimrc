set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set number
set laststatus=2
set noswapfile
set autoread
set noshowmode
set belloff=all
set noerrorbells
set visualbell
set t_vb=
set diffopt+=vertical
filetype plugin on
set encoding=UTF-8

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

if (executable('rg'))
    let g:rg_derive_root = 'true'
endif

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = ' ag %s -l --nocolor -g ""'
endif

" COC-Tab Config
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

map <Enter> o<ESC>
map <silent> <C-b> :NERDTreeFocus<CR>
map <silent> <C-n> :NERDTreeToggle<CR>
map ; :Files<CR>
map / /\v
map z dd
map tvv :vert term<CR>
map thh :term<CR>
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4


let mapleader=" "

nmap <leader>gs :G<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>

noremap <Leader>\t :botright vertical terminal
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap ,v <C-w>v
nnoremap ,h <C-w>s

"colorscheme config
colorscheme distinguished

let g:airline#extensions#tmuxline#enabled = 1
" start tmuxline even without vim running
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

"go config
let g:go_auto_type_info = 1
let g:go_imports_mode='gopls'
au filetype go inoremap <buffer> . .<C-x><C-o>
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>

"Easy-Motion Mappings
nnoremap <Leader>f H:call EasyMotion#WB(0, 0)<CR>
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_smartcase = 1

"Tabs mapping
nnoremap tn :tabnew<Space>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Theme config
set termguicolors     " enable true colors support
highlight LineNr guifg=white
highlight Pmenu guibg=#2C3E50 gui=bold
highlight EndOfBuffer ctermfg=white

let g:NERDSpaceDelims = 1
let g:NERDTreeDirArrows=0
set encoding=utf8
set t_Co=256

call plug#begin('~/.vim/plugged')

hi Visual term=reverse cterm=reverse guibg=White
let base16colorspace=256

set backspace=indent,eol,start
set tabstop=4
set softtabstop=4 noexpandtab
set shiftwidth=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set splitbelow
set splitright
set relativenumber
set incsearch
set noerrorbells
set nowrap
set ttimeout
set ttimeoutlen=50
set timeoutlen=3000
set maxmempattern=20000

let g:user_emmet_leader_key=','

" Prettier Config
autocmd BufWritePre *.js,*.ts,*.jsx,*.mjs,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Plugs
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'master' }
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'edkolev/tmuxline.vim'

let g:airline_theme='minimalist'

" Plugs come before this line.
call plug#end()
filetype plugin indent on
