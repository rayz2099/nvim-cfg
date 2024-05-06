-- REF: https://github.com/ggandor/leap.nvim
return {
  "ggandor/leap.nvim",
  config = function()
    vim.keymap.set({'n'}, 'f', '<Plug>(leap)')
  end,
  lazy = false,
}
