-- General key maps

-- Open a new tab
vim.api.nvim_set_keymap('n', '<leader>t', '<Cmd>:tabnew<CR>', {})

-- Keep cursor centered when doing some movements
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', { noremap = true })

-- Add checkpoints for the undo command while writing
vim.api.nvim_set_keymap('i', ',', ',<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '.', '.<c-g>u', { noremap = true })

-- Better block identation
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })

-- Copy until the last non-blank character of the line (avoiding the carriage-return)
vim.api.nvim_set_keymap('n', 'Y', 'yg_', { noremap = true })

-- Move text
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', ":m .+1<CR>==", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', ":m .-2<CR>==", { noremap = true })

-- Better find-next and replace
-- How to: Go to the word to change, press 'cn' or 'cN', type the new word and press '.'
vim.api.nvim_set_keymap('n', 'cn', '*``cgn', { noremap = true })
vim.api.nvim_set_keymap('n', 'cN', '*``cgN', { noremap = true })