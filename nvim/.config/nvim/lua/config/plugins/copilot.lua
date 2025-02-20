return {
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          keymap = {
            accept = "<C-l>",
            next = "<C-j>",
            prev = "<C-k>",
            dismiss = "<C-h>",
          },
        },
        panel = { enabled = false }, -- Disable Copilot panel
      })
    end,
  }
}
