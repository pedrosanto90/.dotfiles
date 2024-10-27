-- Catppuccin Theme
-- return {
--   -- https://github.com/catppuccin/nvim
--     'catppuccin/nvim',
--     name = "catppuccin", -- name is needed otherwise plugin shows up as "nvim" due to github URI
--     lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--     priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--     opts = {
--         term_colors = true,
--         transparent_background = true,
--         color_overrides = {
--             mocha = {
--                 base = "#141414",
--                 mantle = "#141414",
--                 crust = "#141414",
--             },
--         },
--       --   -- Replace this with your scheme-specific settings or remove to use the defaults
--         flavour = "mocha", -- "latte, frappe, macchiato, mocha"
--     },
--     config = function(_, opts)
--         require('catppuccin').setup(opts) -- Replace this with your favorite colorscheme
--         vim.cmd("colorscheme catppuccin") -- Replace this with your favorite colorscheme
--     end
-- }

-- ColorScheme Gruvbox
-- return {
-- https://github.com/morhetz/gruvbox
--   'morhetz/gruvbox',
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   config = function(_, opts)
--     vim.cmd("colorscheme gruvbox") -- Replace this with your favorite colorscheme
--   end
-- }
-- ColorScheme RosePine
return {
    {
    "rose-pine/neovim",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "moon", -- auto, main, moon, or dawn
        dark_variant = "moon", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },

        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",

          error = "love",
          hint = "iris",
          info = "foam",
          note = "pine",
          todo = "rose",
          warn = "gold",

          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",

          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },

        highlight_groups = {
          -- Comment = { fg = "foam" },
          -- VertSplit = { fg = "muted", bg = "muted" },
          NormalFloat = { bg = "none" },
        },
      })

      -- vim.cmd("colorscheme rose-pine")
      vim.cmd("colorscheme rose-pine-main")
      -- vim.cmd("colorscheme rose-pine-moon")
      -- vim.cmd("colorscheme rose-pine-dawn")
    end,
  },
    }

-- Theme/Colorscheme (uncomment section for whichever theme you prefer or use your own)
-- Kanagawa Theme (Custom Palette)
-- return {
--   -- https://github.com/rebelot/kanagawa.nvim
--   'rebelot/kanagawa.nvim', -- You can replace this with your favorite colorscheme
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   opts = {
--     -- Replace this with your scheme-specific settings or remove to use the defaults
--     transparent = true,
--     background = {
--       -- light = "lotus",
--       dark = "wave", -- "wave, dragon"
--     },
--     colors = {
--       palette = {
--         -- Background colors
--         sumiInk0 = "#161616", -- modified
--         sumiInk1 = "#181818", -- modified
--         sumiInk2 = "#1a1a1a", -- modified
--         sumiInk3 = "#1F1F1F", -- modified
--         sumiInk4 = "#2A2A2A", -- modified
--         sumiInk5 = "#363636", -- modified
--         sumiInk6 = "#545454", -- modified
--
--         -- Popup and Floats
--         waveBlue1 = "#322C47", -- modified
--         waveBlue2 = "#4c4464", -- modified
--
--         -- Diff and Git
--         winterGreen = "#2B3328",
--         winterYellow = "#49443C",
--         winterRed = "#43242B",
--         winterBlue = "#252535",
--         autumnGreen = "#76A56A", -- modified
--         autumnRed = "#C34043",
--         autumnYellow = "#DCA561",
--
--         -- Diag
--         samuraiRed = "#E82424",
--         roninYellow = "#FF9E3B",
--         waveAqua1 = "#7E9CD8", -- modified
--         dragonBlue = "#7FB4CA", -- modified
--
--         -- Foreground and Comments
--         oldWhite = "#C8C093",
--         fujiWhite = "#F9E7C0", -- modified
--         fujiGray = "#727169",
--         oniViolet = "#BFA3E6", -- modified
--         oniViolet2 = "#BCACDB", -- modified
--         crystalBlue = "#8CABFF", -- modified
--         springViolet1 = "#938AA9",
--         springViolet2 = "#9CABCA",
--         springBlue = "#7FC4EF", -- modified
--         waveAqua2 = "#77BBDD", -- modified
--
--         springGreen = "#98BB6C",
--         boatYellow1 = "#938056",
--         boatYellow2 = "#C0A36E",
--         carpYellow = "#FFEE99", -- modified
--
--         sakuraPink = "#D27E99",
--         waveRed = "#E46876",
--         peachRed = "#FF5D62",
--         surimiOrange = "#FFAA44", -- modified
--         katanaGray = "#717C7C",
--       },
--     },
--   },
--   config = function(_, opts)
--     require('kanagawa').setup(opts) -- Replace this with your favorite colorscheme
--     vim.cmd("colorscheme kanagawa") -- Replace this with your favorite colorscheme
--
--     -- Custom diff colors
--     vim.cmd([[
--       autocmd VimEnter * hi DiffAdd guifg=#00FF00 guibg=#005500
--       autocmd VimEnter * hi DiffDelete guifg=#FF0000 guibg=#550000
--       autocmd VimEnter * hi DiffChange guifg=#CCCCCC guibg=#555555
--       autocmd VimEnter * hi DiffText guifg=#00FF00 guibg=#005500
--     ]])
--
--     -- Custom border colors
--     vim.cmd([[
--       autocmd ColorScheme * hi NormalFloat guifg=#F9E7C0 guibg=#1F1F1F
--       autocmd ColorScheme * hi FloatBorder guifg=#F9E7C0 guibg=#1F1F1F
--     ]])
--   end
-- }

