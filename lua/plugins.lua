return require('packer').startup(function()
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
end)
