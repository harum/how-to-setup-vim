" =========================================================
" Plugin settings
"
" This file defines configuration (settings) for plugins only.
"
" Rules:
" - No mappings
" - No plugin installation
" - No core Vim options unrelated to plugins
" - Group settings by plugin
" =========================================================


" =========================================================
" fzf.vim
" =========================================================
" Use floating window when available (Neovim / Vim 9)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

" Enable preview window
let g:fzf_preview_window = ['right:50%', 'ctrl-/']


" =========================================================
" vim-fugitive
" =========================================================
" No explicit settings required
" Fugitive is intentionally minimal and command-driven


" =========================================================
" vim-gitgutter
" =========================================================
" Enable GitGutter by default
let g:gitgutter_enabled = 1

" Update signs faster
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" Sign appearance
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_sign_removed_first_line = '‾'
let g:gitgutter_sign_modified_removed = '~'


" =========================================================
" coc.nvim — Language Server Protocol
" =========================================================
" Use Coc extensions directory
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-snippets'
      \ ]

" Do not block Vim on diagnostics
let g:coc_disable_startup_warning = 1

" Show diagnostic messages
let g:coc_enable_diagnostic_signs = 1

" Automatically format on save (filetype dependent)
let g:coc_format_on_save = 1

" Use prettier for formatting when available
let g:coc_prettier_disable_autoformat = 0


" =========================================================
" vim-test
" =========================================================
" Run tests in a terminal
let g:test#strategy = 'terminal'

" Use nearest test runner
let g:test#javascript#runner = 'jest'
let g:test#ruby#runner = 'rspec'
let g:test#python#runner = 'pytest'


" =========================================================
" vim-markdown
" =========================================================
" Disable folding by default
let g:vim_markdown_folding_disabled = 1

" Enable fenced code block highlighting
let g:vim_markdown_fenced_languages = [
      \ 'js=javascript',
      \ 'ts=typescript',
      \ 'bash=sh',
      \ 'json=json',
      \ 'html=html',
      \ 'css=css'
      \ ]

" Follow markdown links
let g:vim_markdown_follow_anchor = 1


" =========================================================
" vim-jsx-pretty
" =========================================================
" Enable JSX highlighting for JS and TS
let g:vim_jsx_pretty_colorful_config = 1