-- Kanagawa Theme (Original)
-- return {
--   -- https://github.com/rebelot/kanagawa.nvim
--   'rebelot/kanagawa.nvim', -- You can replace this with your favorite colorscheme
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   opts = {
--     -- Replace this with your scheme-specific settings or remove to use the defaults
--     transparent = true,
--     background = {
--       -- light = "lotus",
--       dark = "wave", -- "wave, dragon"
--     },
--   },
--   config = function(_, opts)
--     require('kanagawa').setup(opts) -- Replace this with your favorite colorscheme
--     vim.cmd("colorscheme kanagawa") -- Replace this with your favorite colorscheme
--   end
-- }

-- Tokyo Night Theme
-- return {
--   -- https://github.com/folke/tokyonight.nvim
--   'folke/tokyonight.nvim', -- You can replace this with your favorite colorscheme
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   opts = {
--     -- Replace this with your scheme-specific settings or remove to use the defaults
--     -- transparent = true,
--     style = "storm", -- other variations "storm, night, moon, day"
--   },
--   config = function(_, opts)
--     require('tokyonight').setup(opts) -- Replace this with your favorite colorscheme
--     vim.cmd("colorscheme tokyonight") -- Replace this with your favorite colorscheme
--   end
-- }


-- Sonokai Theme
-- return {
--   -- https://github.com/sainnhe/sonokai
--   'sainnhe/sonokai',
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   config = function(_, opts)
--     vim.g.sonokai_style = "espresso" -- "default, atlantis, andromeda, shusia, maia, espresso"
--     vim.cmd("colorscheme sonokai") -- Replace this with your favorite colorscheme
--   end
-- }

-- One Nord Theme
-- return {
--   -- https://github.com/rmehri01/onenord.nvim
--   'rmehri01/onenord.nvim',
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   config = function(_, opts)
--     vim.cmd("colorscheme onenord") -- Replace this with your favorite colorscheme
--   end
-- }

-- Cyberdream Theme
-- return {
--     "scottmckendry/cyberdream.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("cyberdream").setup({
--             -- Recommended - see "Configuring" below for more config options
--             transparent = true,
--             italic_comments = false,
--             hide_fillchars = true,
--             borderless_telescope = true,
--             terminal_colors = true,
--         })
--         vim.cmd("colorscheme cyberdream") -- set the colorscheme
--     end,
-- }
--
-- Everforest Theme
-- return {
--     "neanias/everforest-nvim",
--     version = false,
--     lazy = false,
--     priority = 1000, -- make sure to load this before all the other start plugins
--     -- Optional; default configuration will be used if setup isn't called.
--     config = function()
--         require("everforest").setup({
--             vim.cmd("colorscheme everforest"),
--             background = "hard",
--             italics = true,
--             ui_contrast = "high",
--             disable_italic_comments = false,
--         })
--     end,
-- }
