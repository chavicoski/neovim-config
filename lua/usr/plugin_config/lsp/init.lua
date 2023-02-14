local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("[Error]: lspconfig not found! (in lsp/init.lua)")
  return
end

require("usr.plugin_config.lsp.lsp-installer")
require("usr.plugin_config.lsp.handlers").setup()

-- Set up the servers that need a manual setup
lspconfig["ccls"].setup {
  on_attach = require("usr.plugin_config.lsp.handlers").on_attach,
  capabilities = require("usr.plugin_config.lsp.handlers").capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  init_options = {
    -- Look for compile_commands.json here
    compilationDatabaseDirectory = "build"
  }
}
lspconfig.lua_ls.setup{
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
