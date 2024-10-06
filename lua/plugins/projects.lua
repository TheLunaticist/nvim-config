return {
    dir = "~/dev/src/projects.nvim",
    name = "projects.nvim",
    config = function (opts)
    	require("projects").setup(opts)
	vim.keymap.set("n", "<leader>p", require("projects").spawnDialogue)
    end
}
