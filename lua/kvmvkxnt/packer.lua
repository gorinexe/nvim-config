-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- use ({ "catppuccin/nvim", as = "catppuccin",
  -- config = function()
  -- 	vim.cmd('colorscheme catppuccin-mocha')
  -- end
  -- })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use 'nvim-treesitter/playground'

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })

  use 'mbbill/undotree'

  use 'tpope/vim-fugitive'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons",     -- keep this if you're using NvChad
    config = function()
      require("barbecue").setup()
    end,
  })

  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  use 'romgrk/barbar.nvim'

  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        shortcut = {
          -- action can be a function type
          { desc = string, group = 'highlight group', key = 'shortcut key', action = 'action when you press key' },
        },
        packages = { enable = true }, -- show how many plugins neovim loaded
        -- limit how many projects list, action when you press key or enter it will run this action.
        -- action can be a functino type, e.g.
        -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
        project = { enable = true, limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
        mru = { limit = 10, icon = 'your icon', label = '', },
        footer = {}, -- footer
      }
    end,
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use 'karb94/neoscroll.nvim'
end)
