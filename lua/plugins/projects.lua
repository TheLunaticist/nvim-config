local PLUG = {
    name = "projects.nvim",
    config = function (opts)
    	require("projects").setup(opts)
	vim.keymap.set("n", "<leader>p", require("projects").spawnDialogue)
    end
}

if jit.os == "Linux" then
    PLUG.dir = "~/dev/src/projects.nvim"
else
    PLUG[1] = "TheLunaticist/projects.nvim" 
end

return PLUG
