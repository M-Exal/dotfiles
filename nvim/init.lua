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

-- Helper function to require all plugins from ~/.config/nvim/lua/plugins
local function load_plugins()
  local plugins = {}
  local plugin_files = vim.fn.globpath("~/.config/nvim/lua/plugins", "*.lua", false, true)
  for _, file in ipairs(plugin_files) do
    local plugin = dofile(file)
    table.insert(plugins, plugin)
  end
  return plugins
end

vim.opt.termguicolors = true
require("lazy").setup(load_plugins())
require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
require("config.options")
require("config.mappings")
require("config.autocmds")
