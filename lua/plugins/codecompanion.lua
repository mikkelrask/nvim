return {
  "tpope/vim-sleuth", -- Automatically detects which indents should be used in the current buffer
  {
    "olimorris/codecompanion.nvim", -- The KING of AI programming
    dependencies = {
      "j-hui/fidget.nvim", -- Display status
      "ravitemer/codecompanion-history.nvim", -- Save and load conversation history
      {
        "ravitemer/mcphub.nvim", -- Manage MCP servers
        cmd = "MCPHub",
        build = "npm install -g mcp-hub@latest",
        config = true,
      },
      {
        "HakonHarnes/img-clip.nvim", -- Share images with the chat buffer
        event = "VeryLazy",
        cmd = "PasteImage",
        opts = {
          filetypes = {
            codecompanion = {
              prompt_for_file_name = false,
              template = "[Image]($FILE_PATH)",
              use_absolute_path = true,
            },
          },
        },
      },
      -- { "echasnovski/mini.pick", config = true },
      { "ibhagwan/fzf-lua", config = true },
    },
    opts = {
      extensions = {
        history = {
          enabled = true,
          opts = {
            keymap = "gh",
            auto_generate_title = true,
            continue_last_chat = false,
            delete_on_clearing_chat = false,
            picker = "snacks",
            enable_logging = false,
            dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
          },
        },
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = {
                default = "qwen3:latest",
              },
              num_ctx = {
                default = 20000,
              },
            },
          })
        end,
      },
      prompt_library = {
        ["Test workflow"] = {
          strategy = "workflow",
          description = "Use a workflow to test the plugin",
          opts = {
            index = 4,
          },
          prompts = {
            {
              {
                role = "user",
                content = "Generate a Python class for managing a book library with methods for adding, removing, and searching books",
                opts = {
                  auto_submit = false,
                },
              },
            },
            {
              {
                role = "user",
                content = "Write unit tests for the library class you just created",
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = "user",
                content = "Create a TypeScript interface for a complex e-commerce shopping cart system",
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = "user",
                content = "Write a recursive algorithm to balance a binary search tree in Java",
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = "user",
                content = "Generate a comprehensive regex pattern to validate email addresses with explanations",
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = "user",
                content = "Create a Rust struct and implementation for a thread-safe message queue",
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = "user",
                content = "Create SQL queries for a complex database schema with joins across 4 tables",
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = "user",
                content = "Write a Lua configuration for Neovim with custom keybindings and plugins",
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = "user",
                content = "Generate documentation in JSDoc format for a complex JavaScript API client",
                opts = {
                  auto_submit = true,
                },
              },
            },
          },
        },
      },
      strategies = {
        chat = {
          adapter = "ollama",
          roles = {
            user = "mr",
          },
          keymaps = {
            send = {
              modes = {
                i = { "<C-CR>", "<C-s>" },
              },
            },
            completion = {
              modes = {
                i = "<C-x>",
              },
            },
          },
          slash_commands = {
            ["buffer"] = {
              keymaps = {
                modes = {
                  i = "<C-b>",
                },
              },
            },
            ["fetch"] = {
              keymaps = {
                modes = {
                  i = "<C-f>",
                },
              },
            },
            ["help"] = {
              opts = {
                max_lines = 1000,
              },
            },
            ["image"] = {
              keymaps = {
                modes = {
                  i = "<C-i>",
                },
              },
              opts = {
                dirs = { "~/Documents/Screenshots" },
              },
            },
          },
          tools = {
            opts = {
              auto_submit_success = false,
              auto_submit_errors = false,
            },
          },
        },
        inline = { adapter = "ollama" },
      },
      display = {
        action_palette = {
          provider = "default",
        },
        chat = {
          -- show_references = true,
          -- show_header_separator = false,
          -- show_settings = false,
        },
        diff = {
          provider = "mini_diff",
        },
      },
      opts = {
        log_level = "DEBUG",
      },
    },
    init = function()
      vim.cmd([[cab cc CodeCompanion]])
    end,
  },
  {
    "echasnovski/mini.test", -- Testing framework for Neovim
    config = true,
  },
  {
    "echasnovski/mini.diff", -- Inline and better diff over the default
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        -- Disabled by default
        source = diff.gen_source.none(),
      })
    end,
  },

  {
    "folke/ts-comments.nvim", -- Enhance Neovim's native comments
    opts = {},
    event = "VeryLazy",
  },
  {
    "kylechui/nvim-surround", -- Use vim commands to surround text, tags with brackets, parenthesis etc
    config = true,
  },
  {
    "ThePrimeagen/refactoring.nvim", -- Refactor code like Martin Fowler
    lazy = true,
    keys = {
      {
        "<LocalLeader>rr",
        function()
          require("refactoring").select_refactor()
        end,
        desc = "Refactoring.nvim: Open",
        mode = { "n", "v", "x" },
      },
      {
        "<LocalLeader>rd",
        function()
          require("refactoring").debug.printf({ below = false })
        end,
        desc = "Refactoring.nvim: Insert Printf statement for debugging",
      },
      {
        "<LocalLeader>rv",
        function()
          require("refactoring").debug.print_var({})
        end,
        mode = { "v" },
        desc = "Refactoring.nvim: Insert Print_Var statement for debugging",
      },
      {
        "<LocalLeader>rv",
        function()
          require("refactoring").debug.print_var({ normal = true })
        end,
        desc = "Refactoring.nvim: Insert Print_Var statement for debugging",
      },
      {
        "<LocalLeader>rc",
        function()
          require("refactoring").debug.cleanup()
        end,
        desc = "Refactoring.nvim: Cleanup debug statements",
      },
    },
    config = true,
  },
  {
    "mfussenegger/nvim-dap", -- Debug Adapter Protocol for Neovim
    lazy = true,
    dependencies = {
      "theHamsta/nvim-dap-virtual-text", -- help to find variable definitions in debug mode
      "rcarriga/nvim-dap-ui", -- Nice UI for nvim-dap
      "suketa/nvim-dap-ruby", -- Debug Ruby
      "mfussenegger/nvim-dap-python", -- Debug Python
    },
    keys = {
      {
        "<F1>",
        "<cmd>lua require('dap').toggle_breakpoint()<CR>",
        desc = "Debug: Set breakpoint",
      },
      { "<F2>", "<cmd>lua require('dap').continue()<CR>", desc = "Debug: Continue" },
      { "<F3>", "<cmd>lua require('dap').step_into()<CR>", desc = "Debug: Step into" },
      { "<F4>", "<cmd>lua require('dap').step_over()<CR>", desc = "Debug: Step over" },
      {
        "<F5>",
        "<cmd>lua require('dap').repl.toggle({height = 6})<CR>",
        desc = "Debug: Toggle REPL",
      },
      { "<F6>", "<cmd>lua require('dap').repl.run_last()<CR>", desc = "Debug: Run last" },
      {
        "<F9>",
        function()
          local _, dap = require("dap")
          dap.disconnect()
          require("dapui").close()
        end,
        desc = "Debug: Stop",
      },
    },
    config = function()
      local dap = require("dap")
      require("dap-ruby").setup()
      require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

      ---Show the nice virtual text when debugging
      ---@return nil|function
      local function virtual_text_setup()
        local ok, virtual_text = pcall(require, "nvim-dap-virtual-text")
        if not ok then
          return
        end

        return virtual_text.setup()
      end

      ---Show custom virtual text when debugging
      ---@return nil
      local function signs_setup()
        vim.fn.sign_define("DapBreakpoint", {
          text = "",
          texthl = "DebugBreakpoint",
          linehl = "",
          numhl = "DebugBreakpoint",
        })
        vim.fn.sign_define("DapStopped", {
          text = "",
          texthl = "DebugHighlight",
          linehl = "",
          numhl = "DebugHighlight",
        })
      end

      ---Slick UI which is automatically triggered when debugging
      ---@param adapter table
      ---@return nil
      local function ui_setup(adapter)
        local ok, dapui = pcall(require, "dapui")
        if not ok then
          return
        end

        dapui.setup({
          layouts = {
            {
              elements = {
                "scopes",
                "breakpoints",
                "stacks",
              },
              size = 35,
              position = "left",
            },
            {
              elements = {
                "repl",
              },
              size = 0.30,
              position = "bottom",
            },
          },
        })
        adapter.listeners.after.event_initialized["dapui_config"] = dapui.open
        adapter.listeners.before.event_terminated["dapui_config"] = dapui.close
        adapter.listeners.before.event_exited["dapui_config"] = dapui.close
      end

      dap.set_log_level("TRACE")

      virtual_text_setup()
      signs_setup()
      ui_setup(dap)
    end,
  },
  {
    "stevearc/overseer.nvim", -- Task runner and job management
    opts = {
      component_aliases = {
        default_neotest = {
          "on_output_summarize",
          "on_exit_set_status",
          "on_complete_dispose",
        },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",

      -- Adapters
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-python",
      "olimorris/neotest-rspec",
      "olimorris/neotest-phpunit",
    },
    keys = {
      {
        "<LocalLeader>tn",
        function()
          if vim.bo.filetype == "lua" then
            return require("mini.test").run_at_location()
          end
          require("neotest").run.run()
        end,
        desc = "Neotest: Test nearest",
      },
      {
        "<LocalLeader>tf",
        function()
          if vim.bo.filetype == "lua" then
            return require("mini.test").run_file()
          end
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Neotest: Test file",
      },
      {
        "<LocalLeader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Neotest: Run last test",
      },
      {
        "<LocalLeader>ts",
        function()
          if vim.bo.filetype == "lua" then
            return require("mini.test").run()
          end
          local neotest = require("neotest")
          for _, adapter_id in ipairs(neotest.run.adapters()) do
            neotest.run.run({ suite = true, adapter = adapter_id })
          end
        end,
        desc = "Neotest: Test suite",
      },
      {
        "<LocalLeader>to",
        function()
          require("neotest").output.open({ short = true })
        end,
        desc = "Neotest: Open test output",
      },
      {
        "<LocalLeader>twn",
        function()
          require("neotest").watch.toggle()
        end,
        desc = "Neotest: Watch nearest test",
      },
      {
        "<LocalLeader>twf",
        function()
          require("neotest").watch.toggle({ vim.fn.expand("%") })
        end,
        desc = "Neotest: Watch file",
      },
      {
        "<LocalLeader>twa",
        function()
          require("neotest").watch.toggle({ suite = true })
        end,
        desc = "Neotest: Watch all tests",
      },
      {
        "<LocalLeader>twa",
        function()
          require("neotest").watch.stop()
        end,
        desc = "Neotest: Stop watching",
      },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-plenary"),
          require("neotest-python")({
            dap = { justMyCode = false },
          }),
          require("neotest-rspec"),
          require("neotest-phpunit"),
        },
        consumers = {
          overseer = require("neotest.consumers.overseer"),
        },
        diagnostic = {
          enabled = false,
        },
        log_level = vim.log.levels.TRACE,
        icons = {
          expanded = "",
          child_prefix = "",
          child_indent = "",
          final_child_prefix = "",
          non_collapsible = "",
          collapsed = "",

          passed = "",
          running = "",
          failed = "",
          unknown = "",
          skipped = "",
        },
        floating = {
          border = "single",
          max_height = 0.8,
          max_width = 0.9,
        },
        summary = {
          mappings = {
            attach = "a",
            expand = { "<CR>", "<2-LeftMouse>" },
            expand_all = "e",
            jumpto = "i",
            output = "o",
            run = "r",
            short = "O",
            stop = "u",
          },
        },
      })
    end,
  },
}
