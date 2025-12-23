" =========================================================
" Plugin definitions
"
" This file declares all third-party plugins.
" No configuration, mappings, or UI customization belongs here.
"
" All plugin behavior and UI settings must be defined in:
" - ui.plugins.vim
" - plugins.settings.vim
" =========================================================


" =========================================================
" 1. Plugin manager bootstrap (vim-plug)
" =========================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" =========================================================
" 2. Begin plugin section
" =========================================================
call plug#begin('~/.vim/plugged')


" =========================================================
" 3. UI & appearance
" =========================================================
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'


" =========================================================
" 4. Language & syntax
" =========================================================
Plug 'maxmellon/vim-jsx-pretty'
Plug 'preservim/vim-markdown'


" =========================================================
" 5. Formatting & completion
" =========================================================
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }


" =========================================================
" 6. Search & navigation
" =========================================================
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" =========================================================
" 7. Git & project tools
" =========================================================
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'


" =========================================================
" 8. Utilities
" =========================================================
Plug 'godlygeek/tabular'
Plug 'janko/vim-test'
Plug 'tpope/vim-abolish'


" =========================================================
" 9. End plugin section
" =========================================================
call plug#end()

