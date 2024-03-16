vim.cmd([[au BufRead, BufNewFile *.md set filetype=markdown]])

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

require('cmp').setup { enabled = false }
