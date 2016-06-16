call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'easymotion/vim-easymotion'
Plug 'lukaszkorecki/coffeetags'
Plug 'rdnetto/ycm-generator'
Plug 'raimondi/delimitmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-sensible'
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
"Plug 'scrooloose/nerdcommenter'
"Plug 'majutsushi/tagbar'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'xolox/vim-colorscheme-switcher'
"Plug 'xolox/vim-misc'
"Plug 'mbbill/desertex'
Plug 'flazz/vim-colorschemes'
"Plug 'tpope/vim-repeat'

if has('nvim')
	Plug 'majutsushi/tagbar'
	Plug 'scrooloose/nerdtree'
	Plug 'valloric/youcompleteme'
	Plug 'scrooloose/syntastic'
	Plug 'tpope/vim-surround'
	Plug 'sirver/ultisnips'
	Plug 'kien/ctrlp.vim'
	Plug 'scrooloose/nerdcommenter'
endif

call plug#end()



" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

:filetype plugin on
:syntax on
set mouse=a
set number
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * nested :call tagbar#autoopen(0)
map <Leader> <Plug>(easymotion-prefix)
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Configure Ultisnip and YouCompleteMe
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Configure YouCompleteMe
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" make YCM compatible with UltiSnips (using supertab)
let g:SuperTabDefaultCompletionType = '<C-n>'

colorscheme colorsbox-stnight
