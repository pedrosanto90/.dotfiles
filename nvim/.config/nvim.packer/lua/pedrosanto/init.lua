require("pedrosanto.remap")
require("pedrosanto.set")
require("pedrosanto.lualine")

local autocmd = vim.api.nvim_create_autocmd

-- highlight on yank
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

