local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set("n", "<leader>vff", function() builtin.lsp_document_symbols({ symbols='function' }) end)
vim.keymap.set("n", "<leader>vfc", function() builtin.lsp_document_symbols({ symbols='class' }) end)
vim.keymap.set("n", "<leader>vfm", function() builtin.lsp_document_symbols({ symbols='method' }) end)

