vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {"*.c","*.h"},
  callback = function()
    vim.fn.system("clang-format -i " .. vim.fn.expand("%"))

    vim.cmd('silent! checktime')
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopeFindPre",
  callback = function() end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.js", "*.jsx", "*.ts", "*.tsx", "*.json", "*.html", "*.css", "*.md"}, -- adapte selon tes besoins
  callback = function()
    -- Formatte le fichier directement dans le buffer sans sauvegarde initiale
    require('prettier').format()
    -- Sauvegarde après formatage pour éviter les multiples actions
    vim.cmd('silent! noautocmd write')
  end,
})
