-- PLUGINS CONFIGURATION
return {
  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
      })
      vim.cmd.colorscheme "catppuccin"
    end
  },

  -- Telescope (Fuzzy Finder)
  {
    'nvim-telescope/telescope.nvim', 
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({})
      -- Load the fzf native extension for blazing fast sorting
      telescope.load_extension("fzf")

      -- Keymaps specific to Telescope
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-z>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>gr', builtin.live_grep, {})
    end
  },

  -- Treesitter (Syntax Highlighting)
  {
    'nvim-treesitter/nvim-treesitter',
    branch = "master",
    event = { "BufReadPre", "BufNewFile" },
    build = ':TSUpdate',
    config = function()

      require('nvim-treesitter.configs').setup({
        ensure_installed = { 
          "javascript", "typescript", "tsx", "html", "css", 
          "json", "jsonc", "regex", "python", "sql",
          "bash", "dockerfile", "lua", "vim", "vimdoc", "query", 
          "markdown", "markdown_inline", "c", "cpp"
        },
        highlight = {
          enable = true, 
          additional_vim_regex_highlighting = false,
        },
      })
    end
  },

 -- Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
  },
  
}
