return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	enabled = true,
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {},
			sync_install = false,
			auto_install = false,
			ignore_install = {},
			highlight = {
				enable = true,
			},
			indent = {
			    enable = true,
			},
			additional_vim_regex_highlighting = false,
		})
	end,
}
