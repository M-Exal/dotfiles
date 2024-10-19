return {
  'Yggdroot/indentline',
  lazy = false,
  priority = 1000,
  config = function()
    -- Configure les options de indentline ici
    vim.g.indentLine_enabled = 1            -- Active le plugin
    vim.g.indentLine_char = '|'             -- Caractère utilisé pour les lignes d'indentation
    -- vim.g.indentLine_concealcursor = '2'    -- Cela permet de masquer le caractère en mode d'insertion
    vim.g.indentLine_color_gui = '#808080'  -- Couleur pour les lignes (change-la selon tes préférences)
  end
}

