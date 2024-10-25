return {
    -- autres plugins
    {
        'MunifTanjim/eslint.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('eslint').setup({
                bin = 'eslint', -- Peut être un chemin personnalisé si nécessaire
                diagnostics = {
                    enable = true,
                },
                code_actions = {
                    enable = true,
                },
                on_attach = function(bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            vim.cmd("EslintFixAll")
                        end
                    })
                end,
            })
        end
    }
}

