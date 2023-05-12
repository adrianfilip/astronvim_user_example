return {
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
    ft = { "sbt", "scala", "java" }, -- TODO automatically detect SBT projects and load it.
    config = function()
      local metals_config = require("metals").bare_config()

      metals_config.settings = {
        superMethodLensesEnabled = true,
        showImplicitArguments = true,
        showInferredType = true,
        showImplicitConversionsAndClasses = true,
        excludedPackages = {},
      }

      metals_config.init_options.statusBarProvider = "on"

      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Debug settings if you're using nvim-dap
      local dap = require "dap"

      dap.configurations.scala = {
        {
          type = "scala",
          request = "launch",
          name = "RunOrTest",
          metals = {
            runType = "runOrTestFile",
            --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
          },
        },
        {
          type = "scala",
          request = "launch",
          name = "Test Target",
          metals = {
            runType = "testTarget",
          },
        },
      }

      metals_config.on_attach = function(client, bufnr)
        require("metals").setup_dap()
      end

      -- Autocmd that will actually be in charging of starting the whole thing
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        -- NOTE: You may or may not want java included here. You will need it if you
        -- want basic Java support but it may also conflict if you are using
        -- something like nvim-jdtls which also works on a java filetype autocmd.
        pattern = { "scala", "sbt", "java" },
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    lazy = false,
    config = function()
      require("lsp_lines").setup()
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup(
        {
          panel = {
            enabled = true,
            auto_refresh = false,
            keymap = {
              jump_prev = "[[",
              jump_next = "]]",
              accept = "<CR>",
              refresh = "gr",
              open = "<M-CR>"
            },
            layout = {
              position = "bottom", -- | top | left | right
              ratio = 0.4
            },
          },
          suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 75,
            keymap = {
              accept = "<M-l>",
              accept_word = false,
              accept_line = false,
              next = "<M-t>",
              prev = "<M-h>",
              dismiss = "<C-]>",
            },
          },
          filetypes = {
            yaml = false,
            markdown = false,
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false,
          },
          copilot_node_command = 'node', -- Node.js version must be > 16.x
          server_opts_overrides = {},
        }
      )
    end,
  },
  { 'kevinhwang91/nvim-bqf', ft = 'qf' }
}
