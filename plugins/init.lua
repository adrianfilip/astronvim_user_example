require "telescope".setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    as = "tokyonight",
    config = function()
      require("tokyonight").setup {}
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    as = "gruvbox",
    config = function()
      require("gruvbox").setup {}
    end,
  },
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    config = function()
      vim.o.background = 'dark' -- or 'light'
      vim.cmd.colorscheme 'solarized'
    end,
  },
  -- {
  --   "nordtheme/nord.nvim",
  --   lazy = false,
  -- },
  -- {
  --   'whatyouhide/vim-gotham',
  --   lazy = false
  -- },
  -- needed by darcula-solid
  {
    "rktjmp/lush.nvim"
  },
  {
    "briones-gabriel/darcula-solid.nvim",
    requires = "rktjmp/lush.nvim",
    lazy = false,
  },
  { "EdenEast/nightfox.nvim", lazy = false},
  {"savq/melange-nvim", lazy = false},
  {"sainnhe/sonokai", lazy = false},
  {"sainnhe/everforest", lazy = false},
  {"sainnhe/gruvbox-material",lazy = false},
  {"catppuccin/nvim", lazy = false },
}
