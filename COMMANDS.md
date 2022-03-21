# Commands
Below is minimal basic commands that you should know so you can use Vim. You can look for more on [Vim Cheat Sheet](https://vim.rtorr.com/)

## Global
`h[elp] keyword` - open help for keyword
`:sav[eas] file` - save file as
`:clo[se]` - close current pane
`:ter[minal]` - open a terminal window

## Open and Close File
We can open single file or open folder using Vim.
```bash
# open current folder
vim .

# open folder
vim ~/myProject

# open file
vim file_name.md
```

Once we already inside Vim, we can use
```vim
" close file without saving
:q

" close file and discard changes
:q!

" save changes
:wq

" save changes then close file
:wq
```

## Navigation
### Cursor movement
`h` - move cursor left

`j` - move cursor down

`k` - move cursor up

`l` - move cursor right

`gj` - move cursor down on multi-line text

`gk` - move cursor up on multi-line text

`gg` - go to the first line of the document

`G` - go to the last line of the document


## Insert mode
`i` - insert before the cursor

`I` - insert at the beginning of the line

`a` - insert (append) after the cursor

`A` - insert (append) at the end of the line

`o` - append (open) a new line below the current line

`O` - append (open) a new line above the current line

`Esc` - exit insert mode

`jk` - exit insert mode (alias)


## Editing
`u` - undo

`Ctrl` + `r` - redo

`.` - repeat last command

## Marking text (visual mode)
`v` - start visual mode, mark lines, the do a command

`V` - start line wise visual mode

`o` - move to other end of marked area

`Ctrl` + `v` - start visual block mode

## Visual Commands
`y` - yank (copy) marked text

`d` - delete marked text

`u` - change marked text to lowercase

`U` - change marked text to uppercase

## Cut and paste
`yy` - yank (copy) a line

`p` - put (paste) the clipboard after cursor

`P` - put (paste) before cursor

`dd` - delete (cut) a line

`D` - delete (cut) to the end of the line

## Exiting
`:w` - write (save) the file, but don't exit

`:wq` or `:x` or `ZZ` - write (save) and quit

`:q` - quit (fails if there are unsaved changes)

`:q!` or `ZQ` - quit and throw away unsaved changes

`:wqa` - write (save) and quit on all tabs

## Search and replace
`/pattern` - search for pattern

`?pattern` - search backward for pattern

`n` - repeat search in same direction

`N` - repeat search in opposite direction

`%s/old/new/g` - replace all old with new throughout file

`%s/old/new/gc` - replace all old with new throughout file with confirmation

`:noh` - remove highlghting of search matches


## Search in  multiple files
`:vim[grep] /pattern/ file` - search for pattern in multiple files

```vim
" example
:vim[grep] /foo/ **/*
```

`:cn[ext]` - jump to the next match

`:cp[revious]` - jump to the previous match

`:cope[n]` - open a window containing the list of matches

`:ccl[ose]` - close the quickfix window

## Search filename
`:find file_name` - find file name


## Tabs
`:te` or `:tabnew` or `:tabnew {page.words.file}` - open a file in a new tab

`gt` or `:tabn[ext]` - move to the next tab

`gT` or `:tabp[revious]` - move to the previous tab


## Working with multiple files
`:e[dit] file` - edit a file in a new buffer

`:ls` or `:buffers` - list all open buffers

`sp[lit]` - open a split window

`sp[lit]` - open a split window

`vs[plit]` - open a vertically split window

`vs[plit] file` - open a file in a new buffer and vertically split window

`Ctrl`+`w` then `h` or `Ctrl` + `h` - move cursor to the left window (vertical split)

`Ctrl`+`w` then `l` or `Ctrl` + `l`  - move cursor to the right window (vertical split)

`Ctrl`+`w` then `j` or `Ctrl` + `j` - move cursor to the window below (horizontal split)

`Ctrl`+`w` then `k` or `Ctrl` + `k` - move cursor to the window above (horizontal split)

