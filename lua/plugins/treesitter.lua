return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "xml" },
			sync_install = false,
			auto_install = false,
			ignore_install = {},
			highlight = {
				enable = true,
				disable = {},
			},
			additional_vim_regex_highlighting = false,
		})
	end,
}
