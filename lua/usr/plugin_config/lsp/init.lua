local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("[Error]: lspconfig not found! (in lsp/init.lua)")
    return
end

-- Set up the keymaps for the LSP server actions
require("usr.plugin_config.lsp.keymaps")

-- Plugins to install and configure LSP servers
require("mason").setup()
require("mason-lspconfig").setup()

require("usr.plugin_config.lsp.handlers").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler
        require("lspconfig")[server_name].setup {
            capabilities = capabilities,
        }
    end,

    -- Custom specific handlers
    ["lua_ls"] = function()
        lspconfig["lua_ls"].setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
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
    end,
    ["pyright"] = function()
        lspconfig["pyright"].setup {
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "standard",
                    },
                },
            },
        }
    end,
    ["clangd"] = function()
        lspconfig["clangd"].setup {
            capabilities = capabilities,
            cmd = {
                "clangd",
                "--offset-encoding=utf-16",
                "--fallback-style=Google",
            },
        }
    end,
    ["efm"] = function()
        lspconfig["efm"].setup{
            init_options = { documentFormatting = true },
            settings = {
                rootMarkers = { ".git/" },
                languages = {
                    python = {
                        { formatCommand = "black --quiet -", formatStdin = true },
                        { formatCommand = "isort --quiet -", formatStdin = true }
                    },
                    javascript = {
                        { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true },
                    },
                    typescript = {
                        { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true },
                    },
                    svelte = {
                        { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true },
                    },
                    html = {
                        { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true },
                    },
                    json = {
                        { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true },
                    }
                }
            }
        }
    end
}
