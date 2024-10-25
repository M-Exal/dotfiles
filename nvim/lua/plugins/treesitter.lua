return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "javascript", "typescript", "lua", "python" }, -- Adapté à tes langages
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
  end,
  build = ":TSUpdate" -- Pour s'assurer que Treesitter est à jour
}
