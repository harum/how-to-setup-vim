# Installation Guide

This guide explains how to install and enable the modular Vim configuration.

---

## Requirements

* Vim 8+ (terminal Vim)
* `git`
* Internet connection (for plugins)

---

## Step 1: Clone the repository

```sh
git clone <your-repo-url> ~/how-to-setup-vim
```

You may choose a different directory, but this guide assumes:

```
~/how-to-setup-vim/vimrcs
```

---

## Step 2: Minimal `~/.vimrc`

Edit (or create) `~/.vimrc`:

```vim
let g:vimrc_root = expand('~/how-to-setup-vim/vimrcs')
source g:vimrc_root . '/main.vim'
```

This keeps your Vim entry point clean and delegates everything to `vimrcs/`.

---

## Step 3: Install plugins

Open Vim and run:

```vim
:PlugInstall
```

Restart Vim once installation completes.

---

## Optional: Local overrides

For machine-specific or experimental changes, create:

```vim
~/.vimrc.local
```

Then source it **after** `main.vim`:

```vim
source expand('~/.vimrc.local')
```

This prevents accidental commits of local tweaks.

---

## Filetype-specific settings

Use standard Vim locations:

```
~/.vim/ftdetect/
~/.vim/ftplugin/
~/.vim/after/ftplugin/
```

Example:

```vim
" ~/.vim/after/ftplugin/sql.vim
setlocal tabstop=2
setlocal shiftwidth=2
```

---

## Troubleshooting

**Plugins not loading?**

* Run `:PlugInstall`
* Check `:messages`
* Verify `plugins.vim` is sourced before plugin settings

**Colors not applied?**

* Ensure `set termguicolors`
* Verify terminal true-color support

---

Installation complete 🎉
