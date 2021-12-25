-- General key maps
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Open a new tab
keymap('n', '<leader>t', '<Cmd>:tabnew<CR>', opts)

-- Keep cursor centered when doing some movements
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)
keymap('n', 'J', 'mzJ`z', opts)

-- Add checkpoints for the undo command while writing
keymap('i', ',', ',<c-g>u', opts)
keymap('i', '.', '.<c-g>u', opts)

-- Better block identation
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Copy until the last non-blank character of the line (avoiding the carriage-return)
keymap('n', 'Y', 'yg_', opts)

-- When pasting in visual mode avoid reseting the current copied data
keymap('v', 'p', '_dP', opts)

-- Move text
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)
keymap('n', '<leader>j', ":m .+1<CR>==", opts)
keymap('n', '<leader>k', ":m .-2<CR>==", opts)

-- Better find-next and replace
-- How to: Go to the word to change, press 'cn' or 'cN', type the new word and press '.'
keymap('n', 'cn', '*``cgn', opts)
keymap('n', 'cN', '*``cgN', opts)
