return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			window = {
				layout = "float",
				width = 120,
				height = 30,
			},
			vim.keymap.set(
				"n",
				"<leader>cc",
				"<cmd>CopilotChat<cr>",
				{ noremap = true, silent = true, desc = "Open Copilot Chat" }
			),
			-- See Configuration section for options
		},
	},
}
