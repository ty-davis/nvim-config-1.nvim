-- vim.keymap.set('t', '<C-m>', 'maybe so', { noremap = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', { noremap = true })

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


return {
  ""
}
