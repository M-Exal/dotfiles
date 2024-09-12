local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = "<space>" -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  {'prettier/vim-prettier'},
  {'folke/tokyonight.nvim',
   lazy = false,
   priority = 1000,
   opts = {}},
  {'nvim-tree/nvim-web-devicons'},
  {'nvim-lualine/lualine.nvim'},
  {
    'nvim-tree/nvim-tree.lua',
    version = "*",
    lazy = false,
    config = function()
      require("nvim-tree").setup {
        view = {
          width = 50,
        }
      }
    end
  },
  {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      shortcut_type = 'number'
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
})

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
vim.cmd[[colorscheme tokyonight]]
vim.g.coc_global_extensions = {
  'coc-json',
  'coc-git',
  'coc-eslint',
  'coc-prettier',
  'coc-tsserver',
  'coc-html',
  'coc-angular'
}

-- keymaps 
vim.keymap.set('n', '<space>w', '<cmd>write<cr>', {desc = 'Save'}) --space+s -> write
vim.keymap.set('n', '<space>q', '<cmd>quit<cr>', {desc = 'Quit'}) --space+q -> quit
vim.keymap.set('n', '<space>x', '<cmd>x<cr>', {desc = 'Save+Quit'}) --space+q -> quit
vim.keymap.set('n', '<space>l', ':Lazy<cr>', {desc = 'Lazy'}) --space+l -> lazy
vim.api.nvim_set_keymap('n', '<C-Down>', [[:m +1<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', [[:m -2<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<F1>', ':NvimTreeToggle<cr>', {desc = 'toggle NvimTree'}) -- f1 -> tree
vim.keymap.set('n', '<space>t', ':tabnew<cr> :NvimTreeToggle<cr>')
vim.keymap.set('n', '<F2>', ':tabnext<cr>')
-- clipboard
vim.keymap.set({'n', 'x'}, 'gy', '"+y') -- g+y -> copy
vim.keymap.set({'n', 'x'}, 'gp', '"+p') -- g+p -> paste

require('lualine').setup{
  theme = 'tokyonight'
}
-- Définir le thème
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

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.c",
  callback = function()
    -- Run clang-format silently
    vim.fn.system("clang-format -i " .. vim.fn.expand("%"))

    -- Force reload of the current buffer without showing the message
    vim.cmd('silent! checktime')
  end,
})

