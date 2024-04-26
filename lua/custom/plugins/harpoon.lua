local conf = require("telescope.config").values


local make_finder = function(harpoon_files)
    local paths = {}
    for i, item in ipairs(harpoon_files.items) do
    	table.insert(paths, item.value)
	print(i, item.value, item)
    end
    vim.fn.input({prompt = '> '})

    return require("telescope.finders").new_table(
	{
	    results = paths
	}
    )
end

local function toggle_telescope(harpoon_files)
    require("telescope.pickers").new({}, {
	prompt_title = "Harpoon",
	finder = make_finder(harpoon_files),
	previewer = conf.file_previewer({}),
	sorter = conf.generic_sorter({}),
	attach_mappings = function(prompt_buffer_number, map)
	    map(
		"i",
		"<S-d>", -- your mapping here
		function ()
		    local state = require("telescope.actions.state")
		    local selected_entry = state.get_selected_entry()
		    local current_picker = state.get_current_picker(prompt_buffer_number)
		    -- vim.fn.setreg('a', require("harpoon"):list():get(selected_entry.index))
		    require("harpoon"):list():remove_at(selected_entry.index)
		    current_picker:refresh(make_finder(require("harpoon"):list()))
		end
	    )
	    map(
		"i",
		"<S-p>",
		function()
		    local state = require('telescope.actions.state')
		    local selected_entry = state.get_selected_entry()
		    local current_picker = state.get_current_picker(prompt_buffer_number)

		    require("harpoon"):list():add({'lua\\custom\\plugins\\paragraphs.lua'})
		    current_picker:refresh(make_finder(require("harpoon"):list()))
		    print('I think I did something')
		end
	    )
	    return true
	end
    }):find()
end


return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
	local harpoon = require("harpoon")
	harpoon:setup()
    end,
    keys = {
	{ "<leader>pf", function() require("harpoon"):list():add() end, desc = "Har[P]oon [F]ile" },
	{ "<leader>pt", function() toggle_telescope(require("harpoon"):list()) end, desc = "Show Har[P]oon [T]elescope" },
	{ "<leader>pl", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Show Har[P]oon [L]ist" },
	{ "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon to file [1]" },
	{ "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon to file [2]" },
	{ "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon to file [3]" },
	{ "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon to file [4]" },
	{ "<leader>5", function() require("harpoon"):list():select(5) end, desc = "Harpoon to file [5]" },
    }
}
