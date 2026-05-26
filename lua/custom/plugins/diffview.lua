return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = '[G]it [D]iffview (working tree)' },
    { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = '[G]it file [H]istory (current file)' },
    { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = '[G]it [H]istory (repo)' },
    { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = '[G]it diffview [C]lose' },
  },
  opts = {},
}
