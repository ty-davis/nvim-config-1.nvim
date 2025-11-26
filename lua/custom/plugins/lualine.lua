return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'daurnimator/lua-http',
  },
  opts = {
    options = {
      icons_enabled = true,
      -- theme = 'vscode',
      component_separators = ' | ',
      section_separators = { left = '║', right = '║' },
    },
    sections = {
      lualine_b = { 'filename' },
      lualine_c = { 'branch', 'diff', 'diagnostics' },
      lualine_z = {
        'location',
        function()
          return os.date '%a %D %R'
        end,
      },
    },
  },
}
