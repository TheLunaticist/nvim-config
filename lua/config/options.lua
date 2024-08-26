--general
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 0

--tab spacing
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

--setting powershell as terminal if on windows
if jit.os == "Windows" then
    vim.opt.shell = "powershell.exe"
    vim.opt.shellxquote = ""
    vim.opt.shellquote = ""
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
    vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s"
    vim.opt.shellredir = "| Out-File -Encoding UTF8 %s"
end

