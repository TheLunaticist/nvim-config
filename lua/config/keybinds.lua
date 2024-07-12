--general
vim.keymap.set({ "n" }, "<space>", "<NOP>");

function liveGrepDir(dir)
    require("telescope.builtin").live_grep {
	cwd = dir,
    }
end

vim.keymap.set({"n"}, "<leader>fd", function()
    
    local input = vim.fn.input("Enter directory to search: ")
    if input ~= "" then
	liveGrepDir(input)    
    end
end)

vim.keymap.set({"n"}, "<f1>", "<cmd>!.\\Build.ps1<cr>")
vim.keymap.set({"n"}, "<f2>", function()
    local modPath = "$STEAM_GAMES\\RimWorld\\Mods\\OutfitDesigner\\Source\\"
    vim.api.nvim_set_current_dir(modPath)
    print("Changed directory to " .. vim.fs.normalize(modPath))
end)
vim.keymap.set({"n"}, "<f3>", function()
    liveGrepDir("$STEAM_GAMES\\RimWorld\\Data")
end)
vim.keymap.set("n", "<leader>c", function()
    vim.api.nvim_set_current_dir(vim.fn.stdpath("config"))
end)

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})
