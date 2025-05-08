return {
  {
    dir = "~/Documents/plugins/focus.nvim/",
    dependencies = {
      "rcarriga/nvim-notify",
    },
    -- "pedrosanto90/c-note.nvim",
    config = function()
      vim.notify = require("notify")
      require("focus")
    end
  }
}
