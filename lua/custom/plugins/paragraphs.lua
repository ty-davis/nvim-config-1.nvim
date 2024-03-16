local single_line_command = '"050lf\\<space>r\\<CR>"'

local function fix_paragraph()
  vim.api.nvim_command('normal vipJ')
  for _ = 1, 100 do
    -- vim.api.nvim_command('normal 050lf r')
    vim.api.nvim_command('execute "normal" ' .. single_line_command)
  end
  vim.api.nvim_command('normal o')
end


vim.keymap.set('n', '<C-m>', function() fix_paragraph() end, { noremap = true })

return {
  ""
}
