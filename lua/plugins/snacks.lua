return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      row = 10,
      preset = {
        header = [[
▓█████▄  ▒█████   ██▓     ▒█████   ██▀███  ▓█████   ██████
▒██▀ ██▌▒██▒  ██▒▓██▒    ▒██▒  ██▒▓██ ▒ ██▒▓█   ▀ ▒██    ▒
░██   █▌▒██░  ██▒▒██░    ▒██░  ██▒▓██ ░▄█ ▒▒███   ░ ▓██▄
░▓█▄   ▌▒██   ██░▒██░    ▒██   ██░▒██▀▀█▄  ▒▓█  ▄   ▒   ██▒
░▒████▓ ░ ████▓▒░░██████▒░ ████▓▒░░██▓ ▒██▒░▒████▒▒██████▒▒
 ▒▒▓  ▒ ░ ▒░▒░▒░ ░ ▒░▓  ░░ ▒░▒░▒░ ░ ▒▓ ░▒▓░░░ ▒░ ░▒ ▒▓▒ ▒ ░
 ░ ▒  ▒   ░ ▒ ▒░ ░ ░ ▒  ░  ░ ▒ ▒░   ░▒ ░ ▒░ ░ ░  ░░ ░▒  ░ ░
 ░ ░  ░ ░ ░ ░ ▒    ░ ░   ░ ░ ░ ▒    ░░   ░    ░   ░  ░  ░
   ░        ░ ░      ░  ░    ░ ░     ░        ░  ░      ░
 ░
        ]]
      },
      formats = {
        icon = function(item)
          if item.file and item.icon == "file" or item.icon == "directory" then
            return M.icon(item.file, item.icon)
          end
          return { item.icon, width = 2, hl = "icon" }
        end,
        footer = { "%s", align = "center" },
        header = { "%s", align = "center" },
        file = function(item, ctx)
          local fname = vim.fn.fnamemodify(item.file, ":~")
          fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
          if #fname > ctx.width then
            local dir = vim.fn.fnamemodify(fname, ":h")
            local file = vim.fn.fnamemodify(fname, ":t")
            if dir and file then
              file = file:sub(-(ctx.width - #dir - 2))
              fname = dir .. "/…" .. file
            end
          end
          local dir, file = fname:match("^(.*)/(.+)$")
          return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
        end,
      },
      sections = {
        { section = "header" },
        { section = "keys",  gap = 1, padding = 1 },
        -- { section = "startup" },
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3500,
    },
    quickfile = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true },
      }
    },
    lazygit = {
    }
  },
  keys = {
    { "<leader>z",  function() Snacks.zen() end,                   desc = "Toggle zen mode" },
    { "<leader>Z",  function() Snacks.zen.zoom() end,              desc = "Toggle zen zoom" },
    { "<leader>gB", function() Snacks.gitbrowse() end,             desc = "Git Browse" },
    { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
  }
}
