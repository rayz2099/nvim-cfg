-- Operational API: f 继续走 leap, 不要退回默认 find-char
-- REF: https://codeberg.org/andyg/leap.nvim
return {
  url = "https://codeberg.org/andyg/leap.nvim.git",
  name = "leap.nvim",
  config = function()
    vim.keymap.set({ "n" }, "f", "<Plug>(leap)")
  end,
  lazy = false,
}
