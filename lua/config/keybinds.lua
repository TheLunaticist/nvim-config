--general
vim.keymap.set("n", "<space>", "<NOP>") --disabling moving by space
vim.keymap.set("n", "<leader>a", vim.cmd.write)

--navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>q", vim.cmd.noh)

--code
vim.keymap.set("n", "<leader>{", "hf)a{}<esc>ha<cr><cr><esc>ka<tab>") --square brackets

--editing
vim.keymap.set("n", "s", "viw")

vim.keymap.set({ "n" }, "<f1>", "<cmd>!.\\Build.ps1<cr>")
vim.keymap.set({ "n" }, "<f2>", function()
    local modPath = "$STEAM_GAMES\\RimWorld\\Mods\\OutfitDesigner\\Source\\"
    vim.api.nvim_set_current_dir(modPath)
    print("Changed directory to " .. vim.fs.normalize(modPath))
end)

vim.keymap.set({ "n" }, "<leader>x", "\"_")

--open config path in explorer
vim.keymap.set("n", "<leader>c", function() --set path to config
    local telescopeLoaded, telescope = pcall(require, "telescope")
    if telescopeLoaded and telescope.extensions.file_browser ~= nil then
        telescope.extensions.file_browser.file_browser({
            initial_mode = "normal",
            path = vim.fn.stdpath("config") .. "/lua",
        })
    else
        --backup
        vim.cmd("Ex " .. vim.fn.stdpath("config") .. "/lua")
    end
end)
