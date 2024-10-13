return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "williamboman/mason.nvim",
    },
    config = function()
        local dap = require("dap")
        local MASON_PATH = vim.fn.stdpath("data") .. "/mason/packages"

        dap.adapters.coreclr = {
            type = "executable",
            command = MASON_PATH .. "/netcoredbg/netcoredbg/netcoredbg.exe",
            args = { "--interpreter=vscode" },
        }

	dap.configurations.cs = {
	    {
		type = "clr",
		name = "launch - netcoredbg",

	    }
	}
    end,
}
