local map = vim.keymap.set
return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      map('n', '-', ":Oil --float .<CR>"),
      default_file_explorer = true,
      skip_confirm_for_simple_edits = false,
      watch_for_changes = false,
      colums = {
        'icon',
        'permissions',
        'size',
        'mtime'
      },
      win_options = {
        wrap = false,

        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
      },
      buf_options = {
        buflisted = false,
        bufhidden = "hide"
      },

      float = {
        -- Padding around the floating window
        padding = 6,
        max_width = 180,
        max_height = 0,
        border = "shadow",
        win_options = {
          winblend = 1,
        },
        -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
        get_win_title = nil,
        -- preview_split: Split direction: "auto", "left", "right", "above", "below".
        preview_split = "auto",
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
      lsp_file_methods = {
        -- Enable or disable LSP file operations
        enabled = true,
        -- Time to wait for LSP file operations to complete before skipping
        timeout_ms = 1000,
        -- Set to true to autosave buffers that are updated with LSP willRenameFiles
        -- Set to "unmodified" to only save unmodified buffers
        autosave_changes = false,
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  }
}
