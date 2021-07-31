-- Plugin setup
require('nvim-autopairs').setup()

-- compe plugin support to add `(` when completing a function
require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})
