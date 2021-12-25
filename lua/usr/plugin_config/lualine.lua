-- Plugin setup
require('lualine').setup {
  options = { theme = 'gruvbox-material' },
  sections = { lualine_b = { 'branch', 'b:gitsigns_status' } }
}
