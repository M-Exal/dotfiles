return {
  'EdenEast/nightfox.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('nightfox').setup {
      options = {
        styles = { comments = "italic" },
      }
    }
    vim.cmd('colorscheme nightfox')
  end
}

