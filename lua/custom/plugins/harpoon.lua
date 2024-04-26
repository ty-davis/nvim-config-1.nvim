local conf = require("telescope.config").values

local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
	table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
	prompt_title = "Harpoon",
	finder = require("telescope.finders").new_table({
	    results = file_paths,
	}),
	previewer = conf.file_previewer({}),
	sorter = conf.generic_sorter({}),
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
	{ "<leader>pf", function() require("harpoon"):list():add() end, desc = "Harpoon [F]ile" },
	{ "<leader>pl", function() toggle_telescope(require("harpoon"):list()) end, desc = "Show Harpoon [L]ist" },
    }
}
