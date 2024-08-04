return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()

		require("telescope").setup({
			extensions = {
				file_browser = {
					theme = "ivy",
					hijack_netrw = true,
					mappings = {
						["n"] = {
							["u"] = require("telescope").extensions.file_browser.actions.toggle_hidden,
							["h"] = require("telescope").extensions.file_browser.actions.goto_parent_dir,
							["l"] =require("telescope").extensions.file_browser.actions.open_dir,
						},
					},
				},
			},
		})

		require("telescope").load_extension("file_browser")

		--keybinds
		function liveGrepDir(dir)
			require("telescope.builtin").live_grep({
				cwd = dir,
			})
		end

		vim.keymap.set({ "n" }, "<leader>fd", function()
			local input = vim.fn.input("Enter directory to search: ")
			if input ~= "" then
				liveGrepDir(input)
			end
		end)

		local telescope_builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, {})

		--file file_browser
		vim.keymap.set("n", "<space>fc", function()
			require("telescope").extensions.file_browser.file_browser()
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "n", false) --switching to normal mode
		end)

		vim.keymap.set("n", "<space>fv", function()
			local input = vim.fn.input("Path to browse:")
			if input ~= "" then
				require("telescope").extensions.file_browser.file_browser({
					path = input,
				})
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "n", false) --switching to normal mode
			end
		end)
	end,
}
