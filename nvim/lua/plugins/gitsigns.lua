vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitGutterAdd' })
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsAddLn' })
vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAddNr' })

vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitGutterChange' })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitSignsChangeLn' })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' })

vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitGutterChange' })
vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = 'GitSignsChangeLn' })
vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' })

vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitGutterDelete' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDeleteLn' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr' })

vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitGutterDelete' })
vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = 'GitSignsDeleteLn' })
vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' })
