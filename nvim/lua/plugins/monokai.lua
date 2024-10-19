return {
  'tanvirtin/monokai.nvim',
  lazy = false,
  priority = 1000,  -- pour s'assurer que le thème est chargé en priorité
    config = function()
    -- Choisir la palette ici
    -- Pour une palette par défaut, utilise :
    -- require('monokai').setup {}

    -- Pour utiliser la palette "pro", décommente la ligne suivante :
    -- require('monokai').setup { palette = require('monokai').pro }

    -- Pour utiliser la palette "soda", décommente la ligne suivante :
    -- require('monokai').setup { palette = require('monokai').soda }

    -- Pour utiliser la palette "ristretto", décommente la ligne suivante :
    require('monokai').setup { palette = require('monokai').ristretto }
    end
}
