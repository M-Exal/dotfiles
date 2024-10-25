return {
  'lewis6991/gitsigns.nvim',
  tag = 'v0.6',  -- Tu peux mettre à jour cette version ou utiliser la branche "main"
  dependencies = { 'nvim-lua/plenary.nvim' },  -- Dépendance nécessaire pour le plugin
  config = function()
    require('gitsigns').setup {
      signs = {
        add          = {hl = 'GitGutterAdd', text = '+', numhl='GitSignsAddNr', linehl='GitSignsAddLn'},
        change       = {hl = 'GitGutterChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitGutterDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitGutterDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitGutterChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      },
      -- Les configurations supplémentaires peuvent être modifiées ici selon tes besoins
      current_line_blame = true,  -- Ajoute une information de blame sur la ligne actuelle
    }
  end
}
