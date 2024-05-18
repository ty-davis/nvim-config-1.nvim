-- vim.keymap.set('t', '<C-m>', 'maybe so', { noremap = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', { noremap = true })
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { noremap = true })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { noremap = true })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { noremap = true })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { noremap = true })


local function terminal_below(count)
  vim.cmd('split')
  vim.cmd('wincmd J')
  vim.cmd('res 15')
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

local function v_terminal_right(count)
  vim.cmd('vsplit')
  vim.cmd('wincmd L')
  vim.cmd('vert res 50')
  -- vim.cmd('wincmd l')
  for i=1,count do
    vim.cmd('terminal')
    if i>1 then
      vim.cmd('split')
      vim.cmd('wincmd j')
      vim.cmd('terminal')
    end
  end
end

vim.api.nvim_create_user_command('Term', function (args)
  local vertical = false
  if string.match(args.args, '-v') then
    vertical = true
  end

  local term_count = 1
  for k,v in pairs(args.fargs) do
    if tonumber(v) then
      term_count = v
      break
    end
  end

  if vertical then
    v_terminal_right(term_count)
  else
    terminal_below(term_count)
  end
  end, {nargs="*"})


return {
  ""
}
