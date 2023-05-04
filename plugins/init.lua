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
}
