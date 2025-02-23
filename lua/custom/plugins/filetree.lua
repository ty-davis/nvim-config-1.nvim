-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])


-- vim.keymap.set('n', '|', ':Neotree focus filesystem left<CR>', {noremap = true})
vim.keymap.set('n', '<leader>b', ':Neotree focus buffers right<cr>', {noremap = true})

vim.keymap.set('n', '|', function()
  local reveal_file = vim.fn.expand('%:p')
  print(reveal_file)
  if (reveal_file == '') then
    reveal_file = vim.fn.getcwd()
  else
    local f = io.open(reveal_file, "r")
    if (f) then
      f.close(f)
    else
      reveal_file = vim.fn.getcwd()
    end
  end
  require('neo-tree.command').execute({
    action = "focus",          -- OPTIONAL, this is the default value
    source = "filesystem",     -- OPTIONAL, this is the default value
    position = "left",         -- OPTIONAL, this is the default value
    reveal_file = reveal_file, -- path to file or folder to reveal
    reveal_force_cwd = true,   -- change cwd without asking if needed
    toggle = true,
  })
  end,
  { desc = "Open neo-tree at current file or working directory"}
);


local open_default = {
  function (state)
    local node = state.tree:get_node()
    if node.ext == 'pdf' then
      vim.fn.execute('!sioyek "' .. node.path .. '"')
    else
      vim.fn.execute('!start "' .. node.path .. '"')
    end
  end,
  desc = "Open with Default Application"
}

local open_explorer = {
  function (state)
    local is_windows = vim.loop.os_uname().sysname:match("Windows");
    local node = state.tree:get_node()
    print(node.type)
    if node.type == 'file' then
      if is_windows then
        vim.fn.execute('!explorer /select,"' .. node.path .. '"')
      else
        vim.fn.execute('!open "' .. vim.fn.fnamemodify(node.path, ":h") .. '"')
      end
    else
      if is_windows then
        vim.fn.execute('!explorer "' ..node.path ..'"')
      else
        vim.fn.execute('!open "' .. node.path .. '"')
      end
    end
  end,
  desc = "Open in File Explorer"
}

-- require("neo-tree").setup({
--   event_handlers = {
--
--     {
--       event = "file_opened",
--       handler = function(file_path)
--         -- auto close
--         -- vimc.cmd("Neotree close")
--         -- OR
--         require("neo-tree.command").execute({ action = "close" })
--       end
--     },
--
--   }
-- })

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    require('neo-tree').setup({
      filesystem = {
        bind_to_cwd = true,
        window = {
          mappings = {
            ["O"] = open_default,
            ["E"] = open_explorer,
          },
        }
      }
    })
  end,
}


