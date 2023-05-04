return {
  {
    "catppuccin/nvim",
    as = "",
    config = function()
      require("catppuccin").setup {}
    end,
  },
  {
    "folke/tokyonight.nvim",
    as = "",
    config = function()
      require("tokyonight").setup {}
    end,
  },
}
