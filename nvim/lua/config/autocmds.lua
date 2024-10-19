vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.c,*.h",
  callback = function()
    vim.fn.system("clang-format -i " .. vim.fn.expand("%"))

    vim.cmd('silent! checktime')
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopeFindPre",
  callback = function() end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
    })
  end,
})
