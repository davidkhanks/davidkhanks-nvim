local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sp', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ss', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', function() 
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
