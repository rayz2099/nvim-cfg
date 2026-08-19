-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing
-- REF: NEOVIM OPTIONS: https://neovim.io/doc/user/options.html

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      -- v6 用结构化 diagnostics, 旧 diagnostics_mode 会被丢掉
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- 第一次打开新语言时现场编译 parser 会堵住 UI, 改成只装 ensure_installed
    treesitter = {
      auto_install = false,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        -- 代码 buffer 全量 spell 会在第一次绘制时同步查词典, 只留给散文 FileType
        spell = false,
        -- 固定两列, 避免 git+diagnostic Sign 出现时把文本挤来挤去
        signcolumn = "yes:2",
        wrap = false, -- sets vim.opt.wrap
        cursorcolumn = true,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    autocmds = {
      prose_spell = {
        {
          event = "FileType",
          pattern = { "gitcommit", "markdown", "text", "rst", "org" },
          desc = "Why: 只在散文里开 spell, 避免代码第一次打开时主线程查词典",
          callback = function() vim.opt_local.spell = true end,
        },
      },
      prefetch_file_plugins = {
        {
          event = "User",
          pattern = "VeryLazy",
          desc = "Why: 把第一次打开文件才加载的 TS/LSP 提前到 UI 空闲",
          callback = function()
            vim.defer_fn(function()
              require("lazy").load {
                plugins = {
                  "nvim-treesitter",
                  "nvim-lspconfig",
                  "mason-lspconfig.nvim",
                  "astrolsp",
                  "none-ls.nvim",
                  "nvim-autopairs",
                  "nvim-treesitter-textobjects",
                },
              }
            end, 20)
          end,
        },
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- Operational API: 继续用 H/L 切 buffer, 不跟官方 ]b/[b
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
