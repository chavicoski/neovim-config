local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    vim.notify("[Error]: nvim-lsp-installer not found! (in lsp-installer.lua)")
    return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("usr.plugin_config.lsp.handlers").on_attach,
    capabilities = require("usr.plugin_config.lsp.handlers").capabilities,
  }

  if server.name == "jsonls" then
    local jsonls_opts = require("usr.plugin_config.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "pyright" then
    local pyright_opts = require("usr.plugin_config.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server.name == "efm" then
    local efm_opts = require("usr.plugin_config.lsp.settings.efm")
    opts = vim.tbl_deep_extend("force", efm_opts, opts)
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
