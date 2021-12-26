local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("Error: lspconfig not found!")
  return
end

require("usr.plugin_config.lsp.lsp-installer")
require("usr.plugin_config.lsp.handlers").setup()

-- TODO: Delete this. We should use lsp-installer to handle all the servers.
--       We are using this because we are getting and error when installing the
--       ccls server with lsp-installer.
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
