"automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')

"plugins here, coc for example
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

"youcompelete me zamiast coc zobaczaymy co i jak
"Plug 'valloric/youcompleteme'

Plug 'preservim/nerdcommenter'

Plug 'scrooloose/nerdtree'

Plug 'machakann/vim-sandwich'
Plug 'jiangmiao/auto-pairs'

"Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'


call plug#end()

inoremap jk <Esc>
inoremap jk <C-\><C-n>

set title

set expandtab
set tabstop=2
set shiftwidth=2

set linebreak
set clipboard+=unnamedplus

set nospell spelllang=en_us
nnoremap <silent> <F6> :set invespell<cr>
inoremap <silent> <F6> <C-O>:set invespell<cr>

" esc to turn off search highlighting
nnoremap <silent> <enter> :noh<cr>
set nohlsearch

" disable accidentally pressing ctrl-z and suspending 
nnoremap <c-z> <Nop>

colorscheme codedark

set relativenumber

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <C-space> coc#refresh()

"GoTo code navigation
nmap <leader>g <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

"show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
"manage extensions.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

"airline settings
"let g:airline#extensions#tabline#formatter = 'default'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

"airline theme
"let g:airline_theme='luna'
