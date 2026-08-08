" =========================================================
" Key mappings
"
" This file defines custom key mappings only.
"
" Rules:
" - No options (set)
" - No plugin configuration
" - No autocommands
" - Mappings must be explicit and documented
" =========================================================


" =========================================================
" 1. Leader key
" =========================================================
" Use <Space> as the leader key.
"
" This creates ergonomic and mnemonic key combinations
" such as:
"   <leader>w  → save file
"   <leader>q  → quit window
let mapleader = " "
let maplocalleader = " "


" =========================================================
" 2. Core file operations
" =========================================================
" Save current buffer
nnoremap <leader>w :write<CR>

" Quit current window
nnoremap <leader>q :quit<CR>

" Quit all windows
nnoremap <leader>Q :quitall<CR>

" Save and quit
nnoremap <leader>x :xit<CR>


" =========================================================
" 3. Window management
" =========================================================
" Move between windows using Ctrl + h/j/k/l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize windows
nnoremap <C-Up>    :resize +2<CR>
nnoremap <C-Down>  :resize -2<CR>
nnoremap <C-Left>  :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>


" =========================================================
" 4. Buffer navigation
" =========================================================
" Next / previous buffer
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" Close current buffer
nnoremap <leader>bd :bdelete<CR>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>


" =========================================================
" 5. Search & highlighting
" =========================================================
" Clear search highlight
nnoremap <silent> <leader><CR> :nohlsearch<CR>


" =========================================================
" 6. Visual mode improvements
" =========================================================
" Keep selection when indenting
vnoremap < <gv
vnoremap > >gv

" Yank to system clipboard explicitly
"
" Useful when clipboard integration is inconsistent
" across terminals or remote sessions.
vnoremap <leader>y "+y
nnoremap <leader>Y "+yy

" Toggle relative line numbers
nnoremap <leader>nr :set relativenumber!<cr>

" Toggle folding visibility instantly
nnoremap <leader>z :set foldenable!<CR>

" =========================================================
" 7. Insert mode ergonomics
" =========================================================
" Quick escape from insert mode
inoremap jk <Esc>


" =========================================================
" 8. Command-line convenience
" =========================================================
" Faster command-line history navigation
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>


" =========================================================
" Terminal & utility mappings
" =========================================================

" Open a terminal in a vertical split at the current file's directory
nnoremap <F6> :let $VIM_DIR = expand('%:p:h')<CR>:vert terminal<CR>cd $VIM_DIR<CR>

" Open terminal (leader version)
nnoremap <leader>tt :let $VIM_DIR = expand('%:p:h')<CR>:vert terminal<CR>cd $VIM_DIR<CR>

" Open terminal horizontal version
nnoremap <leader>th :let $VIM_DIR = expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>


" =========================================================
" File path helpers (system clipboard)
" =========================================================

" Copy current file path (relative to cwd) to system clipboard
nnoremap <leader>cp :let @+ = expand('%')<CR>

" Copy current file full path to system clipboard
nnoremap <leader>fp :let @+ = expand('%:p')<CR>


" =========================================================
" Syntax & highlighting helpers
" =========================================================
" Refresh syntax highlighting from the start of the file.
"
" Useful when:
" - syntax highlighting breaks on large files
" - after pasting large blocks
" - after switching filetypes
nnoremap <F12> :syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" =========================================================
" Visual selection search
" =========================================================
" Search for the currently selected text.
"
" The selection is yanked and immediately used as the
" search pattern without modifying registers permanently.

" Search forward using Vim's built-in / search
vnoremap <silent> // y/<C-R>"<CR>

" Search using Ag (The Silver Searcher)
"
" Requires `ag` to be installed and available in PATH.
" This performs a project-wide search for the selection.
vnoremap <silent> /a y/Ag <C-R>"<CR>

" =========================================================
" Buffer & file navigation
" =========================================================
" Switch between the current file and the previously edited file.
"
" This uses Vim's built-in <C-^> behavior and does not rely
" on any plugins or custom state.
nnoremap <leader><leader> <C-^>


" =========================================================
" Tabs & tab navigation
" =========================================================

" Toggle between the current tab and the last accessed tab.
"
" This mimics <C-^> behavior but for tabs instead of buffers.
let g:lasttab = 1

nnoremap <leader>tl :execute 'tabnext ' . g:lasttab<CR>

augroup last_tab_tracking
  autocmd!
  autocmd TabLeave * let g:lasttab = tabpagenr()
augroup END


" Open a new tab in the directory of the current buffer.
"
" This is useful when working with multiple files in the same
" directory without changing the global working directory.
nnoremap <leader>te :tabedit <C-r>=expand('%:p:h')<CR>/


" =========================================================
" Restore cursor position on file open
" =========================================================

augroup restore_cursor_position
  autocmd!
  autocmd BufReadPost *
        \ if &ft !=# 'gitcommit'
        \ && line("'\"") > 0
        \ && line("'\"") <= line('$') |
        \   execute 'normal! g`"' |
        \ endif
augroup END

