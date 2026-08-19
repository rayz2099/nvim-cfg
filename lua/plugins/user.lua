-- Official Surface 只清示例插件; 猫猫头是身份标识, 必须留

---@type LazySpec
return {
  -- 关掉 better-escape, 避免 jk 抢掉正常输入手感
  { "max397574/better-escape.nvim", enabled = false },

  -- 恢复 snacks dashboard 上的猫猫头, 不要退回官方 ASTRONVIM 字标
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "::::::::::::::::.::.....::::::::::",
            "::::::::.::.........:-=-.:::::::::",
            ":::::::.:+*+=----==****+-.::::::::",
            ":::::...++*########***++*-..::::::",
            ":::::. =*+********+++++++*--:::.::",
            ":::..:=***********************+=::",
            "::-=********++++++=+++++********-.",
            ".-******#*++-=+=+=-+--++*****+-:::",
            "::-=+++***+=:-=-==-=--=+*=+-..=::",
            ".::::..:-++++=--===-=+++:.:..===::",
            ":.-==- .:::=*+++++****+- .=:.==-::",
            ":::=+=-:-:-+==-----===++=::::+-::",
            "::.:-==--=*+=-......:==+*===+=:.::",
            ":::::-=-+*+++=-:...:-++++*+=-:::::",
            ":::::.:**+++++=-..-=+++++**-.:::::",
            "::::::+****+++++===+++++****=.::::",
            "::::.=*****+++******++++****+:::::",
          }, "\n"),
        },
      },
    },
  },

  -- Why: 第一次打开文件时不要全 buffer 跑 6 套颜色正则, 只在真有色值的 ft 扫
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {
      enable_rgb = false,
      enable_hsl = false,
      enable_hsl_without_function = false,
      enable_var_usage = false,
      enable_short_hex = false,
      exclude_buffer = function(bufnr)
        local buf_utils = require "astrocore.buffer"
        if buf_utils.is_large(bufnr) or not buf_utils.is_valid(bufnr) then return true end
        local allow = {
          css = true,
          scss = true,
          less = true,
          html = true,
          javascript = true,
          javascriptreact = true,
          typescript = true,
          typescriptreact = true,
          vue = true,
          svelte = true,
          lua = true,
        }
        return not allow[vim.bo[bufnr].filetype]
      end,
    },
  },

  -- Why: 第一次打开文件时 todo 扫描不要吃多行正则
  {
    "folke/todo-comments.nvim",
    opts = {
      highlight = {
        multiline = false,
        max_line_len = 200,
      },
    },
  },

  -- Why: AstroFile 时同步 run_on_start 会去碰 mason registry, 拖第一次打开
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      run_on_start = false,
      auto_update = false,
    },
  },
}
