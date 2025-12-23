" =========================================================
" UI plugin configuration
"
" This file configures visual plugins only.
" It assumes plugins are already installed via vim-plug.
"
" No editor behavior, mappings, or language tooling
" should be configured here.
" =========================================================


" =========================================================
" 1. Colorscheme plugins
" =========================================================
" These settings only apply when the corresponding
" colorscheme is active.

" ---------------------------------------------------------
" gruvbox
" ---------------------------------------------------------
" Improve contrast for dark background
let g:gruvbox_contrast_dark = 'hard'

" Use background color for sign column
let g:gruvbox_sign_column = 'bg0'

" Enable italic comments if terminal supports it
let g:gruvbox_italic = 1

" Disable bold text for cleaner appearance
let g:gruvbox_bold = 0


" =========================================================
" 3. Indentation guides — indentLine
" =========================================================
" Display indentation levels visually
let g:indentLine_enabled = 1

" Use a subtle character to avoid visual noise
let g:indentLine_char = '┆'

" Disable indent guides for performance-sensitive filetypes
let g:indentLine_fileTypeExclude = ['help', 'terminal']


" =========================================================
" 4. Git indicators — vim-gitgutter
" =========================================================
" Prevent gitgutter from overwriting existing signs
let g:gitgutter_sign_allow_clobber = 1

" Reduce update frequency for better performance
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

