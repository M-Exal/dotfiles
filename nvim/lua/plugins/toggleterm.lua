return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup{
            -- Vos configurations ici, si nécessaire
            direction = 'float'
    }
    end,
}
