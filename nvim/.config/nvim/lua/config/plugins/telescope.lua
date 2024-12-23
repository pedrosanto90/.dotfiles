return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "ivy"
          },
          buffers = {
            theme = "ivy"
          },
          live_grep = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {}
        }
      }

      require('telescope').load_extension('fzf')

      vim.keymap.set("n", "<space><space>", require('telescope.builtin').buffers, { desc = 'Buffers' })
      vim.keymap.set("n", "<space>pf", require('telescope.builtin').find_files, { desc = '[P]roject [F]iles' })
      vim.keymap.set("n", "<space>ps", require('telescope.builtin').live_grep, { desc = '[P]roject [S]tring' })
      vim.keymap.set("n", "<space>pr", function()
        require('telescope.builtin').lsp_references(require('telescope.themes').get_cursor())
      end, { desc = '[P]roject [R]eferences' })

      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp Tags' })
      vim.keymap.set("n", "<space>en", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)
      vim.keymap.set("n", "<space>ep", function()
        require('telescope.builtin').find_files {
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        }
      end)

      require "config.telescope.multigrep".setup()
    end
  }
}
