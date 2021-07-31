-- Plugin setup
require('lualine').setup {
  options = { theme = 'gruvbox_material' },
  sections = { lualine_b = { 'branch', 'b:gitsigns_status' } }
}
