" ==============================================================================
" Maintainer:
"   Putu Harum Bawa - https://github.com/harum/
"
" Version:
"   Vanilla
"
" Description:
"   Vim configuration with several plugins.
"
" Sections:
"    -> Plugins
"    -> Plugins Setting
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
" Note:
"   Inspired by:
"   -  https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
"   -  https://github.com/nikolalsvk/dotfiles/blob/master/.vimrc
"   -  https://pragmaticpineapple.com/ultimate-vim-typescript-setup/
" ==============================================================================



" ==============================================================================
" Plugins
" ------------------------------------------------------------------------------

" Enable filetype plugins
filetype plugin on
filetype indent on

call plug#begin()
" -> User Interface Section
" Provide 3 custom color scheme, you can switch between them if you wish.
" But the default color scheme is gruvbox.
Plug 'morhetz/gruvbox'                                    " Color scheme
Plug 'tomasr/molokai'                                     " Color scheme
Plug 'dracula/vim', { 'as': 'dracula' }                   " Color scheme

Plug 'vim-airline/vim-airline'                            " Status line
Plug 'vim-airline/vim-airline-themes'                     " Status line themes
Plug 'Yggdroot/indentLine'                                " Indent indicator

Plug 'pangloss/vim-javascript'                            " JavaScript syntax
Plug 'HerringtonDarkholme/yats.vim'                       " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'                           " JSX syntax
Plug 'posva/vim-vue'                                      " Vue syntax
Plug 'preservim/vim-markdown'                             " Markdown syntax and command
Plug 'airblade/vim-gitgutter'                             " show git diff of lines edited

" -> Formatting and Autocomplete Section
Plug 'godlygeek/tabular'                                  " Aligning text
Plug 'tpope/vim-surround'                                 " Easily delete, change and add such surroundings in pairs
Plug 'tpope/vim-endwise'                                  " Autocomplete end after a do
Plug 'neoclide/coc.nvim', {'branch': 'release'}           " Auto completion
Plug 'dense-analysis/ale'                                 " Linter
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': [
    \'javascript',
    \'typescript',
    \'css',
    \'less',
    \'scss',
    \'json',
    \'graphql',
    \'markdown',
    \'vue',
    \'svelte',
    \'yaml',
    \'html'
  \] }                                                    " Prettier auto formatting

" -> Search and Navigation Section
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                                   " fuzzy finder

" -> Functions Section
Plug 'iamcco/markdown-preview.nvim', {
  \ 'do': 'cd app && yarn install'
  \ }                                                     " Markdown preview
Plug 'janko/vim-test'                                     " Run test, :TestFile, :TestNearest
Plug 'tpope/vim-fugitive'                                 " :Git blame
Plug 'tpope/vim-rhubarb'                                  " :GBrowse

" -> Massive Plugin Section
Plug 'tpope/vim-rails'                                    " Rails plugin
call plug#end()

" Source Vim configuration file and install plugins
nnoremap <silent> <leader>r1 :source ~/.vimrc \| :PlugInstall<CR>
" Open Vim configuration file for editing
nnoremap <silent> <leader>r2 :e ~/.vimrc<CR>

" ==============================================================================



" ==============================================================================
" Plugins Setting
" ==============================================================================

" -> User Interface Section ====================================================

" <-----------------------------------------------------------------------------
" morhetz/gruvbox
" color scheme
" ------------------------------------------------------------------------------
" set spell checking baground
let g:gruvbox_guisp_fallback = "bg"
" make dark theme contrast high
let g:gruvbox_contrast_dark = "hard"
" sign coloumn has same background the main background
let g:gruvbox_sign_column = "bg0"
" enable italic on terminal
let g:gruvbox_italic = 1
" disable bold text, the bold text does not looks good
let g:gruvbox_bold = 0
" ----------------------------------------------------------------------------->


" <-----------------------------------------------------------------------------
" tomasr/molokai
" color scheme
" ------------------------------------------------------------------------------
let g:rehash256 = 1
" ----------------------------------------------------------------------------->


" <-----------------------------------------------------------------------------
" vim-airline/vim-airline
" Status line
" See https://github.com/powerline/fonts if you want to use powerline font
" ------------------------------------------------------------------------------
" Enabling Powerline symbols
let g:airline_powerline_fonts = 1

