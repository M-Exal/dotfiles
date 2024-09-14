return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require('lspconfig')

    lspconfig.pyright.setup{}

    lspconfig.clangd.setup{
      cmd = { "clangd" },
      filetypes = { "c", "cpp", "objc", "objcpp" },
      root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")
    }

    local on_attach = function(client, bufnr)
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    client.server_capabilities.completionProvider = true
    client.server_capabilities.gotoDefinitionProvider = true
    client.server_capabilities.hoverProvider = true

    local capabilities = cmp_nvim_lsp.default_capabilities()
    client.server_capabilities = vim.tbl_extend('keep', client.server_capabilities, capabilities)
    end

    lspconfig.pyright.setup{
      on_attach = on_attach
    }
    lspconfig.clangd.setup{
      on_attach = on_attach
    }
  end
}
