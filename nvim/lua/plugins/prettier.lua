return {
    -- autres plugins
    {
        'MunifTanjim/prettier.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('prettier').setup({
                bin = 'prettier', -- ou indiquer un chemin personnalisé si nécessaire
                filetypes = {
                    "javascript",
                    "typescript",
                    "css",
                    "html",
                    "json",
                    -- ajoute d'autres types de fichiers si nécessaire
                },
            })
        end
    }
}
