-- vim.keymap.set('t', '<C-m>', 'maybe so', { noremap = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', { noremap = true })
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { noremap = true })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { noremap = true })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { noremap = true })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { noremap = true })


local function terminal_below(count)
  local height = vim.api.nvim_win_get_height(0)
  vim.cmd(height - 15 .. ' split')
  vim.cmd('wincmd j')
  for i=1,count do
    vim.cmd('terminal')
    if i>1 then
      print(i)
      vim.cmd('vs')
      vim.cmd('wincmd l')
      vim.cmd('terminal')
    end
  end
end

vim.api.nvim_create_user_command('Term', function (args)
  terminal_below(1)
  end, {nargs="*"})

vim.api.nvim_create_user_command('Term2', function (args)
  terminal_below(2)
  end, {nargs="*"})


local function v_terminal_below(count)
  local width = vim.api.nvim_win_get_width(0)
  vim.cmd(width - 50 .. 'vsplit')
  vim.cmd('wincmd l')
  for i=1,count do
    vim.cmd('terminal')
    if i>1 then
      vim.cmd('split')
      vim.cmd('wincmd j')
      vim.cmd('terminal')
    end
  end
end

vim.api.nvim_create_user_command('Vterm', function (args)
  v_terminal_below(1)
  end, {nargs="*"})

vim.api.nvim_create_user_command('Vterm2', function (args)
  v_terminal_below(2)
  end, {nargs="*"})

return {
  ""
}
