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
-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- make and execute c code
vim.keymap.set('n', '<space>m', function()
  -- Obtenir le nom du fichier actuel sans l'extension .c
  local file = vim.fn.expand('%:r')
  
  -- Exécuter la commande make et lancer le binaire correspondant
  vim.cmd(':make && ./' .. file)
end, {desc = 'MakeExec'})


vim.keymap.set('n', '<space>mc', function()
    vim.cmd(':make clean')
    end, {desc = 'MakeClean'})

-- compile c code
vim.keymap.set('n', '<space>c', function()
  -- Obtenir le nom du fichier actuel avec et sans l'extension .c
  local file = vim.fn.expand('%:t')  -- Nom du fichier actuel avec extension
  local file_no_ext = vim.fn.expand('%:t:r')  -- Nom du fichier sans extension

  -- Compiler le fichier
  local compile_cmd = 'gcc -Wextra -Wall -Werror -Wvla -std=c99 -pedantic ' .. file .. ' -o ' .. file_no_ext .. ' '
  local compile_result = vim.fn.system(compile_cmd)

  -- Vérifier si la compilation a échoué
  if compile_result ~= '' then
    print("Erreur de compilation :")
    print(compile_result)
    return
  end

  -- Exécuter le fichier compilé
  vim.cmd('!./' .. file_no_ext)
end, {desc = 'MakeExec'})

vim.keymap.set('n', '<space>v', function()
  -- Obtenir le nom du fichier actuel sans l'extension .c
  local file = vim.fn.expand('%:r')
  
  -- Exécuter la commande make et lancer le binaire correspondant
  vim.cmd(':!valgrind ./' .. file)
end, {desc = 'ValgrindC'})

-- compile and launch test criterion
vim.keymap.set('n', '<space>ct', function()
  -- Obtenir le nom du fichier actuel avec et sans l'extension .c
  local file = vim.fn.expand('%:t')  -- Nom du fichier actuel avec extension
  local file_no_ext = vim.fn.expand('%:t:r')  -- Nom du fichier sans extension

  -- Compiler le fichier
  local compile_cmd = 'gcc -Wextra -Wall -Werror -Wvla -std=c99 -pedantic ' .. file .. ' -o ' .. file_no_ext .. ' -lcriterion'
  local compile_result = vim.fn.system(compile_cmd)

  -- Vérifier si la compilation a échoué
  if compile_result ~= '' then
    print("Erreur de compilation :")
    print(compile_result)
    return
  end

  -- Exécuter le fichier compilé
  vim.cmd('!./' .. file_no_ext)
end, {desc = 'MakeExec'})

vim.keymap.set('n', '<space>v', function()
  -- Obtenir le nom du fichier actuel sans l'extension .c
  local file = vim.fn.expand('%:r')
  
  -- Exécuter la commande make et lancer le binaire correspondant
  vim.cmd(':!valgrind ./' .. file)
end, {desc = 'ValgrindC'})
