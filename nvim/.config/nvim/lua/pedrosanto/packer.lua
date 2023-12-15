-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --telescope
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
-- Tokyo Night
use ({
	'folke/tokyonight.nvim',
	as = 'tokyonight',
	config = function()
            vim.cmd('colorscheme tokyonight')

	end
})
-- Nord Theme
use ({
    'AlexvZyl/nordic.nvim',
    as = 'nordic'
})

    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use ('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    --LSP
    use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment these if you want to manage LSP servers from neovim
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  }
}

use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}

-- lua line
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

-- VimBeGood
use {
    'ThePrimeagen/vim-be-good'
}

-- Vim commentary
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
-- Assembly Parser
use { 'rush-rs/tree-sitter-asm' }


end)
