return {
	"folke/tokyonight.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("tokyonight").setup({
			style = "storm",
			transparent = true,
		})
		-- load the colorscheme here
		vim.cmd([[colorscheme tokyonight]])
	end,
}
