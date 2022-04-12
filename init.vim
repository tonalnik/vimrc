" Основные настройки
set number
set shell=cmd
set encoding=utf-8
set termencoding=utf-8
set fileformat=unix
language en_US
syntax enable
set mouse=a
set nohlsearch
set nobackup
set noswapfile
set scrolloff=5
set wrap
set splitright
set splitbelow
set autoindent 
set termguicolors
set cursorline
set colorcolumn=80
set ignorecase
set smartcase

" Для отступов в Python
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set softtabstop=4

" Запуск файлов на F9
autocmd FileType python map <buffer> <F9> :w<CR>:exec 'term python' shellescape(@%, 1)<CR>
autocmd FileType cpp map <buffer> <F9> :w<CR>:exec 'term g++ % -o %:r && %:r.exe'<CR>
autocmd FileType c map <buffer> <F9> :w<CR>:exec 'term gcc % -o %:r && %:r.exe'<CR>
autocmd FileType typescript map <buffer> <F9> :w<CR>:exec 'term ts-node %'<CR>

" Фикс auto-pairs для f, r, b строк в Python
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})


" Плагины
call plug#begin('C:/Users/Danil/AppData/Local/nvim/autoload/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'cocopon/iceberg.vim'
Plug 'franbach/miramare'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lyokha/vim-xkbswitch'
Plug 'nickaroot/vim-xcode-dark-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim'
Plug 'Yggdroot/indentLine'
" Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-commentary'
Plug 'mg979/vim-visual-multi'
Plug 'pineapplegiant/spaceduck'
Plug 'atelierbram/Base2Tone-vim'
Plug 'habamax/vim-habamax'
Plug 'pbrisbin/vim-colors-off'
Plug 'davidosomething/vim-colors-meh'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'ap/vim-buftabline'

call plug#end()


set background=dark
colorscheme habamax


let g:ale_enabled=0
" Бинды для ALE и NERD
map <F5> :NERDTreeToggle %<CR>
map <F10> :ALEToggle <CR>
map <C-F10> :ALEFix autopep8 <CR>
nmap <F8> :TagbarToggle<CR>

"Для Coc Tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Для Coc Enter
if exists('*complete_info')
  inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Для поддержки русского языка
let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = 'C:\Program Files\xkb-switch-win-master\bin\libxkbswitch64.dll'

" Ecs для :term
tnoremap <Esc> <C-\><C-n>

let g:dracula_italic=0

let g:indentLine_showFirstIndentLevel=1


if colors_name == 'habamax'
    let g:airline_theme='tomorrow'
elseif colors_name == 'meh'
    let g:airline_theme='tomorrow'
endif

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'

" Бинды для буфера
map <leader>t :bn<cr>
map <leader>T :bp<cr>
map <leader>d :bd<cr>  
map <leader>bv :vert sb#<cr>  
map <leader>bs :sb#<cr>  

" Прокрутка вверх-вниз с помощью кнопки ALT
noremap <A-k> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <A-j> ddp
