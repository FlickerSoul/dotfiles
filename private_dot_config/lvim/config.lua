--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "lunar"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- change tab with shift
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- jump
lvim.keys.normal_mode["<C-i>"] = "<C-o>"
lvim.keys.normal_mode["<C-o>"] = "<C-i>"

lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<cr>", "Go to References" }
lvim.lsp.buffer_mappings.normal_mode["gd"] = { "<cmd>Telescope lsp_definitions<cr>", "Go to Definition" }

lvim.keys.normal_mode["fr"] = "<cmd>Lspsaga rename<CR>"
lvim.keys.normal_mode["K"] = "<cmd>Lspsaga hover_doc<CR>"

lvim.keys.normal_mode["gi"] = "<cmd>Telescope lsp_incoming_calls<cr>"
lvim.keys.normal_mode["go"] = "<cmd>Telescope lsp_outgoing_calls<cr>"
lvim.keys.normal_mode["gt"] = "<cmd>VimtexView<cr>"


-- error next
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']e', vim.diagnostic.goto_next, opts)
-- relative line number
vim.opt.relativenumber = true
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
lvim.builtin.which_key.mappings["s"].r = { "<cmd>Telescope resume<cr>", "Resume Last" }


lvim.builtin.which_key.mappings["-"] = { "<cmd>sp<cr>", "Split Panel" }
lvim.builtin.which_key.mappings["|"] = { "<cmd>vsp<cr>", "Split Panel Vertically" }
lvim.builtin.which_key.mappings["i"] = {
  name = "+Terms",
  f = { "<cmd>ToggleTerm<cr>", "Open Terminal Float" },
  t = { "<cmd>ToggleTerm direction=tab<cr>", "Open Terminal Tab" }
}

-- format
lvim.builtin.which_key.mappings["l"]["f"] = {
  function()
    require("lvim.lsp.utils").format({ timeout_ms = 2000 })
  end,
  "LSP format",
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "vue",
  "html",
  "latex",
  "toml",
  "scss",
  "make",
  "markdown",
  "markdown_inline",
  "llvm"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.indent = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>


lvim.lsp.on_attach_callback = function(client, bufnr)
  -- local function buf_set_option(...)
  --   vim.api.nvim_buf_set_option(bufnr, ...)
  -- end
  --Enable completion triggered by <c-x><c-o>
  -- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  require "lsp_signature".on_attach({}, bufnr)
end

vim.keymap.set({ 'n' }, '<Leader>K', function()
  require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.keymap.set({ 'n' }, '<Leader>k', function()
  vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'toggle signature' })


-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local null_ls_builtins = require("null-ls").builtins


local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  null_ls_builtins.formatting.black,
  null_ls_builtins.formatting.isort,
  {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
    command = "eslint",
    extra_args = { "--fix-dry-run", "--format", "json", "--stdin", "--stdin-filename", "$FILENAME" }
  },
  {
    command = "latexindent",
    filetypes = { "tex" },
    args = { "-" }
  },
  null_ls_builtins.formatting.swiftformat,
  null_ls_builtins.formatting.rustfmt,

  -- {
  --   -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --   command = "prettier",
  --   ---@usage arguments to pass to the formatter
  --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   extra_args = { "--print-with=100", "--line-width=80" },
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "typescript", "typescriptreact", "vue" },
  -- },
}


-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  --   { command = "flake8", filetypes = { "python" } },
  --   {
  --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "shellcheck",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--severity", "warning" },
  --   },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "python", "vue", "markdown", "tex", "markdown" },
  },
}

-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    "ray-x/lsp_signature.nvim",
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
  -- { "github/copilot.vim" },
  {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      require("copilot").setup {
        panel = {
          auto_refresh = true,
        },
        suggestion = {
          auto_trigger = true,
        },
        filetypes = {
          yaml = true,
          markdown = true,
          gitcommit = true,
        },
        plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
      }
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
  },
  { "lervag/vimtex" },
  { "tpope/vim-surround" },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup {
        autotag = {
          enable = true,
        }
      }
    end
  },
  { "easymotion/vim-easymotion" },
  { 'nacro90/numb.nvim' },
  { "HiPhish/nvim-ts-rainbow2", },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript", "vue", "ts", "js" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
      "numToStr/Comment.nvim",        -- Optional
      "nvim-telescope/telescope.nvim" -- Optional
    }
  },
  { 'keith/swift.vim' },
}

-- rainbow parentheses
lvim.builtin.treesitter.rainbow = {
  enable = true,
}

-- copilot setup
lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.tex", "*.md" },
  -- enable wrap mode for json files only
  callback = function()
    vim.cmd [[setlocal wrap]]

    vim.cmd [[nnoremap <buffer> j gj]]
    vim.cmd [[nnoremap <buffer> k gk]]
    vim.cmd [[nnoremap <buffer> 0 g0]]
    vim.cmd [[nnoremap <buffer> $ g$]]

    vim.cmd [[nnoremap <buffer> gj j]]
    vim.cmd [[nnoremap <buffer> gk k]]
    vim.cmd [[nnoremap <buffer> g0 0]]
    vim.cmd [[nnoremap <buffer> g$ $]]

    vim.cmd [[vnoremap <buffer> j gj]]
    vim.cmd [[vnoremap <buffer> k gk]]
    vim.cmd [[vnoremap <buffer> 0 g0]]
    vim.cmd [[vnoremap <buffer> $ g$]]

    vim.cmd [[vnoremap <buffer> gj j]]
    vim.cmd [[vnoremap <buffer> gk k]]
    vim.cmd [[vnoremap <buffer> g0 0]]
    vim.cmd [[vnoremap <buffer> g$ $]]
  end
})

vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_view_method = "sioyek"
vim.g.vimtex_delim_toggle_mod_list = { { '\\left', '\\right' }, { '\\big', '\\big' } }


vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})


-- custom setup of auto pairs
require("auto_pairs")


-- require("lvim.lsp.manager").setup("volar", {
--   filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
-- })

local lsp = require("lspconfig")

-- unmap all preset buffer keymaps, use lspsaga instead
-- lvim.lsp.buffer_mappings.normal_mode = {}
lsp.volar.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
}
lsp.tailwindcss.setup {
  root_dir = function(fname)
    return lsp.util.root_pattern("tailwind.config.js", "tailwind.config.ts", "postcss.config.js", "postcss.config.ts",
          "package.json", ".git")(fname) or
        lsp.util.path.dirname(fname)
  end
}
lsp.sourcekit.setup {}

-- setup telescope
lvim.builtin.telescope.defaults.file_ignore_patterns = { "node_modules", ".git" }
