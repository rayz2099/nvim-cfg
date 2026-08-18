-- Operational API: f 继续走 leap, 不要退回默认 find-char
-- REF: https://codeberg.org/andyg/leap.nvim
-- 直接调 leap(), 避开 <Plug> + noremap 在 0.12 下不展开的问题
-- 按官方 clever-s 实践绑到 f: n/x/o 都能跳, 跳完可用 f/F 连跳
return {
  url = "https://codeberg.org/andyg/leap.nvim.git",
  name = "leap.nvim",
  config = function()
    local leap = require "leap"
    local clever_f = require("leap.user").with_traversal_keys("f", "F")

    -- 新版默认只在词边界 preview, 旧 leap/hop 是全量标签
    leap.opts.preview = true

    -- 灰掉非目标区, 标签对比度才够
    require("leap.user").set_backdrop_highlight "Comment"
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("LeapBackdrop", { clear = true }),
      callback = function() require("leap.user").set_backdrop_highlight "Comment" end,
    })

    vim.keymap.set({ "n", "x", "o" }, "f", function()
      leap.leap {
        windows = { vim.fn.win_getid() },
        inclusive = true,
        opts = clever_f,
      }
    end, { silent = true, desc = "Leap" })
  end,
  lazy = false,
}
