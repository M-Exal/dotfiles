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

