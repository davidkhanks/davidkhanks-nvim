-- disable netrw at the very start of your init.lua for Nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- pass to setup along with your other options
require("nvim-tree").setup({
    filters = {
        git_ignored = true,
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { "^.git$" },
        exclude = { "local.py", ".devhome" },
    },
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

-- Custom keybindings for Spacemacs-like experience
-- Jump to tree
vim.keymap.set("n", "<leader>pt", function()
    vim.cmd("NvimTreeFocus")
end)

-- Close the tree
vim.keymap.set("n", "<leader>pq", function()
    vim.cmd("NvimTreeClose")
end)

-- Collapse the tree
vim.keymap.set("n", "<leader>ph", function()
    vim.cmd("NvimTreeCollapse")
end)

-- Collapse the tree except for where there are open buffers
vim.keymap.set("n", "<leader>pH", function()
    vim.cmd("NvimTreeCollapseKeepBuffers")
end)

-- Make the tree window bigger by 10
vim.keymap.set("n", "<leader>p]", function()
    vim.cmd("NvimTreeResize +10")
end)


-- Make the tree window smaller by 10
vim.keymap.set("n", "<leader>p[", function()
    vim.cmd("NvimTreeResize -10")
end)

-- Jump to tree and go to currently open buffer
vim.keymap.set("n", "<leader>ff", function()
    vim.cmd("NvimTreeFindFile")
end)

-- Credit to @marvinth01: https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close#marvinth01
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(tree_wins, w)
      end
      if vim.api.nvim_win_get_config(w).relative ~= '' then
        table.insert(floating_wins, w)
      end
    end
    if 1 == #wins - #floating_wins - #tree_wins then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end
})
