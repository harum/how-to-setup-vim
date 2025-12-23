" =========================================================
" Maintainer:
"   Putu Harum Bawa - https://github.com/harum/
"
" Vanilla Vim 9.x configuration
"
" Goals:
" - Minimal and predictable behavior
" - No plugins
" - Works on macOS and Debian-based Linux
" - Uses modern Vim defaults and avoids legacy options
" =========================================================


" =========================================================
" 0. Runtime requirements
" =========================================================
" Require Vim 9.x to keep the configuration clean and future-facing.
if v:version < 900
  echoerr "This configuration requires Vim 9.0 or newer"
  finish
endif


" =========================================================
" 1. Encoding & locale
" =========================================================
" Enforce UTF-8 everywhere for consistent cross-platform behavior.
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8


" =========================================================
" 2. Filetype detection
" =========================================================
" Enable filetype-based behavior such as:
" - filetype-specific plugins
" - syntax-aware indentation
filetype plugin indent on


" =========================================================
" 3. Core editor behavior
" =========================================================
" hidden    : allow switching buffers without forcing writes
" backspace : make backspace behave intuitively in insert mode
" autoread  : automatically reload files changed outside Vim
" confirm   : ask for confirmation instead of failing on unsaved changes
set hidden
set backspace=indent,eol,start
set autoread
set confirm

" Auto-reload files changed outside of Vim
"
" The autocommand below forces Vim to check file timestamps when:
" - Vim regains focus (e.g. alt-tab back to terminal)
" - Entering a buffer
"
" If a file was modified externally (git checkout, build tools,
" another editor), Vim will reload it automatically or warn if
" there are unsaved local changes.
augroup auto_read
  " Clear existing autocommands in this group to avoid duplicates
  autocmd!

  " Re-check file timestamps on focus or buffer enter
  autocmd FocusGained,BufEnter * checktime
augroup END

" Sentence joining behavior
"
" Use a single space (not two) after punctuation when joining lines.
" This reflects modern text editing conventions.
set nojoinspaces

" File format handling
"
" Define the order of line-ending formats Vim will recognize
" when reading files across different operating systems.
"
" unix : LF   (Linux, macOS default)
" dos  : CRLF (Windows)
" mac  : CR   (classic Mac)
set fileformats=unix,dos,mac


" =========================================================
" 4. Input & clipboard
" =========================================================
" mouse=a               : enable mouse support in terminal
set mouse=a

" System clipboard integration
"
" On macOS, the system clipboard is often mapped to the '*'
" register instead of '+'. Enabling both ensures correct
" behavior across macOS and Linux.
if has('clipboard')
  set clipboard=unnamed,unnamedplus
endif


" =========================================================
" 5. Line numbers & cursor feedback
" =========================================================
" number         : absolute line number on current line
" relativenumber : relative numbers on other lines (useful for motions)
set number
set relativenumber


" =========================================================
" 6. Command-line feedback & history
" =========================================================
" showcmd : show partial commands
" showmode: show current mode (e.g. -- INSERT --)
" history : number of remembered command-line entries
set showcmd
set showmode
set history=1000


" =========================================================
" 7. UI indicators & colors
" =========================================================
" ruler        : show cursor position
" signcolumn   : keep sign column visible to avoid text shifting
" termguicolors: enable true color support
" cursorline   : highlight the current line
set ruler
set signcolumn=yes
set termguicolors
set cursorline


" =========================================================
" 8. Scrolling behavior
" =========================================================
" scrolloff      : context lines above/below cursor
" sidescrolloff  : context columns left/right of cursor
set scrolloff=5
set sidescrolloff=5


" =========================================================
" 9. Command-line completion
" =========================================================
" wildmenu : enable visual completion menu
" wildmode : complete longest match first, then full list
set wildmenu
set wildmode=longest:full,full


" =========================================================
" 10. Indentation & tabs
" =========================================================
" expandtab     : use spaces instead of tabs
" tabstop       : spaces per tab character
" shiftwidth    : spaces per indent step
" softtabstop   : spaces inserted by <Tab>
" autoindent    : copy indentation from previous line
" smartindent   : basic smart indentation for code
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent


" =========================================================
" 11. Searching
" =========================================================
" ignorecase : case-insensitive by default
" smartcase : case-sensitive if uppercase is used
" incsearch : show matches while typing
" hlsearch  : highlight all matches
set ignorecase
set smartcase
set incsearch
set hlsearch


" =========================================================
" 12. Files, undo, backup & swap
" =========================================================
" undofile  : enable persistent undo
" undodir   : directory for undo files
" backupdir : directory for backup files
" directory : directory for swap files
"
" NOTE: Create directories if they do not exist:
"   mkdir -p ~/.vim/{undo,backup,swap}
"
" Double trailing slashes ensure unique filenames.
set undofile
set undodir^=~/.vim/undo//
set backupdir^=~/.vim/backup//
set directory^=~/.vim/swap//


" =========================================================
" 13. Window management
" =========================================================
" splitbelow : horizontal splits open below
" splitright : vertical splits open to the right
set splitbelow
set splitright


" =========================================================
" 14. Timing & responsiveness
" =========================================================
" updatetime  : delay before CursorHold events
" timeoutlen : key sequence timeout (e.g. mappings)
set updatetime=300
set timeoutlen=500

