-- Protected call to generate prettier errors
local treesitter_status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not treesitter_status_ok then
  vim.notify("[Error]: nvim-treesitter.configs not found! (in treesitter.lua)")
  return
end

-- Plugin setup
treesitter_configs.setup {
  ensure_installed = 'all',
  highlight = { enable = true },
}
