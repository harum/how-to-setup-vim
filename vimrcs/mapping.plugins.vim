" =========================================================
" Plugin key mappings
"
" This file defines key mappings for plugins only.
"
" Rules:
" - No options (set)
" - No plugin installation
" - No core Vim mappings
" - Group mappings by plugin
" =========================================================


" =========================================================
" fzf.vim — fuzzy finding
" =========================================================
" File search (Git-aware)
nnoremap <C-p> :GFiles<CR>

" Project-wide text search (ripgrep)
nnoremap <C-g> :Rg<CR>


" =========================================================
" vim-fugitive — Git integration
" =========================================================
" Git status
nnoremap <leader>gs :Git<CR>

" Git blame
nnoremap <leader>gb :Git blame<CR>

" Open file on remote (GitHub / GitLab)
nnoremap <leader>go :GBrowse<CR>


" =========================================================
" vim-gitgutter — Git diff indicators
" =========================================================
" Navigate hunks
nnoremap ]h <Plug>(GitGutterNextHunk)
nnoremap [h <Plug>(GitGutterPrevHunk)

" Stage / undo hunk
nnoremap <leader>hs <Plug>(GitGutterStageHunk)
nnoremap <leader>hu <Plug>(GitGutterUndoHunk)


" =========================================================
" vim-test — running tests
" =========================================================
" Run nearest test
nnoremap <leader>tn :TestNearest<CR>

" Run test file
nnoremap <leader>tf :TestFile<CR>

" Run entire test suite
nnoremap <leader>ts :TestSuite<CR>

" Re-run last test
nnoremap <leader>tl :TestLast<CR>


" =========================================================
" markdown-preview.nvim — live preview
" =========================================================
" Toggle Markdown preview
nnoremap <leader>mp :MarkdownPreviewToggle<CR>


" =========================================================
" vim-prettier — formatting
" =========================================================
" Format current buffer
nnoremap <leader>pf :Prettier<CR>


" =========================================================
" coc.nvim — LSP & completion
" =========================================================
" Diagnostics navigation
nnoremap [g <Plug>(coc-diagnostic-prev)
nnoremap ]g <Plug>(coc-diagnostic-next)

" Go to definitions
nnoremap gd <Plug>(coc-definition)
nnoremap gy <Plug>(coc-type-definition)
nnoremap gi <Plug>(coc-implementation)
nnoremap gr <Plug>(coc-references)

" Rename symbol
nnoremap <leader>rn <Plug>(coc-rename)

" Code actions
nnoremap <leader>ca <Plug>(coc-codeaction)
xnoremap <leader>ca <Plug>(coc-codeaction-selected)

" Format selection
nnoremap <leader>cf <Plug>(coc-format-selected)
xnoremap <leader>cf <Plug>(coc-format-selected)

" Hover documentation
nnoremap K :call CocActionAsync('doHover')<CR>

" Coc lists
nnoremap <leader>cd :CocList diagnostics<CR>
nnoremap <leader>co :CocList outline<CR>
nnoremap <leader>cs :CocList -I symbols<CR>
nnoremap <leader>ce :CocList extensions<CR>
nnoremap <leader>cc :CocList commands<CR>
nnoremap <leader>cr :CocListResume<CR>

" BuffOnly
nnoremap <leader>bo :BufOnly<CR>
nnoremap <leader>bO :BufOnly!<CR>
