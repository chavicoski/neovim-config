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
  print "Error loading packer"
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

return packer.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Autocompletion
  use 'hrsh7th/nvim-compe'

  -- Show functions signatures
  use "ray-x/lsp_signature.nvim"

  -- Autopairs
  use 'windwp/nvim-autopairs'

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- LSP manager
  use 'neovim/nvim-lspconfig'

  -- Telescope
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}

  -- Manage projects directories
  use 'ahmedkhalf/project.nvim'

  -- Tree File Explorer
  use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}

  -- Better Rust LSP support
  use 'simrat39/rust-tools.nvim' -- Requires telescope, popup and plenary

  -- Status line
  use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}

  -- Git
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

  -- Colorsheme
  use 'sainnhe/gruvbox-material'

  -- Markdown preview
  use {"ellisonleao/glow.nvim"}

  -- Automatically set up the plugins after cloning packer.nvim
  -- This must be after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
