# Vim Setup (Modular vimrc)

This repository contains a **modular, documented Vim configuration** designed to be:

* Easy to understand
* Easy to extend
* Safe to customize locally
* Friendly for terminal Vim users

Instead of a single monolithic `~/.vimrc`, the configuration is split into focused files under `vimrcs/` and sourced from a single entry point.

---

## Why this setup exists

Many Vim configs grow unmaintainable over time. This setup aims to:

* Separate **core Vim behavior**, **UI**, **mappings**, and **plugins**
* Avoid load-order bugs
* Make it obvious *where* a setting should live
* Serve as a learning reference, not magic

---

## Repository structure

```
vimrcs/
├── main.vim              # Entry point (source this)
├── vanilla.vim           # Pure Vim defaults
├── ui.vim                # UI settings (numbers, colors, cursor)
├── mapping.vim           # Core mappings (non-plugin)
├── plugins.vim           # Plugin manager & plugin list
├── setting.plugins.vim   # Plugin configuration
├── mapping.plugins.vim   # Plugin key mappings
├── ui.plugins.vim        # UI-related plugins
```

---

## Getting started

👉 See **INSTALLATION.md** for setup instructions.

👉 See **COMMANDS.md** for key mappings and available commands.

---

## Design principles

* Keep `~/.vimrc` minimal
* Prefer `after/` for overrides
* Explicit load order > clever hacks
* Document mappings

---

Happy hacking with Vim 🚀
