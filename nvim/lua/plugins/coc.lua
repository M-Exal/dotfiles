return {
  'neoclide/coc.nvim',
  branch = 'release',
  config = function()
    -- Keymappings for CoC
    vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true })
    vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
    vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
    vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
    vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })

    -- Simplified tab completion
    vim.cmd [[
      inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
      inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    ]]
  end
}
