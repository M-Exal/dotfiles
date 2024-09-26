vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.c",
  callback = function()
    vim.fn.system("clang-format -i " .. vim.fn.expand("%"))

    vim.cmd('silent! checktime')
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopeFindPre",
  callback = function() end,
})

