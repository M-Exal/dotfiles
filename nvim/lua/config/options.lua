vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '80'
vim.opt.updatetime = 250
vim.opt.bg = 'dark'
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.wrap = true
vim.opt.ruler = true
vim.opt.breakindent = true
vim.g.mapleader = ' '
vim.cmd[[colorscheme tokyonight]]

-- Rendre l'arrière-plan transparent
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NonText', { bg = 'none' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'none' })
vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'none' })
vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'none' })
