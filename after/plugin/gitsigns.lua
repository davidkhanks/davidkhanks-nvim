require('gitsigns').setup()

vim.keymap.set("n", "<leader>gb", function()
    vim.cmd("Gitsigns toggle_current_line_blame")
end)
