return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy", -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  config = function()
    require('tiny-inline-diagnostic').setup({
      signs = {
        left = "",
        right = "",
        diag = "●",
        arrow = "    ",
        up_arrow = "    ",
        vertical = " │",
        vertical_end = " └"
      },
      hi = {
        error = "DiagnosticError",
        warn = "DiagnosticWarn",
        info = "DiagnosticInfo",
        hint = "DiagnosticHint",
        arrow = "NonText",
        background = "CursorLine", -- Can be a highlight or a hexadecimal color (#RRGGBB)
        mixing_color = "None", -- Can be None or a hexadecimal color (#RRGGBB)
      },
      blend = {
        factor = 0.27,
      },
      options = {
        -- Show the source of the diagnostic
        show_source = true,
        -- Throttle the update of the diagnostic when moving cursor, in milliseconds
        throttle = 20,
        -- The minimum length of the message, otherwise it will be on a new line
        softwrap = 17,
        -- If multiple diagnostics are under the cursor, display all of them
        multiple_diag_under_cursor = false,
        -- Enable diagnostic message on all lines
        multilines = true,
        -- Show all diagnostics on the cursor line
        show_all_diags_on_cursorline = false,
        -- Enable diagnostics on Insert mode
        enable_on_insert = false,
      }
    })
  end
}
