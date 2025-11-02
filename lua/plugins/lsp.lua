return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
  },
  config = function()
    require("mason").setup()
    require("fidget").setup()

    local on_attach = function(client, bufnr)
      -- Keybindings
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', '<space>DF', function()
        vim.lsp.buf.format { async = true }
      end, bufopts)
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = { "documentation", "detail", "additionalTextEdits" }
    }

    local servers = {
      "pyright",
      "ts_ls",
      "rust_analyzer",
      "gopls",
      "lua_ls",
      "biome",
    }

    require("mason-lspconfig").setup({
      ensure_installed = servers,
      automatic_enable = true,
    })

    for _, server_name in ipairs(servers) do
      local overrides = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      if server_name == "lua_ls" then
        local lua_opts = {
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              diagnostics = { globals = { 'vim', 'Snack' } },
              workspace = {
                library = {
                  vim.env.VIMRUNTIME,
                  vim.fn.stdpath("config") .. "/lua",
                  vim.fn.stdpath("data") .. "/lazy",
                },
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        }
        overrides = vim.tbl_deep_extend("force", overrides, lua_opts)
      end

      vim.lsp.config(server_name, overrides)
    end
  end,
}
