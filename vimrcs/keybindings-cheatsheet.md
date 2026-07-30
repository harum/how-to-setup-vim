# Vimrc Keybindings Cheatsheet

Leader key: `<Space>`

## Core file operations

| Key | Action |
|-----|--------|
| `<leader>w` | Write (save) |
| `<leader>q` | Quit window |
| `<leader>Q` | Quit all windows |
| `<leader>x` | Exit (save & quit) |

## Window navigation

| Key | Action |
|-----|--------|
| `<C-h>` | Window left |
| `<C-j>` | Window down |
| `<C-k>` | Window up |
| `<C-l>` | Window right |

## Window resize

| Key | Action |
|-----|--------|
| `<C-Up>` | Resize height +2 |
| `<C-Down>` | Resize height -2 |
| `<C-Left>` | Vertical resize -2 |
| `<C-Right>` | Vertical resize +2 |

## Buffer navigation

| Key | Action |
|-----|--------|
| `<leader>bn` | Next buffer |
| `<leader>bp` | Previous buffer |
| `<leader>bd` | Close current buffer |
| `<leader>ba` | Close all buffers |
| `<leader>bo` | Close all other buffers |
| `<leader>bO` | Close all other buffers (force) |
| `<leader><leader>` | Alternate buffer (previous file) |

## Search

| Key | Action |
|-----|--------|
| `<leader><CR>` | Clear search highlight |

## Visual mode

| Key | Action |
|-----|--------|
| `<` / `>` | Indent left/right (maintain selection) |
| `<leader>y` | Yank to system clipboard |
| `<leader>Y` | Yank line to system clipboard |
| `//` | Search selected text forward |
| `/a` | Search selected text with Ag |

## Toggles

| Key | Action |
|-----|--------|
| `<leader>nr` | Toggle relative number |
| `<leader>z` | Toggle fold |

## Insert mode

| Key | Action |
|-----|--------|
| `jk` | Escape to normal mode |

## Command-line mode

| Key | Action |
|-----|--------|
| `<C-j>` | Down (history) |
| `<C-k>` | Up (history) |

## Terminal

| Key | Action |
|-----|--------|
| `<F6>` | Vertical terminal (in file's directory) |
| `<leader>tt` | Vertical terminal (in file's directory) |
| `<leader>th` | Horizontal terminal (in file's directory) |

## File path helpers

| Key | Action |
|-----|--------|
| `<leader>cp` | Copy relative path to clipboard |
| `<leader>fp` | Copy absolute path to clipboard |

## Syntax

| Key | Action |
|-----|--------|
| `<F12>` | Syntax sync from start |

## Tab navigation

| Key | Action |
|-----|--------|
| `<leader>tl` | Go to last tab |
| `<leader>te` | New tab in current file's directory |

## fzf.vim (fuzzy finder)

| Key | Action |
|-----|--------|
| `<C-p>` | Git files (GFiles) |
| `<C-g>` | Project-wide text search (Rg) |

## Git — vim-fugitive

| Key | Action |
|-----|--------|
| `<leader>gs` | Git status |
| `<leader>gb` | Git blame |
| `<leader>gf` | Git diff |
| `<leader>gff` | Git diff --cached |
| `<leader>ga` | Git add -p |
| `<leader>go` | Browse remote (GBrowse) |

## Git — vim-gitgutter

| Key | Action |
|-----|--------|
| `]h` | Next hunk |
| `[h` | Prev hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hu` | Undo (reset) hunk |

## vim-test

| Key | Action |
|-----|--------|
| `<leader>tn` | Test nearest |
| `<leader>tf` | Test file |
| `<leader>ts` | Test suite |
| `<leader>tl` | Test last |

## LSP — coc.nvim

| Key | Action |
|-----|--------|
| `[g` | Previous diagnostic |
| `]g` | Next diagnostic |
| `gd` | Go to definition |
| `gy` | Go to type definition |
| `gi` | Go to implementation |
| `gr` | References |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>cf` | Format selection |
| `K` | Hover documentation |
| `<leader>cd` | CocList diagnostics |
| `<leader>co` | CocList outline |
| `<leader>cs` | CocList symbols |
| `<leader>ce` | CocList extensions |
| `<leader>cc` | CocList commands |
| `<leader>cr` | CocList resume |

## Markdown

| Key | Action |
|-----|--------|
| `<leader>mp` | Toggle markdown preview |
