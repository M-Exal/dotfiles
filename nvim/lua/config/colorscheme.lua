vim.opt.termguicolors = true  -- Assure-toi que termguicolors est activé pour une meilleure gestion des couleurs
-- define your colorscheme here
local colorscheme = 'nightfox'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end

