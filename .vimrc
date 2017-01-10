call plug#begin('~/.vim/plugged')
"Plug 'VundleVim/Vundle.vim'
"Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
"Plug 'easymotion/vim-easymotion'
Plug 'lukaszkorecki/coffeetags'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
"Plug 'raimondi/delimitmate'
"Plug 'honza/vim-snippets'
"Plug 'tpope/vim-sensible'
"Plug 'mileszs/ack.vim'
"Plug 'mattn/emmet-vim'
"Plug 'scrooloose/nerdcommenter'

"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'xolox/vim-colorscheme-switcher'
"Plug 'xolox/vim-misc'
"Plug 'mbbill/desertex'
"Plug 'flazz/vim-colorschemes'
"Plug 'tpope/vim-repeat'
"Plug 'valloric/youcompleteme'
Plug 'syngan/vim-vimlint'
Plug 'ynkdir/vim-vimlparser'
"Plug 'ervandew/supertab'
"Plug 'sirver/ultisnips'
"Plug 'marijnh/tern_for_vim'
"Plug 'https://github.com/othree/tern_for_vim_coffee.git'
Plug 'qwIvan/tern_for_vim'
"Plug 'tpope/vim-fugitive'
"Plug 'bling/vim-airline'
"Plug 'airblade/vim-gitgutter'
"Plug 'klen/python-mode'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ekalinin/dockerfile.vim'
"Plug 'mattn/emmet-vim'

"Plug 'majutsushi/tagbar'
"autocmd FileType * nested :call tagbar#autoopen(0)
nmap <F8> :TagbarToggle<CR>

"Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"Plug 'jistr/vim-nerdtree-tabs'

Plug 'iamcco/markdown-preview.vim'
let g:mkdp_path_to_chrome = "google-chrome-stable"
" 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）
let g:mkdp_auto_start = 1
" 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开 markdown 文件的时候打开一次
let g:mkdp_auto_open = 1
" 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预览窗口

"set rtp^=/usr/share/vim/vimfiles/
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
"set nocompatible
set mouse=a
set relativenumber
set ignorecase
set smartcase
set shiftwidth=2
set expandtab
set cursorline
set cursorcolumn
autocmd StdinReadPre * let s:std_in=1
map <Leader> <Plug>(easymotion-prefix)

"" Configure Ultisnip and YouCompleteMe
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"" Configure YouCompleteMe
"let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

"" make YCM compatible with UltiSnips (using supertab)
"let g:SuperTabDefaultCompletionType = '<C-n>'

colorscheme colorsbox-stnight
let g:UltiSnipsExpandTrigger="<C-j>"

let g:ycm_semantic_triggers =  {
    \   'coffee': ['.'],
    \ }

":setlocal omnifunc=tern#Complete
":call tern#Enable()
":runtime after/ftplugin/javascript_tern.vim
":set ft=html.javascript_tern
":set ft=html.javascript

"AirlineTheme jellybeans
":let g:airline_theme='jellybeans'
:let g:airline_theme='hybrid'
