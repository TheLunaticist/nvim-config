--lua
vim.api.nvim_set_hl(0, "@keyword.lua", { fg = "#5555ff" }) --examples: local, var

vim.api.nvim_set_hl(0, "@function.builtin.lua", { fg = "#7700ff" }) --examples: print 
vim.api.nvim_set_hl(0, "@module.builtin.lua", { fg = "#7700ff" }) --examples: os

vim.api.nvim_set_hl(0, "@string.lua", { fg = "#58d959" }) --green
vim.api.nvim_set_hl(0, "@string.escape.lua", { fg = "#caffca" }) --lighter green

--cs
vim.api.nvim_set_hl(0, "@lsp.type.keyword.cs", { fg = "#aaaaff" })
vim.api.nvim_set_hl(0, "@lsp.type.parameter.cs", { fg = "#ff0000" })
vim.api.nvim_set_hl(0, "@lsp.type.struct.cs", { fg = "#99ff44" })
vim.api.nvim_set_hl(0, "@lsp.type.class.cs", { fg = "#44ff44" })
vim.api.nvim_set_hl(0, "@lsp.typemod.constantName.static.cs", { fg = "#ff8800" })
