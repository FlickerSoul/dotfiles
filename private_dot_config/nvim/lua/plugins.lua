local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  
  -- cmp auto complete 
  -- use "williamboman/nvim-lsp-installer"  -- the lsp installer 
  -- use {
  --   'hrsh7th/nvim-cmp',
  --   event = "InsertEnter",
  --   requires = {
  --   "hrsh7th/cmp-buffer",
  --   "hrsh7th/cmp-path",
  --   "hrsh7th/cmp-nvim-lua",
  --   "ray-x/cmp-treesitter",
  --   "hrsh7th/cmp-cmdline",
  --   "saadparwaiz1/cmp_luasnip",
  --   "hrsh7th/cmp-calc",
  --   "f3fora/cmp-spell",
  --   }, 
  -- }-- Autocompletion plugin
  -- use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  -- use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  -- use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- comment 
  use {'numToStr/Comment.nvim', config = function()
    require('Comment').setup()
  end}

  -- indent 
  use "lukas-reineke/indent-blankline.nvim"
  use { 
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- nvim lua
  use 'nvim-lualine/lualine.nvim'

  -- coq auto complete 
  use {
      'ms-jpq/coq_nvim',
      event = "InsertEnter",
      requires = {
        'ms-jpq/coq.artifacts',
        'ms-jpq/coq.thirdparty',
      },
      config = function() require('lsp_coq_config') end
  }
  -- use 'ms-jpq/coq.artifacts'
  -- use 'ms-jpq/coq.thirdparty'

  -- tex 
  use 'lervag/vimtex'

  -- telescope fuzzy search 
  use {
	'nvim-telescope/telescope.nvim',
	requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- pdf, but idk why this is not working
  use {
    'marioortizmanero/adoc-pdf-live.nvim',
    config = "require('adoc_pdf_live').setup()"
  }
  -- use 'mhartington/formatter.nvim'

  -- the auto format
  -- use 'Chiel92/vim-autoformat'

  -- the auto surround 
  use 'tpope/vim-surround'

  -- the auto pair
  use {
	"windwp/nvim-autopairs",
    config = function() require("auto_pairs") end
    -- config = function() require("nvim-autopairs").setup {} end
  }

  -- coc Autocompletion
  -- use {'neoclide/coc.nvim', branch = 'release'}

  -- file tree 
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  
  -- which key
  use {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration at 
          -- https://github.com/folke/which-key.nvim#%EF%B8%8F-configuration
        }
    end
  }

  -- cheat sheet
  use {
    'sudormrfbin/cheatsheet.nvim',
    requires = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  }
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

