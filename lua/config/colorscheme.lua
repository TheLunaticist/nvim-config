--lua
vim.api.nvim_set_hl(0, "@keyword.lua", { fg = "#5555ff" }) --examples: local, var

vim.api.nvim_set_hl(0, "@function.builtin.lua", { fg = "#7700ff" }) --examples: print 
vim.api.nvim_set_hl(0, "@module.builtin.lua", { fg = "#7700ff" }) --examples: os
vim.api.nvim_set_hl(0, "@lsp.mod.defaultLibrary.lua", { fg = "#7700ff" }) --examples: print 

vim.api.nvim_set_hl(0, "@string.lua", { fg = "#58d959" }) --green
vim.api.nvim_set_hl(0, "@string.escape.lua", { fg = "#caffca" }) --lighter green

vim.api.nvim_set_hl(0, "@keyword.repeat.lua", { fg = "#ff4444" })
vim.api.nvim_set_hl(0, "@keyword.conditional.lua", { fg = "#ff4444" })
--cs
vim.api.nvim_set_hl(0, "@lsp.type.keyword.cs", { fg = "#aaaaff" })
vim.api.nvim_set_hl(0, "@lsp.type.parameter.cs", { fg = "#ff0000" })
vim.api.nvim_set_hl(0, "@lsp.type.struct.cs", { fg = "#99ff44" })
vim.api.nvim_set_hl(0, "@lsp.type.class.cs", { fg = "#44ff44" })
vim.api.nvim_set_hl(0, "@lsp.typemod.constantName.static.cs", { fg = "#ff8800" })

--js
local MODULE = "#fffb00"
vim.api.nvim_set_hl(0, "@keyword.import.javascript", { fg = MODULE })
vim.api.nvim_set_hl(0, "@keyword.export.javascript", { fg = MODULE })

vim.api.nvim_set_hl(0, "@variable.javascript", { fg = "#ff8800" })
vim.api.nvim_set_hl(0, "@variable.parameter.javascript", { fg = "#ff8800" })
vim.api.nvim_set_hl(0, "@keyword.javascript", { fg = "#4444ff" })
vim.api.nvim_set_hl(0, "@keyword.type.javascript", { fg = "#4444ff" })
vim.api.nvim_set_hl(0, "@keyword.coroutine.javascript", { fg = "#4444ff" })
vim.api.nvim_set_hl(0, "@keyword.function.javascript", { fg = "#4444ff" })
