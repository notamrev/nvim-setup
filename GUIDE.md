# Neovim Configuration Guide

## Changes Made

### 1. Fixed LSP Setup
- **Added `cmp-nvim-lsp` capabilities** to all LSP servers via `vim.lsp.config("*", ...)`. Without this, completion suggestions from LSPs were not being fed to nvim-cmp.
- **Added explicit dependency chain**: `lsp.lua` now depends on mason, mason-lspconfig, and cmp-nvim-lsp so they load in the correct order.
- **Added LSP keymaps** via `LspAttach` autocmd (see keybindings below).

### 2. Fixed Treesitter (Syntax Highlighting)
- Treesitter was declared but **never configured** — no parsers were installed and `highlight` was not enabled.
- Created `treesitter.lua` with `highlight = { enable = true }`, `indent = { enable = true }`, and auto-installed parsers for lua, go, kotlin, java, json, yaml, markdown, vim, bash, html, css, javascript, typescript.

### 3. Changed Theme
- Replaced `jb.nvim` with **onedark.nvim** (`darker` style). Onedark provides rich treesitter-aware highlighting with an IntelliJ-like dark color palette.

### 4. Cleaned Up Duplicate Declarations
- `plugins/init.lua` had bare declarations for plugins already configured in dedicated files (nvim-tree, telescope, treesitter, lspconfig, cmp, cmp-nvim-lsp, LuaSnip, catppuccin). These caused lazy.nvim to merge specs and could override the real config. Cleared to `return {}`.

### 5. Minor Fixes
- Disabled netrw (required for nvim-tree to work properly).
- Removed duplicate `vim.g.mapleader` from keymaps.lua (already set in options.lua).
- Added `<C-j>` and `<C-k>` window navigation keymaps (only `<C-h>` and `<C-l>` existed).

---

## Keybindings Reference

### General
| Key | Mode | Action |
|-----|------|--------|
| `<Space>` | — | Leader key |
| `<leader>w` | Normal | Save file |
| `<leader>q` | Normal | Quit |
| `<C-h/j/k/l>` | Normal | Navigate between splits |

### File Navigation
| Key | Mode | Action |
|-----|------|--------|
| `<leader>e` | Normal | Toggle file tree |
| `<leader>ff` | Normal | Find files (Telescope) |
| `<leader>fg` | Normal | Live grep (Telescope) |

### LSP
| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gr` | Normal | Find references |
| `gi` | Normal | Go to implementation |
| `K` | Normal | Hover documentation |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal | Code action |
| `<leader>d` | Normal | Show diagnostics float |
| `[d` | Normal | Previous diagnostic |
| `]d` | Normal | Next diagnostic |

### Terminal
| Key | Mode | Action |
|-----|------|--------|
| `<C-\>` | Any | Toggle floating terminal |

---

## How to Add a New LSP Server

### Step 1: Find the server name
Browse available servers at https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md or run `:Mason` in Neovim and search.

### Step 2: Add to mason ensure_installed
Edit `lua/plugins/mason.lua` and add the server name to the `ensure_installed` list:
```lua
ensure_installed = {
    "lua_ls",
    "gopls",
    "kotlin_language_server",
    "jdtls",
    "pyright",  -- example: Python
},
```

### Step 3: Configure and enable in lsp.lua
Edit `lua/plugins/lsp.lua`:
```lua
-- Add config (empty table is fine for defaults)
vim.lsp.config("pyright", {})

-- Add to the enable list
vim.lsp.enable({
    "lua_ls",
    "gopls",
    "kotlin_language_server",
    "jdtls",
    "pyright",
})
```

### Step 4: Add treesitter parser (optional but recommended)
Edit `lua/plugins/treesitter.lua` and add the language to `ensure_installed`:
```lua
ensure_installed = {
    "lua", "go", "kotlin", "java",
    "python",  -- add this
    -- ...
},
```

### Step 5: Restart Neovim
Mason will auto-install the server. Treesitter parsers install on the first `:TSUpdate` or restart.

---

## Project Structure

```
~/.config/nvim/
├── init.lua                    -- Entry point: loads options, keymaps, lazy
├── lazy-lock.json              -- Plugin version lock file
├── GUIDE.md                    -- This file
└── lua/
    ├── config/
    │   ├── options.lua         -- Editor settings (tabs, numbers, clipboard)
    │   ├── keymaps.lua         -- Global keybindings
    │   └── lazy.lua            -- Plugin manager bootstrap
    └── plugins/
        ├── init.lua            -- Base plugin list (keep empty, use dedicated files)
        ├── cmp.lua             -- Autocompletion (nvim-cmp)
        ├── lsp.lua             -- LSP configuration and keymaps
        ├── mason.lua           -- LSP server installer
        ├── telescope.lua       -- Fuzzy finder
        ├── theme.lua           -- Colorscheme
        ├── toggleterm.lua      -- Floating terminal
        ├── tree.lua            -- File explorer
        └── treesitter.lua      -- Syntax highlighting and indentation
```

---

## Useful Commands

| Command | Description |
|---------|-------------|
| `:Mason` | Open Mason UI to install/manage LSP servers |
| `:LspInfo` | Show active LSP clients for current buffer |
| `:TSInstall <lang>` | Install a treesitter parser |
| `:TSUpdate` | Update all treesitter parsers |
| `:Lazy` | Open plugin manager UI |
| `:Lazy sync` | Update all plugins |
| `:checkhealth` | Diagnose issues with your setup |
