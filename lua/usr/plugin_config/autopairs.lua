-- Protected call to generate prettier errors
local autopairs_status_ok, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status_ok then
  vim.notify("[Error]: nvim-autopairs not found! (in autopairs.lua)")
  return
end

-- Plugin setup
autopairs.setup()

local cmp_autopairs_status_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_status_ok then
  vim.notify("[Error]: cmp_autopairs.completion.cmp not found! (in autopairs.lua)")
  return
end

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  vim.notify("[Error]: cmp not found! (in autopairs.lua)")
  return
end

-- If you want insert `(` after select function or method item
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

-- Add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
