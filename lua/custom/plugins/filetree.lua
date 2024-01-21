-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])


-- vim.keymap.set('n', '|', ':Neotree focus filesystem left<CR>', {noremap = true})
vim.keymap.set('n', '<leader>b', ':Neotree focus buffers right<cr>', {noremap = true})

vim.keymap.set('n', '|', function()
  local reveal_file = vim.fn.expand('%:p')
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
  })
  end--,
  -- {description: "Open neo-tree at current file or working directory"}
);


local function open_default (state)
  local node = state.tree:get_node()
  for k, v in pairs(node) do
    print(k, v)
    io.read()
  end
end

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
        window = {
          mappings = {
            ["<S-o>"] = function (state)
              local node = state.tree:get_node()
              -- for k, v in pairs(node) do
              --   print(k, v)
              -- end
              if node.ext == 'pdf' then
                print("It is a pdf")
                local job = vim.fn.jobstart('notepad.exe')
                print(job)
                  -- {
                  --   cwd = "./",
                  -- }
                -- )
                -- os.execute()
                  -- "sioyek \"" .. node.path .. "\"",
              else
                os.execute("\"" .. node.path .. "\"")
              end
            end
          }
        }
      }
    })
  end,
}
