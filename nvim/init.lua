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
  --{'feline-nvim/feline.nvim'},
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
  {
    'neoclide/coc.nvim',
    branch = 'release'
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


if vim.fn.argc() == 0 then
  vim.cmd("autocmd VimEnter * :Dashboard") --open dashboard on startup
end

-- consider .es6 as js 
vim.api.nvim_exec([[
  autocmd BufNewFile,BufRead *.es6 set filetype=javascript
]], false)
-- consider .scss as css
vim.api.nvim_exec([[
    autocmd BufNewFile,BufRead *.scss set filetype=css
]], false)

-- consider .scss as css
vim.api.nvim_exec([[
    autocmd BufNewFile,BufRead *.rb set filetype=ruby
]], false)

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


-- Coc config
-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)


-- Configuration de Prettier
vim.api.nvim_exec([[
  autocmd BufWritePre *.js,*.jsx,*.html,*.rb,*.es6 PrettierAsync
  autocmd BufWritePre * match ExtraWhitespace /\s\+$/
]], false)

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

--vim.api.nvim_create_autocmd("BufWritePost", {
--  pattern = "*.c",
--  callback = function()
--    -- Notify when clang-format is being applied
--    print("Running clang-format...")
--
--    -- Run clang-format
--    vim.fn.system("clang-format -i " .. vim.fn.expand("%"))
--
--    -- Force reload of the current buffer
--    vim.api.nvim_command('checktime')
--  end,
--})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.c",
  callback = function()
    -- Run clang-format silently
    vim.fn.system("clang-format -i " .. vim.fn.expand("%"))

    -- Force reload of the current buffer without showing the message
    vim.cmd('silent! checktime')
  end,
})

