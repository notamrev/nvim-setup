# Keybindings Reference

Leader key: `<Space>`

## General

| Key | Mode | Action |
|-----|------|--------|
| `<leader>w` | Normal | Save file |
| `<leader>q` | Normal | Quit |

## Window Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<C-h>` | Normal | Move to left split |
| `<C-j>` | Normal | Move to split below |
| `<C-k>` | Normal | Move to split above |
| `<C-l>` | Normal | Move to right split |

## File Explorer (nvim-tree)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>e` | Normal | Toggle file tree |
| `a` | Tree | Create new file/directory (append `/` for directory) |
| `d` | Tree | Delete file/directory |
| `r` | Tree | Rename file |
| `x` | Tree | Cut file |
| `c` | Tree | Copy file |
| `p` | Tree | Paste file |
| `<CR>` | Tree | Open file / expand directory |
| `q` | Tree | Close tree |

## Fuzzy Finder (Telescope)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ff` | Normal | Find files |
| `<leader>fg` | Normal | Live grep (search text across files) |

Inside Telescope:

| Key | Mode | Action |
|-----|------|--------|
| `<C-n>` / `<C-p>` | Insert | Next / previous result |
| `j` / `k` | Normal | Next / previous result |
| `<CR>` | Any | Open selected file |
| `<C-x>` | Insert | Open in horizontal split |
| `<C-v>` | Insert | Open in vertical split |
| `<Esc>` | Normal | Close Telescope |
| `<C-c>` | Insert | Close Telescope |

## LSP

Available in any buffer with an active language server.

| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gr` | Normal | Find all references |
| `gi` | Normal | Go to implementation |
| `K` | Normal | Hover documentation |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal | Code action (quick fixes, refactors) |
| `<leader>d` | Normal | Show diagnostic in floating window |
| `[d` | Normal | Jump to previous diagnostic |
| `]d` | Normal | Jump to next diagnostic |

## Autocompletion (nvim-cmp)

| Key | Mode | Action |
|-----|------|--------|
| `<Tab>` | Insert | Select next completion item |
| `<CR>` | Insert | Confirm selected completion |

## Terminal (toggleterm)

| Key | Mode | Action |
|-----|------|--------|
| `<C-\>` | Any | Toggle floating terminal |

Inside the terminal, press `<C-\>` again to close it.

## Built-in Vim Essentials

### Movement

| Key | Action |
|-----|--------|
| `h` `j` `k` `l` | Left, down, up, right |
| `w` / `b` | Next / previous word |
| `e` | End of word |
| `0` / `$` | Start / end of line |
| `gg` / `G` | Top / bottom of file |
| `{` / `}` | Previous / next paragraph |
| `<C-u>` / `<C-d>` | Half page up / down |
| `<C-o>` / `<C-i>` | Jump back / forward in jump list |
| `%` | Jump to matching bracket |

### Editing

| Key | Action |
|-----|--------|
| `i` / `a` | Insert before / after cursor |
| `I` / `A` | Insert at start / end of line |
| `o` / `O` | New line below / above |
| `dd` | Delete line |
| `yy` | Yank (copy) line |
| `p` / `P` | Paste after / before cursor |
| `u` | Undo |
| `<C-r>` | Redo |
| `ciw` | Change inner word |
| `diw` | Delete inner word |
| `ci"` | Change inside quotes |
| `di(` | Delete inside parentheses |
| `.` | Repeat last change |

### Search

| Key | Action |
|-----|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` / `N` | Next / previous match |
| `*` | Search word under cursor |

### Visual Mode

| Key | Action |
|-----|--------|
| `v` | Character-wise visual |
| `V` | Line-wise visual |
| `<C-v>` | Block visual |
| `>` / `<` | Indent / unindent selection |

### Splits & Tabs

| Key | Action |
|-----|--------|
| `:vs` | Vertical split |
| `:sp` | Horizontal split |
| `:tabnew` | New tab |
| `gt` / `gT` | Next / previous tab |
