--general
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 0
vim.opt.timeout = false

--tab spacing
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

--visual
vim.api.nvim_set_hl(0, "lunaticist.purple", {
    bg = "#9e3aa5",
})

vim.api.nvim_set_hl(0, "lunaticist.orange", {
    bg = "orange",
})

vim.opt.guicursor = {
    "a:block-blinkon0",
    "i-c-ci:ver100",
    "o:blinkon1",
    "v:lunaticist.purple",
    "r-cr:lunaticist.orange",
}

--setting powershell as terminal if on windows
if jit.os == "Windows" then
    vim.opt.shell = "powershell.exe"
    vim.opt.shellxquote = ""
    vim.opt.shellquote = ""
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
    vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s"
    vim.opt.shellredir = "| Out-File -Encoding UTF8 %s"
end

--autocommands
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        vim.opt.signcolumn = "yes"
    end,
})
