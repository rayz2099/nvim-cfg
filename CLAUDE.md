# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Common commands

### Local setup / bootstrap
- Link this repo as Neovim config:
  - `./link.sh`
- Start Neovim (first run installs plugins through lazy.nvim):
  - `nvim`

### Plugin management
- Inside Neovim:
  - `:Lazy sync` (install/update/remove to match specs)
  - `:Lazy update` (update plugins)
  - `:Mason` (manage LSP/DAP/formatter binaries)

### Linting / formatting
- Format all Lua files (uses `.stylua.toml`):
  - `stylua .`
- Format a single file:
  - `stylua lua/plugins/astrolsp.lua`
- Lint all Lua files (uses `selene.toml` / `neovim.yml`):
  - `selene .`
- Lint a single file:
  - `selene lua/plugins/astrolsp.lua`

### Tests / validation
- There is no automated test suite in this repo (`tests/` and `spec/` are absent).
- Use a startup smoke check after config edits:
  - `nvim --headless "+qa"`

## Architecture overview

This is an **AstroNvim v4+** user configuration layered on top of upstream AstroNvim.

### Load path and configuration flow
1. `init.lua` bootstraps `lazy.nvim` and then loads `lua/lazy_setup.lua` and `lua/polish.lua`.
2. `lua/lazy_setup.lua` defines the main plugin spec via `lazy.setup(...)`:
   - base distro: `AstroNvim/AstroNvim` (v4)
   - then imports `community`
   - then imports `plugins`
3. `lua/community.lua` imports AstroCommunity packs before user plugins.
4. `lua/plugins/*.lua` contains user overrides/additions for AstroNvim modules and other plugins.

### Key config modules
- `lua/plugins/astrocore.lua`: core Neovim options, diagnostics, and keymaps.
- `lua/plugins/astroui.lua`: colorscheme/UI/icon customization.
- `lua/plugins/astrolsp.lua`: LSP feature toggles, format-on-save policy, server list, LSP mappings/autocmds.
- `lua/plugins/leap.lua`: custom `leap.nvim` mapping (`f` in normal mode).
- `lua/plugins/user.lua`: additional plugin specs/overrides.

### Important repository conventions
- Several starter files are intentionally disabled with the pattern:
  - `if true then return {} end`
  - Seen in `mason.lua`, `none-ls.lua`, `treesitter.lua` (and `polish.lua` uses `if true then return end`).
  - Remove that guard to activate those files.
- `lazy-lock.json` is the plugin lockfile managed by lazy.nvim.
- Formatting/linting expectations are defined by `.stylua.toml`, `selene.toml`, and `neovim.yml`.

## Notes from existing docs
- README confirms this repo targets **AstroNvim v4+** and standard installation is cloning into `~/.config/nvim` (or linking this repo there).