" =========================================================
" UI configuration
"
" This file defines visual appearance and presentation only.
" No editor behavior, mappings, or plugin configuration
" should appear here.
" =========================================================


" =========================================================
" 1. Syntax & highlighting
" =========================================================
" Enable syntax highlighting based on filetype.
syntax on


" =========================================================
" 2. Colorscheme & color support
" =========================================================
" Enable true color support in terminals that support it.
set termguicolors

" Prefer a dark background unless overridden by terminal.
set background=dark

" Load preferred colorscheme.
"
" This is a UI choice, not a plugin configuration.
" If the colorscheme is unavailable, Vim will fall
" back to the default without failing.
try
  colorscheme gruvbox
catch
  colorscheme default
endtry


" =========================================================
" 3. Line numbers & columns
" =========================================================
" numberwidth : minimum width for the line number column
set numberwidth=4

" colorcolumn : highlight the column after 'textwidth'
"
" This is useful for visual guidance without enforcing limits.
set colorcolumn=+1


" =========================================================
" 4. Cursor & line highlighting
" =========================================================
" Highlight the line the cursor is on.
set cursorline


" =========================================================
" 5. Whitespace & invisible characters
" =========================================================
" Show problematic whitespace characters.
"
" - tab   : display tabs explicitly
" - trail : highlight trailing spaces
" - nbsp  : highlight non-breaking spaces
set list
set listchars=tab:»·,trail:·,nbsp:·


" =========================================================
" 6. Folding visuals
" =========================================================
" Show a fold column to indicate foldable regions.
set foldcolumn=1

" Do not fold by default when opening files.
set nofoldenable


" =========================================================
" 7. Command line & messages
" =========================================================
" Height of the command line area.
set cmdheight=1

" Reduce verbosity of some messages.
set shortmess+=c


" =========================================================
" 8. Bells & visual feedback
" =========================================================
" Disable all audible and visual bells.
set belloff=all


" =========================================================
" 9. Diff & split presentation
" =========================================================
" Use vertical splits for diff mode when possible.
set diffopt+=vertical


" =========================================================
" 10. GUI-specific tweaks
" =========================================================
if has('gui_running')
  " Remove toolbar and scrollbars in GUI Vim.
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
endif

