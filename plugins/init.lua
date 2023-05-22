return {
  {
    "catppuccin/nvim",
    lazy = false,
    as = "catppuccin",
    config = function()
      require("catppuccin").setup {}
    end,
  },
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
    'shaunsingh/nord.nvim',
    lazy = false,
    as = "nord",
    config = function()
      require("nord").set()
    end,
  },
  {
    'whatyouhide/vim-gotham',
    lazy = false
  },
  {
    "rktjmp/lush.nvim"
  },
  {
    "briones-gabriel/darcula-solid.nvim",
    requires = "rktjmp/lush.nvim",
    lazy = false,
  },
  { "EdenEast/nightfox.nvim" , lazy = false},
  {"savq/melange-nvim", lazy = false},
  {"sainnhe/sonokai", lazy = false},
  {"sainnhe/everforest", lazy = false},
}
