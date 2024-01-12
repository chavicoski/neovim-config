local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("[Error]: lspconfig not found! (in lsp/init.lua)")
  return
end

-- Plugins to install and configure LSP servers
require("mason").setup()
require("mason-lspconfig").setup()

require("usr.plugin_config.lsp.handlers").setup()

require("mason-lspconfig").setup_handlers{
    function (server_name) -- default handler
        require("lspconfig")[server_name].setup {}
    end,

    -- Custom specific handlers
    ["ccls"] = function()
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
    end,
    ["lua_ls"] = function()
        lspconfig["lua_ls"].setup {
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
    end
}
