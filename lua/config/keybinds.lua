--general
vim.keymap.set("n", "<space>", "<NOP>"); --disabling moving by space
vim.keymap.set("n", "<leader>a", vim.cmd.write)

--navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

--code
vim.keymap.set("n", "<leader>{", "hf)a{}<esc>ha<cr><cr><esc>ka<tab>") --square brackets


vim.keymap.set({"n"}, "<f1>", "<cmd>!.\\Build.ps1<cr>")
vim.keymap.set({"n"}, "<f2>", function()
    local modPath = "$STEAM_GAMES\\RimWorld\\Mods\\OutfitDesigner\\Source\\"
    vim.api.nvim_set_current_dir(modPath)
    print("Changed directory to " .. vim.fs.normalize(modPath))
end)
vim.keymap.set({"n"}, "<f3>", function()
    liveGrepDir("$STEAM_GAMES\\RimWorld\\Data")
end)

vim.keymap.set("n", "<leader>c", function() --set path to config
    vim.api.nvim_set_current_dir(vim.fn.stdpath("config"))
    vim.notify("Set current directory to config.")
end)
