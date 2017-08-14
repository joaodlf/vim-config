""" PLUGINS (via vim-plug)
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sensible'
"Plug 'ajh17/VimCompletesMe'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'nvie/vim-flake8'
Plug 'shawncplus/phpcomplete.vim'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --all
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" Themes/colors
Plug 'crusoexia/vim-dracula'

" Initialize plugin system
call plug#end()

""" PLUGINS END

" Set leader key to SPACE
let mapleader = "\<Space>"

" Show line numbers
set number

" Sytem clipboard
set clipboard=unnamed

" Open new tab
nnoremap <leader>t :tabe %<CR>

" Go to tab number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap <Leader>§ :tabclose<CR>

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <leader><Tab> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <leader><Tab> :exe "tabn ".g:lasttab<cr>

" Quit all
nnoremap <Leader>qa :qa!<CR>

" Save file
nnoremap <Leader>w :w<CR>

" Turn on spell checking
nnoremap <Leader>sc :setlocal spell spelllang=en_gb<CR>
" Spell check suggestions on highlighted word
nnoremap <Leader>ss z=
" Turn off spell checker
nnoremap <Leader>ns :set nospell<CR>

" Go back to last file
nnoremap <Leader>b :b#<CR>

""" NERDTREE
" Open NERDTree
nnoremap <Leader>nt :NERDTree<CR>
" Automatically open on vim start
autocmd vimenter * NERDTree
" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Ignore certain extensions
let NERDTreeIgnore = ['\.pyc$', '\.swn$', '\.swo$', '\.swp$']
" Show hidden files
let NERDTreeShowHidden=1

""" TAGBAR
" Opem Tagbar
nnoremap <Leader>tb :TagbarToggle<CR>
" Automatically open on vim start
autocmd vimenter * TagbarToggle

""" ACK
" Search                                                                                    
nnoremap <Leader>a :tab split<CR>:Ack ""<Left>

""" CTRLP
nnoremap <Leader>cp :CtrlP<CR>

""" YOUCOMPLETEME
set completeopt-=preview

""" THEME/COLORS
colorscheme dracula

""" Look for filetype configurations.
filetype plugin on
