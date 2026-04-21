# Neovim Configuration Guide

## Project Structure

```
~/.config/nvim/
├── init.lua                    Entry point
├── lazy-lock.json              Plugin version lock
├── docs/
│   ├── guide.md                This file
│   └── keybindings.md          All keybindings
└── lua/
    ├── config/
    │   ├── options.lua         Editor settings
    │   ├── keymaps.lua         Global keybindings
    │   └── lazy.lua            Plugin manager bootstrap
    └── plugins/
        ├── init.lua            Base plugin list (keep empty)
        ├── cmp.lua             Autocompletion
        ├── lsp.lua             Language servers + keymaps
        ├── mason.lua           LSP server installer
        ├── telescope.lua       Fuzzy finder
        ├── theme.lua           Colorscheme (onedark)
        ├── toggleterm.lua      Floating terminal
        ├── tree.lua            File explorer
        └── treesitter.lua      Syntax highlighting
```

## How Plugins Load

1. `init.lua` runs `config/options.lua`, then `config/keymaps.lua`, then `config/lazy.lua`.
2. `lazy.lua` bootstraps the lazy.nvim plugin manager and calls `require("lazy").setup("plugins")`.
3. lazy.nvim scans every file in `lua/plugins/` and merges all returned plugin specs.
4. Each plugin file is self-contained -- its dependencies, config, and keymaps live in one place.

## Adding a New LSP Server

**Example: adding Python (pyright)**

### 1. Add to mason install list

`lua/plugins/mason.lua`:
```lua
ensure_installed = {
    "lua_ls",
    "gopls",
    "kotlin_language_server",
    "jdtls",
    "pyright",                  -- add here
},
```

### 2. Configure and enable

`lua/plugins/lsp.lua` -- add the config call alongside the others:
```lua
vim.lsp.config("pyright", {})
```

Then add it to the enable list:
```lua
vim.lsp.enable({
    "lua_ls",
    "gopls",
    "kotlin_language_server",
    "jdtls",
    "pyright",                  -- add here
})
```

### 3. Add treesitter parser (optional)

`lua/plugins/treesitter.lua`:
```lua
ensure_installed = {
    "lua", "go", "kotlin", "java",
    "python",                   -- add here
    ...
},
```

### 4. Restart Neovim

Mason auto-installs the server. Treesitter auto-installs the parser. LSP keymaps (`gd`, `gr`, `K`, etc.) work automatically on attach.

## Adding a New Plugin

Create a new file in `lua/plugins/`, e.g. `lua/plugins/autopairs.lua`:

```lua
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
}
```

Restart Neovim and lazy.nvim picks it up automatically. No need to touch any other file.

## Common LSP Server Names

| Language | Server name | Mason name |
|----------|-------------|------------|
| Python | `pyright` | `pyright` |
| TypeScript/JS | `ts_ls` | `ts_ls` |
| Rust | `rust_analyzer` | `rust-analyzer` |
| C/C++ | `clangd` | `clangd` |
| HTML | `html` | `html-lsp` |
| CSS | `cssls` | `css-lsp` |
| Bash | `bashls` | `bash-language-server` |
| YAML | `yamlls` | `yaml-language-server` |
| JSON | `jsonls` | `json-lsp` |
| Docker | `dockerls` | `dockerfile-language-server` |

Full list: run `:Mason` in Neovim and browse, or see https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

## Useful Commands

| Command | What it does |
|---------|-------------|
| `:Mason` | Open Mason UI -- install, update, remove LSP servers |
| `:LspInfo` | Show active LSP clients for current buffer |
| `:Lazy` | Open plugin manager UI |
| `:Lazy sync` | Update all plugins |
| `:TSInstall <lang>` | Install a treesitter parser |
| `:TSUpdate` | Update all installed parsers |
| `:checkhealth` | Diagnose your setup |
| `:Inspect` | Show highlight group under cursor |
| `:InspectTree` | Show treesitter syntax tree |

## Troubleshooting

**LSP not starting on a file?**
- Run `:LspInfo` to check if a client is attached.
- Run `:Mason` to verify the server is installed.
- Check `:checkhealth vim.lsp` for errors.

**No syntax highlighting?**
- Run `:TSInstall <language>` for the missing parser.
- Check `:InspectTree` to see if treesitter is parsing the file.

**Plugin errors on startup?**
- Run `:Lazy` and press `U` to update all plugins.
- Delete `lazy-lock.json` and restart to force a clean install.
- Check `:checkhealth lazy` for issues.
