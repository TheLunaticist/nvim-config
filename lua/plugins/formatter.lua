return {
    "mhartington/formatter.nvim",
    init = function()
        local util = require("formatter.util")

        require("formatter").setup({
            logging = true,
            log_level = vim.log.levels.WARN,
            filetype = {
                lua = {
                    function()
                        return {
                            exe = "stylua",
                            args = {
                                "--no-editorconfig",
                                "--indent-type",
                                "Spaces",
                                "--indent-width",
                                "4",
                                "--stdin-filepath",
                                util.escape_path(util.get_current_buffer_file_path()),
                                "--",
                                "-",
                            },
                            stdin = true,
                        }
                    end,
                },
                cs = {
                    require("formatter.filetypes.cs").csharpier,
                },
                javascript = {
                    function()
                        return {
                            exe = "prettier",
                            args = {
				"--stdin-filepath",
                                util.escape_path(util.get_current_buffer_file_path()),
                                "--tab-width",
                                "4",
                            },
                            stdin = true,
                        }
                    end,
                },
            },
        })
    end,

    vim.keymap.set("n", "<leader>d", vim.cmd.Format),
}