" Allows word counting in the following filetypes
let g:airline#extensions#wordcount#filetypes = '\vasciidoc|help|mail|markdown|pandoc|org|rst|tex|text'

" Shows all buffers when only one tab open
let g:airline#extensions#tabline#enabled = 0

" Removes fileformat
let g:airline_section_y = ''

" Removes section on whitespace errors, etc.
let g:airline_section_warning = ''

" Disable SPELL section
let g:airline_detect_spell = 0

" Handles file path displays
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Sets theme for airline
let g:airline_theme='gruvbox'
" ----------------------------------------------------------------------------->


" <-----------------------------------------------------------------------------
" preservim/vim-markdown
" Markdown syntax and command
" ------------------------------------------------------------------------------
" disable conceal
let g:vim_markdown_conceal = 0
" ----------------------------------------------------------------------------->


" <-----------------------------------------------------------------------------
" airblade/vim-gitgutter
" clobber gitgutter sign
" ------------------------------------------------------------------------------
let g:gitgutter_sign_allow_clobber = 1
" ----------------------------------------------------------------------------->


" -> Formatting and Autocomplete Section =======================================

" <-----------------------------------------------------------------------------
" dense-analysis/ale config
" Asyncronous Lint Engine
" ------------------------------------------------------------------------------
" Fix files with prettier, and then ESLint.
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
" ----------------------------------------------------------------------------->


" <----------------------------------------------------------------------------
" neoclide/coc.nvim
" Auto completion using language server
" Languange Server for TypeScript, Vue and other language server
" coc-solargraph - ruby language server -  prerequisite: gem install solargraph
" -----------------------------------------------------------------------------
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ '@yaegassy/coc-volar',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-go',
  \ 'coc-solargraph' ]

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>ff  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" ---------------------------------------------------------------------------->


" <---------------------------------------------------------------------------
" prettier/vim-prettier
" plugin wrapper for prettier
" ----------------------------------------------------------------------------
nmap <Leader>py <Plug>(Prettier)
" Enable auto formatting of files that have @format or @prettier tag
let g:prettier#autoformat = 1
" Allow auto formatting for files without @format or @prettier tag
let g:prettier#autoformat_require_pragma = 0
" Toggle the g:prettier#autoformat setting based on whether a config file can be found in the current directory or any parent directory
let g:prettier#autoformat_config_present = 1
" --------------------------------------------------------------------------->



" -> Search and Navigation Section ===========================================

" <---------------------------------------------------------------------------
" junegunn/fzf.vim
" Fuzzy finder
" ----------------------------------------------------------------------------
" Map fzf search to CTRL P
nnoremap <C-p> :GFiles<Cr>
" Map fzf + ag search to CTRL G
nnoremap <C-g> :Rg <Cr>
" --------------------------------------------------------------------------->


" -> Functions Section =======================================================

" --------------------------------------------------------------------------->
" janko/vim-test
" Run test
" ----------------------------------------------------------------------------
" vim-test shortcut for running tests
nnoremap <silent> <leader>; :TestNearest<CR>
nnoremap <silent> <leader>' :TestFile<CR>
" --------------------------------------------------------------------------->



" -> Massive Plugin Section



" ==============================================================================
" General
" ==============================================================================
" display incomplete commands
set showcmd

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Sets how many lines of history VIM has to remember
set history=100

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!



" ==============================================================================
" VIM user interface
" ==============================================================================
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Use a line cursor within insert mode and a block cursor everywhere else.
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
" When opening a file with e.g. :e ~/.vim<TAB> there is a graphical menu of all the matches
set wildmenu

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Backspace deletes like most programs in insert mode
set backspace=2

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

" Show line numbers
set number
" Set width for line number column
set numberwidth=5
" Show line numbers as relative number to current cursor
set relativenumber
" Show the cursor position all the time
set ruler
" Toggle relative line numbers
nnoremap <leader>rn :set relativenumber!<cr>

" Disable folding by default
set nofoldenable

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Always use vertical diffs
set diffopt+=vertical

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes



" ==============================================================================
" Colors and Fonts
" ==============================================================================
" Enable syntax highlighting
syntax enable

" Prevent wrong syntax highlighting when it update partially
" https://vim.fandom.com/wiki/Fix_syntax_highlighting
syntax sync minlines=500

" Refresh syntax format
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

try
    colorscheme gruvbox
catch
endtry


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" set custom font for gui
" set guifont=Inconsolata:h14
set guifont=Fira_Mono:h14

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif



