-- REF: https://codeberg.org/andyg/leap.nvim
return {
  url = "https://codeberg.org/andyg/leap.nvim.git",
  name = "leap.nvim",
  config = function()
    vim.keymap.set({ "n" }, "f", "<Plug>(leap)")
  end,
  lazy = false,
}
