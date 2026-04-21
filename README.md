# Neovim Config

A minimal, modern Neovim configuration written entirely in Lua. Provides IDE-like features — LSP, autocompletion, fuzzy finding, syntax highlighting, a file explorer, and a floating terminal — with just 13 plugins and a clean modular structure that's easy to extend.

## What's Included

| Feature | Plugin | Highlights |
|---------|--------|------------|
| Plugin management | [lazy.nvim](https://github.com/folke/lazy.nvim) | Auto-bootstraps on first launch, lazy loads plugins |
| Theme | [onedark.nvim](https://github.com/navarasu/onedark.nvim) | Darker variant with true color support |
| LSP | [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + [mason.nvim](https://github.com/williamboman/mason.nvim) | Go, Lua, Kotlin, Java out of the box; add more in minutes |
| Autocompletion | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | LSP-powered completions with snippet support |
| Syntax highlighting | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 15 language parsers pre-configured |
| Fuzzy finder | [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Find files and grep across the project |
| File explorer | [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | Sidebar tree with full file operations |
| Terminal | [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Floating terminal toggled with a single key |

## Requirements

- Neovim >= 0.10
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons in the file tree and UI)
- `ripgrep` (for Telescope live grep)

## Installation

Back up any existing config, then clone:

```bash
# back up existing config (if any)
mv ~/.config/nvim ~/.config/nvim.bak

# clone this repo
git clone https://github.com/notamrev/nvim.git ~/.config/nvim
```

Open Neovim — lazy.nvim bootstraps itself, installs all plugins, and Mason installs the LSP servers automatically.

## Project Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lazy-lock.json              # Plugin version lock
├── docs/
│   ├── guide.md                # Setup and extension guide
│   └── keybindings.md          # Complete keybindings reference
└── lua/
    ├── config/
    │   ├── options.lua         # Editor settings
    │   ├── keymaps.lua         # Global keybindings
    │   └── lazy.lua            # Plugin manager bootstrap
    └── plugins/
        ├── cmp.lua             # Autocompletion
        ├── lsp.lua             # Language servers + LSP keymaps
        ├── mason.lua           # LSP server installer
        ├── telescope.lua       # Fuzzy finder
        ├── theme.lua           # Colorscheme
        ├── toggleterm.lua      # Floating terminal
        ├── tree.lua            # File explorer
        └── treesitter.lua      # Syntax highlighting
```

Each plugin lives in its own file — dependencies, config, and keymaps all in one place. Adding a new plugin is as simple as dropping a new file into `lua/plugins/`.

## Key Bindings

Leader key: **Space**

### Essentials

| Key | Action |
|-----|--------|
| `<Space>w` | Save file |
| `<Space>q` | Quit |
| `<C-h/j/k/l>` | Navigate between splits |
| `<Space>e` | Toggle file explorer |
| `<Space>ff` | Find files |
| `<Space>fg` | Live grep |
| `<C-\>` | Toggle floating terminal |

### LSP (active in any buffer with a language server)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Hover docs |
| `<Space>rn` | Rename symbol |
| `<Space>ca` | Code action |
| `<Space>d` | Show diagnostic |
| `[d` / `]d` | Previous / next diagnostic |

See [docs/keybindings.md](docs/keybindings.md) for the full reference.

## Languages Supported Out of the Box

| Language | LSP Server |
|----------|------------|
| Go | `gopls` |
| Lua | `lua_ls` |
| Kotlin | `kotlin_language_server` |
| Java | `jdtls` |

Treesitter parsers are also pre-configured for Lua, Go, Kotlin, Java, JSON, YAML, Markdown, Vim, Bash, HTML, CSS, JavaScript, and TypeScript.

## Adding a New Language

1. Add the server name to `ensure_installed` in `lua/plugins/mason.lua`
2. Add `vim.lsp.config("<server>", {})` and add it to `vim.lsp.enable()` in `lua/plugins/lsp.lua`
3. Optionally add the treesitter parser in `lua/plugins/treesitter.lua`
4. Restart Neovim — everything installs automatically

See [docs/guide.md](docs/guide.md) for a step-by-step walkthrough with a Python example and a table of common LSP server names.

## Editor Defaults

- Relative line numbers
- 4-space indentation (spaces, not tabs)
- System clipboard integration
- Smart indent
- No line wrapping
- Netrw disabled (using nvim-tree instead)

## License

MIT
