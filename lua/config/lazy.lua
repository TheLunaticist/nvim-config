-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

--these must be set before any mappings are made
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.options")

require("lazy").setup({
    --getting plugin specs from nvim\lua\plugins
    spec = {
	{ import = "plugins" },
    },
    change_detection = {
	enabled = false,
	notify = false,
    },
})

require("config.keybinds")
require("config.colorscheme")
