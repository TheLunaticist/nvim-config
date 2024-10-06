return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
        require("telescope").setup({
            defaults = {
                initial_mode = "normal",
            },
            extensions = {
                file_browser = {
                    theme = "ivy",
                    hijack_netrw = true,
		    hide_parent_dir = true,
                    mappings = {
                        ["n"] = {
                            ["u"] = require("telescope").extensions.file_browser.actions.toggle_hidden,
                            ["h"] = require("telescope").extensions.file_browser.actions.goto_parent_dir,
                            ["l"] = require("telescope").extensions.file_browser.actions.open_dir,
                        },
                    },
                },
            },
        })

        require("telescope").load_extension("file_browser")

        --keybinds
        local function liveGrepDir(dir)
            require("telescope.builtin").live_grep({
                cwd = dir,
            })
        end

        vim.keymap.set({ "n" }, "<leader>fd", function()
            local input = vim.fn.input("Enter directory to search: ")
            if input ~= "" then
                liveGrepDir(input)
            end
        end)

        local telescope_builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", function()
            telescope_builtin.find_files({
                initial_mode = "insert",
            })
        end)
        vim.keymap.set("n", "<leader>fg", function()
            telescope_builtin.live_grep({
                initial_mode = "insert",
            })
        end)
        vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers)
        vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags)

        --file file_browser
        vim.keymap.set("n", "<space>fc", function()
            require("telescope").extensions.file_browser.file_browser({
                initial_mode = "normal",
		hide_parent_dir = true,
            })
        end)

        vim.keymap.set("n", "<space>fv", function()
            local input = vim.fn.input("Path:")
            if input ~= "" then
                require("telescope").extensions.file_browser.file_browser({
                    path = input,
                })
            end
        end)
    end,
}
