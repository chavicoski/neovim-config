-- Plugin setup
require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = { enable = true }
}

-- Mappings
local opts = { noremap = true }
vim.api.nvim_set_keymap('n', '<leader>ff', "<Cmd>lua require('telescope.builtin').find_files()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fg', "<Cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fb', "<Cmd>lua require('telescope.builtin').buffers()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fh', "<Cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fk', "<Cmd>lua require('telescope.builtin').keymaps()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fa', "<Cmd>lua require('telescope.builtin').lsp_code_actions()<CR>", opts)
