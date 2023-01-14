-- Automatically install packer if not found
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer... Close and reopen Neovim"
    vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call to avoid random errors
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("[Error]: Packer not found! (in plugins.lua)")
    return
end

-- Show packer output in a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Autocompletion
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- Buffer completions
    use "hrsh7th/cmp-path" -- Path completions
    use "hrsh7th/cmp-cmdline" -- Cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- Snippet completions
    use "hrsh7th/cmp-nvim-lsp" -- LSP completions
    use "hrsh7th/cmp-nvim-lua" -- Neovim lua config completions

    -- Snippets
    use "L3MON4D3/LuaSnip" -- Snippet engine
    use "rafamadriz/friendly-snippets" -- Extend snippets

    -- Show functions signatures
    use "ray-x/lsp_signature.nvim"

    -- Autopairs
    use 'windwp/nvim-autopairs'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- LSP manager
    use 'neovim/nvim-lspconfig'
    use "williamboman/nvim-lsp-installer" -- To install easily LSP servers

    -- Comments
    use 'numToStr/Comment.nvim'

    -- Comments generator
    use { "danymat/neogen", requires = "nvim-treesitter/nvim-treesitter" }

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }

    -- Manage projects directories
    use 'ahmedkhalf/project.nvim'

    -- Tree File Explorer
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }

    -- Status line
    use { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

    -- Git
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- Colorsheme
    use 'sainnhe/gruvbox-material'

    -- Words highlighting
    use "RRethy/vim-illuminate"

    -- Markdown preview
    use "ellisonleao/glow.nvim"

    -- Better Rust LSP support
    use { "simrat39/rust-tools.nvim", requires = { { "nvim-lua/plenary.nvim" }, { "mfussenegger/nvim-dap" } } }

    -- Scala LSP support (not using lspconfig for Scala)
    use({ 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } })

    -- For fun
    use 'eandrju/cellular-automaton.nvim'

    -- Automatically set up the plugins after cloning packer.nvim
    -- This must be after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
