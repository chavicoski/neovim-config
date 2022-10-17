-- Protected call to generate prettier errors
local neogen_status_ok, neogen = pcall(require, "neogen")
if not neogen_status_ok then
    vim.notify("[Error]: neogen not found! (in neogen.lua)")
    return
end

-- Plugin setup
neogen.setup {
    snippet_engine = "luasnip"
}

-- Mappings
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>nt", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>nm", ":lua require('neogen').generate({ type = 'file' })<CR>", opts)
