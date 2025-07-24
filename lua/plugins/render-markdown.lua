return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = function()
      require('render-markdown').setup({
        completions = {
          blink = {
            enabled = true
          }
        },
        injections = {
          gitcommit = {
            enabled = true,
            query = [[
              ((message) @injection.content
                (#set! injection.combined)
                (#set! injection.include-children)
                (#set! injection.language "markdown"))
            ]],
          },
        },
        markdown = {
          disable = true,
          directives = {
            { id = 17, name = 'conceal_lines' },
            { id = 18, name = 'conceal_lines' },
          },
        },
        on = {
          attach = function() end,
          initial = function() end,
          render = function() end,
          clear = function() end,
        },
        bullet = {
          left_pad = 2,
          icons = { '⬝', '⮡', '⬞', '◇' },
        },
        pipe_table = { render_modes = true, preset = 'double', alignment_indicator = '┅' },
        link = {
          enabled = true,
          render_modes = true,
          footnote = {
              enabled = true,
              superscript = true,
              prefix = '',
              suffix = '',
          },
          image = '󰥶  ',
          email = '✉ ',
          hyperlink = '󰌹 ',
          highlight = 'RenderMarkdownLink',
        },
        code = {
          sign    = true,
          width   = 'full',
          style   = 'full',
          render_modes = false,
          border = 'thick',
          above   = '▄',
          below   = '▀',
          highlight = 'RenderMarkdownCode',
          highlight_info = 'RenderMarkdownCodeInfo',
          highlight_language = 'all',
          highlight_border = 'RenderMarkdownCodeBorder',
          highlight_fallback = 'RenderMarkdownCodeFallback',
          highlight_inline = 'RenderMarkdownCodeInline',
          left_pad = 2,
          language_name = true,
          language_info = true,
          language_border = ' ',
          language_left = '█',
          language_right = '█',
        },
        heading = {
          width = 'full',
          border = true,
          icons = { 'Ⅰ ', 'Ⅱ ', ' Ⅲ ', ' Ⅳ ', ' Ⅴ ', ' Ⅵ ' },
          border_virtual = true
        },
        quote = {
          icon = '▐ '
        },
        dash = {
          enabled = true,
          render_modes = false,
          icon = '⸏',
          width = 'full',
          left_margin = 0,
          highlight = 'RenderMarkdownDash',
        },
      })
    end
}
