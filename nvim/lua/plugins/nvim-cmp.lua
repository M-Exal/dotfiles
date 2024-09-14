-- ~/.config/nvim/lua/plugins/nvim-cmp.lua
return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',    -- Source pour les mots dans le buffer
    'hrsh7th/cmp-path',      -- Source pour les chemins de fichiers
    'hrsh7th/cmp-cmdline',   -- Source pour la ligne de commande
    {
      'hrsh7th/cmp-nvim-lsp',
      version = "v1.39.8", -- Force l'installation de la version 1.39.8
    },
    'L3MON4D3/LuaSnip',      -- Snippets pour compléter
    'saadparwaiz1/cmp_luasnip',  -- Source pour LuaSnip
    'nvim-tree/nvim-web-devicons', -- icons integration
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    local kind_icons = 
    {
      Text = "",
      Method = " ",
      Function = "󰡱 ",
      Constructor = " ",
      Field = "ﰠ",
      Variable = "󱃼 ",
      Class = " ",
      Interface = " ",
      Module = " ",
      Property = "ﰠ",
      Unit = " ",
      Value = "",
      Enum = " ",
      Keyword = "",
      Snippet = " ",
      Color = " ",
      File = " ",
      Reference = " ",
      Folder = " ",
      EnumMember = " ",
      Constant = " ",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    }

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Valide avec Entrée
      }),
      formatting = {
        format = function(entry, vim_item)
          -- Ajoute des icônes aux suggestions
          vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind] or '', vim_item.kind)
          return vim_item
        end
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
        { name = 'path' },
      })
    })

    -- Configuration spécifique pour cmp-cmdline
    -- cmp.setup.cmdline('/', {
    --   sources = {
    --     { name = 'buffer' }
    --   }
    -- })

    -- cmp.setup.cmdline(':', {
    --   sources = cmp.config.sources({
    --     { name = 'path' }
    --   }, {
    --     { name = 'cmdline' }
    --   })
    -- })
  end
}
