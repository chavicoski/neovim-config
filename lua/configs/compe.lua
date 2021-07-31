vim.o.completeopt = "menuone,noselect"

-- Plugin setup
require('compe').setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}
-- Mappings
-- <Tab> to navigate the completion menu
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true, noremap = true })
-- Close the completion menu
vim.api.nvim_set_keymap('i', '<C-e>', "compe#close('<C-e>')", { noremap = true, silent = true, expr = true })
-- Autoselect the first match with <CR> -- This can cause problems with the autopairs plugin config
-- vim.api.nvim_set_keymap('i', '<CR>', "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
