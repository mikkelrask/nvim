return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },

    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require('lspconfig').lua_ls.setup({
        capabilities = capabilities,
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
      })
      require('lspconfig').ts_ls.setup({capabilities = capabilities})
      require('lspconfig').pyright.setup({capabilities = capabilities})
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          --@diagnostics disable-next-line: missing-parameter
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end
            })
          end
        end
      })
    end
  }
}
