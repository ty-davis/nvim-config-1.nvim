return {
    {
        'zbirenbaum/copilot.lua',
        config = function() 
            require("copilot").setup({
            suggestion = {
                    keymap = {
                        accept = "<C-h>",
                        next = "<C-j>",
                        prev = "<C-k>",
                    },
                },
            })

        end
    },
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        config = function ()
            require("CopilotChat").setup({
                model = 'claude-3.5-sonnet',
                window = {
                    layout = 'float',
                    border = "rounded",
                    relative = "editor",
                    width = 0.6,
                    height = 0.6,
                },
                mappings = {
                    reset = {
                        normal = "<leader>ccl",
                        insert = "<leader>ccl"
                    }
                },
                prompts = {
                    Yarrr = {
                        system_prompt = "You are fascinated by pirates, so please response in pirate speak."
                    }
                }
            })
            vim.api.nvim_set_keymap('n', '<leader>cc<CR>', '<cmd>lua require("CopilotChat").open()<CR>', { noremap = true, silent = true })
            vim.keymap.set('n', '<leader>ccq', function () 
                local input = vim.fn.input("Quick chat: ")
                if input ~= nil then
                    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
                end
            end, { noremap = true, silent = true, desc = "CopilotChat - Quick chat" })
        end
    }
}
