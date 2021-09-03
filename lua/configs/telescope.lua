-- Integration with project.nvim plugin
require('telescope').load_extension('projects')

-- Mappings
local opts = { noremap = true }
vim.api.nvim_set_keymap('n', '<leader>ff', "<Cmd>lua require('telescope.builtin').find_files()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fg', "<Cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fb', "<Cmd>lua require('telescope.builtin').buffers()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fh', "<Cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fk', "<Cmd>lua require('telescope.builtin').keymaps()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fa', "<Cmd>lua require('telescope.builtin').lsp_code_actions()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fp', "<Cmd>:Telescope projects<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>gs', "<Cmd>lua require('telescope.builtin').git_status()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>gc', "<Cmd>lua require('telescope.builtin').git_commits()<CR>", opts)
