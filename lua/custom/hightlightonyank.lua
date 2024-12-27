vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "Highlight on yank",
  group = vim.api.nvim_create_augroup('kickstart-hightlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    print("yoink'd")
  end
})
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "Highlight on yank",
  group = vim.api.nvim_create_augroup('kickstart-hightlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    print("yoink'd")
  end
})
