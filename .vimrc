"Rich's .vimrc 

set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'git://github.com/vim-syntastic/syntastic.git'
Plugin 'git://github.com/altercation/vim-colors-solarized.git'
"Plugin 'rdnetto/YCM-Generator'
"Plugin 'git://github.com/leafgarland/typescript-vim.git'

call vundle#end()

:nmap \e :NERDTreeToggle<CR>
:nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
:nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
:nmap \M :set noexpandtab tabstop=8 softstabstop=4 shiftwidth=4<CR>
:nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
:nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>

"set clipboard=unnamed

"set background=dark

" able to scroll with mouse and click tabs
set mouse=a
"colorscheme murphy 

hi Normal ctermbg=none

let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_opertions = "-std=c++11 -Wall -Wextra -Wpedantic"

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

filetype plugin on
" File ~/.vim/ftplugin/cpp.vim
" Cplusplus specific settings
" File ~/.vim/ftplugin/c.vim
" C specific settings
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn syntax highlighting on
syntax on
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

set t_Co=256

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4


" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
" let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"

" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
" nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
nnoremap <buffer> <F3> :w<cr> :exec '!sh' shellescape(@%, 1)<cr>
" open python file
" nnoremap <buffer> <F3> :exec '!python3' shellescape(@%, 1)<cr>
" switch between header/source with F4
" map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
" map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" build using makeprg with <F7>
" map <F7> :make<CR>
" build using makeprg with <S-F7>
" map <S-F7> :make clean all<CR>
" goto definition with F12
map <F9> :set ignorecase! ignorecase?
map <F12> <C-]>
" in diff mode we use the spell check keys for merging
if &diff
  ” diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
"  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings (disabled)
  " :setlocal spell spelllang=en
  " set the spellfile - folders must exist
  " set spellfile=~/.vim/spellfile.add
   map <M-Down> ]s
   map <M-Up> [s
endif


