return {
  'mbbill/undotree',
  config = function()
    vim.keymap.set("n", "<c-z>", vim.cmd.UndotreeToggle, { desc = "Toggle Undo Tree", noremap = true, silent = true })
  end
}
