return {
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup {}
    end,
  },
  {
    "folke/tokyonight.nvim",
    as = "tokyonight",
    config = function()
      require("tokyonight").setup {}
    end,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    -- todo - make it always load
    config = function()
      require("lsp_lines").setup()
    end,
  },
}
