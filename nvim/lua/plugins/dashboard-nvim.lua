return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      shortcut_type = 'number'
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'} }
}
