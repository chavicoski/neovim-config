-- Protected call to generate prettier errors
local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
  vim.notify("[Error]: lualine not found! (in lualine.lua)")
  return
end

-- Plugin setup
lualine.setup {
  options = { theme = 'gruvbox-material' },
  sections = { lualine_b = { 'branch', 'b:gitsigns_status' } }
}
