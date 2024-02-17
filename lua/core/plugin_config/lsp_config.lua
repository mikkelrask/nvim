require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'lua_ls', 'clangd', 'tailwindcss', 'pyright', 'bashls', 'vtsls' },
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local nvim_lsp = require "lspconfig"
nvim_lsp.tsserver.setup {}
nvim_lsp.clangd.setup{}
nvim_lsp.tailwindcss.setup {}
nvim_lsp.vtsls.setup {}
nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  settings = {
	  Lua = {
		  diagnostics = {
			  globals = {
				  'vim'
			  }
		  }
	  }
  }
}
nvim_lsp.pyright.setup {}
nvim_lsp.bashls.setup {}
