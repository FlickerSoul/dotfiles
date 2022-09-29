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
  use "williamboman/nvim-lsp-installer"  -- the lsp installer 
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  -- comment 
  use {'numToStr/Comment.nvim', config = function()
    require('Comment').setup()
  end}
  -- indent 
  use "lukas-reineke/indent-blankline.nvim"
  use 'nvim-treesitter/nvim-treesitter'
  -- nvim lua
  use 'nvim-lualine/lualine.nvim'
  -- auto complete 
  use 'ms-jpq/coq_nvim'
  use 'ms-jpq/coq.artifacts'
  use 'ms-jpq/coq.thirdparty'
  -- tex 
  use 'lervag/vimtex'
  -- telescope fuzzy search 
  use {
	'nvim-telescope/telescope.nvim', tag = '0.1.0',
	requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'marioortizmanero/adoc-pdf-live.nvim',
    config = "require('adoc_pdf_live').setup()"
  }
  -- use 'mhartington/formatter.nvim'
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
