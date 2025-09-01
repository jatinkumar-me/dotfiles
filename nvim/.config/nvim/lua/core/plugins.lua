-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'tpope/vim-sleuth',

    -- LSP related plugins
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },

    },
  },
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  'mfussenegger/nvim-jdtls',
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  -- Github Copilot and Copilot chat
  'github/copilot.vim',
  'CopilotC-Nvim/CopilotChat.nvim',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',          opts = {} },

  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  "rebelot/kanagawa.nvim",

  -- Autopair and autotag plugins
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',

  'tpope/vim-surround',
  'norcalli/nvim-colorizer.lua',
  'nvim-lualine/lualine.nvim',

  -- Nvim tree and webdebicons
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',

  --Latex
  'lervag/vimtex',

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {}
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',         opts = {} },

  { 'folke/todo-comments.nvim',      opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-tree-docs'
    },
    build = ":TSUpdate",
  },

  -- Highlight, current variable
  'RRethy/vim-illuminate',

  -- Debugging related plugins
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  "theHamsta/nvim-dap-virtual-text",
  "leoluz/nvim-dap-go",
  "mxsdev/nvim-dap-vscode-js",
  "nvim-neotest/nvim-nio",
  "microsoft/vscode-js-debug",

  -- REST Client
  {
    "rest-nvim/rest.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    }
  },

  -- GIT Blame plugin
  'https://github.com/f-person/git-blame.nvim.git',

  -- Database plugin
  {
    'tpope/vim-dadbod',
    dependencies = {
      'kristijanhusak/vim-dadbod-ui',
      'kristijanhusak/vim-dadbod-completion',
    },
  },

}, {
  defaults = { lazy = false, version = nil },
  checker = { enabled = true, notify = false },
  debug = false,
})
