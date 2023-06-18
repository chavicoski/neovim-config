-- Protected call to generate prettier errors
local nvim_tree_status_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status_ok then
  vim.notify("[Error]: nvim-tree not found! (in nvim_tree.lua)")
  return
end

nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

-- Mappings
local opts = { noremap = true }
vim.api.nvim_set_keymap('n', '<leader>o', "<Cmd>:NvimTreeToggle<CR>", opts)
