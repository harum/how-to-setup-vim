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
Plug 'itchyny/lightline.vim'


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

" =========================================================
" BufOnly - close all buffers except current or specified
" =========================================================

command! -nargs=? -complete=buffer -bang BufOnly
      \ call s:BufOnly(<q-args>, <bang>0)

function! s:BufOnly(arg, bang) abort
  if a:arg == ''
    let l:keep = bufnr('%')
  else
    let l:keep = bufnr(a:arg)
  endif

  if l:keep < 0
    echohl ErrorMsg
    echomsg 'No matching buffer'
    echohl None
    return
  endif

  for l:buf in range(1, bufnr('$'))
    if buflisted(l:buf) && l:buf != l:keep
      if !a:bang && getbufvar(l:buf, '&modified')
        echohl WarningMsg
        echomsg 'Skipped modified buffer' l:buf
        echohl None
      else
        execute 'bdelete' . (a:bang ? '!' : '') l:buf
      endif
    endif
  endfor
endfunction

