return {
  'hrsh7th/nvim-cmp',           -- Autocomplétion
  'hrsh7th/cmp-nvim-lsp',       -- Source LSP pour nvim-cmp
  'saadparwaiz1/cmp_luasnip',   -- Source pour les snippets
  'L3MON4D3/LuaSnip',           -- Snippets Lua
  config = function()
    -- Configuration de nvim-cmp
    local cmp = require'cmp'
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)  -- Utilise luasnip pour les snippets
        end,
      },
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      },
      sources = {
        { name = 'nvim_lsp' },      -- Source LSP pour la complétion
        { name = 'luasnip' },       -- Source pour les snippets Lua
      },
    })
  end
}

