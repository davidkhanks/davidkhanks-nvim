-- disable netrw at the very start of your init.lua for Nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- pass to setup along with your other options
require("nvim-tree").setup({
    auto_close = true,
    git = {
        show_on_open_dirs = false,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        severity = {
            min = vim.diagnostic.severity.ERROR,
            max = vim.diagnostic.severity.ERROR,
        },
    },
})
