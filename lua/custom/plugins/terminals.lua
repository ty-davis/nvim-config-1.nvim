-- vim.keymap.set('t', '<C-m>', 'maybe so', { noremap = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', { noremap = true })
vim.keymap.set('t', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('t', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('t', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('t', '<C-l>', '<C-w>l', { noremap = true })


local function open_terminal()
  local height = vim.api.nvim_win_get_height(0)
  vim.cmd(height - 15 .. ' split')
  vim.cmd('wincmd j')
  vim.cmd('terminal')
end

vim.api.nvim_create_user_command('Term', open_terminal, {})

local function open_terminal_2()
  local height = vim.api.nvim_win_get_height(0)
  vim.cmd(height - 15 .. ' split')
  vim.cmd('wincmd j')
  vim.cmd('vs')
  vim.cmd('terminal')
  vim.cmd('wincmd l')
  vim.cmd('terminal')
end

vim.api.nvim_create_user_command('Term2', open_terminal_2, {})

local function terminal_below(count)
  height = vim.api.nvim_win_get_height(0)
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

local function test_stuff(params)
  print(params)
end

vim.api.nvim_create_user_command('TestABCD', function (args)
  terminal_below(2)
  end, {nargs="*"})

return {
  ""
}
