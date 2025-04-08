return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    -- Fonction de base pour attacher l'autocomplétion et autres fonctionnalités LSP
    local on_attach = function(client, bufnr)
      -- Active les capacités de LSP
      client.server_capabilities.completionProvider = true
      client.server_capabilities.gotoDefinitionProvider = true
      client.server_capabilities.hoverProvider = true

      -- Complétion via cmp-nvim-lsp
      local capabilities = cmp_nvim_lsp.default_capabilities()
      client.server_capabilities = vim.tbl_extend('keep', client.server_capabilities, capabilities)
    end

    -- Configuration de pyright pour Python
    lspconfig.pyright.setup{
      on_attach = on_attach
    }

    -- Configuration de clangd pour C/C++/ObjC
    lspconfig.clangd.setup{
      cmd = { "clangd" },
      filetypes = { "c", "cpp", "objc", "objcpp" },
      root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
      on_attach = on_attach
    }
  end
}
