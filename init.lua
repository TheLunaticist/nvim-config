--make sure lazy vim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- mapleader and localleader need to be set very early
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- plugins to install and options
local plugins = {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
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
	},
	{
		"williamboman/mason.nvim",
	},
	{

		"williamboman/mason-lspconfig.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		opts = function()
			--setting nvim up for cmp
			vim.opt.completeopt = {"menu", "menuone", "noselect"}

			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				window = {
					documentation = cmp.config.window.bordered()
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
				}, {
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline({"/", "?"}, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
						{ name = "path" },
					}, {
						{ name = "cmdline" },
					}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
		end,
	},
	{
		"mhartington/formatter.nvim",
		init = function()
			require("formatter").setup({
				logging = true,
				log_level = vim.log.levels.WARN,
				filetype = {
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
					cs = {
						require("formatter.filetypes.cs").csharpier,
					},
				},
			})
		end,
	},
}

local options = {}

require("lazy").setup(plugins, options)

--final config
vim.g.terminal_emulator = "powershell.exe"

--setting up nvim to work with powershell both as terminal and shell
vim.opt.shell = "powershell.exe"
vim.opt.shellxquote = ""
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
vim.opt.shellquote = ""
vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s"
vim.opt.shellredir = "| Out-File -Encoding UTF8 %s"

--setting up plugins that need a special setup
require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers({
	function(server_name)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("lspconfig")[server_name].setup({capabilities = capabilities})
	end,
})