" ==============================================================================
" Files and backups
" ==============================================================================
" Automatically :write before running commands
set autowrite

" Turn backup off, since most stuff is in SVN, git etc.
" Also some language server for neoclide/coc.nvim have issues with backup files, see #649.
set nobackup
set nowritebackup
set noswapfile



" ==============================================================================
" Text, tab and indent related
" ==============================================================================
" Softtabs, 2 spaces
set tabstop=2     " Indent using two spaces
set shiftwidth=2  " When shifting, indent using two spaces
set shiftround    " When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set expandtab     " Convert tabs to spaces
set smarttab      " Be smart when using tabs

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Use one space, not two, after punctuation.
set nojoinspaces

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
" Comment this, because it is conflict with coc completion
"
" set wildmode=list:longest                        " matches mimic that of bash or zsh
" set wildignore+=node_modules                     " node_modules dir
" set wildignore+=.ropeproject                     " py rope cache dir
" set wildignore+=.hg,.git,.svn                    " Version control
" set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
" set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
" set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
" set wildignore+=*.spl                            " compiled spelling word lists
" set wildignore+=*.sw?                            " Vim swap files
" set wildignore+=*.DS_Store                       " OSX bullshit
" set wildignore+=migrations                       " Django migrations
" set wildignore+=*.pyc                            " Python byte code
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<c-p>"
"     endif
" endfunction
" inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <S-Tab> <c-n>



" ==============================================================================
" Visual mode related
" ==============================================================================
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" search selected words
vnoremap // y/<C-R>"<CR>
vnoremap /a y/Ag<space><C-R>"<CR>



" ==============================================================================
" Moving around, tabs and buffers
" ==============================================================================
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Enable Mouse mode in all modes
set mouse=a

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile *.es6 set filetype=javascript
augroup END



" ==============================================================================
" Status line
" ==============================================================================
" Always show the status line
set laststatus=2



" ==============================================================================
" Editing mappings
" ==============================================================================
" Fast escape
imap jk <Esc>

" Fast saving
nmap <leader>w :w!<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.ts,*.rb,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif



" ==============================================================================
" Spell checking
" ==============================================================================
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
:setlocal spelllang=en_us

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=



" ==============================================================================
" Misc
" ==============================================================================

" Ctrl + c for copy to clipboard
vmap <C-c> "+y

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"-------------------------------------------------------------------------
" STILL TESTING, NEED TO BE ADJUSTED
"-------------------------------------------------------------------------
" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :%s/<C-r>s//g
  \ <Left><Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn
" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
     \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
"-------------------------------------------------------------------------



" ==============================================================================
" Helper functions
" ==============================================================================
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" BufOnly.vim  -  Delete all the buffers except the current/named buffer.
"
" Copyright November 2003 by Christian J. Robinson <infynity@onewest.net>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Bonly / :BOnly / :Bufonly / :BufOnly [buffer] 
"
" Without any arguments the current buffer is kept.  With an argument the
" buffer name/number supplied is kept.

command! -nargs=? -complete=buffer -bang Bonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly
    \ :call BufOnly('<args>', '<bang>')

function! BufOnly(buffer, bang)
  if a:buffer == ''
    " No buffer provided, use the current buffer.
    let buffer = bufnr('%')
  elseif (a:buffer + 0) > 0
    " A buffer number was provided.
    let buffer = bufnr(a:buffer + 0)
  else
    " A buffer name was provided.
    let buffer = bufnr(a:buffer)
  endif

  if buffer == -1
    echohl ErrorMsg
    echomsg "No matching buffer for" a:buffer
    echohl None
    return
  endif

  let last_buffer = bufnr('$')

  let delete_count = 0
  let n = 1
  while n <= last_buffer
    if n != buffer && buflisted(n)
      if a:bang == '' && getbufvar(n, '&modified')
        echohl ErrorMsg
        echomsg 'No write since last change for buffer'
              \ n '(add ! to override)'
        echohl None
      else
        silent exe 'bdel' . a:bang . ' ' . n
        if ! buflisted(n)
          let delete_count = delete_count+1
        endif
      endif
    endif
    let n = n+1
  endwhile

  if delete_count == 1
    echomsg delete_count "buffer deleted"
  elseif delete_count > 1
    echomsg delete_count "buffers deleted"
  endif
endfunction
