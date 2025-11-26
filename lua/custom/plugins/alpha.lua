local path_ok, plenary_path = pcall(require, 'plenary.path')
if not path_ok then
  return
end

local potential_headers = {
  -- r : 0xE0B8  a
  -- r : 0xE0BE  b
  -- r█ : 0x2588  c
  -- r : 0xE0BA  d
  -- r : 0xE0BC  e
  -- r║ : 0x2551  f
  -- r═ : 0x2550  g
  -- r╝ : 0x255D  h
  -- r╚ : 0x255A  i
  -- r░ :         j
  -- r▒ :         k
  -- r▓ :         l
  {
    [[                                                            ]],
    [[  █▓▒░  █▓▒░██████▓▒░ ████▓▒░ █▓▒░    █▓▒░█▓▒░█▓▒░    █▓▒░  ]],
    [[  ██▓▒░ █▓▒░█▓▒░     █▓▒░ █▓▒░ █▓▒░  █▓▒░ █▓▒░██▓▒░  ██▓▒░  ]],
    [[  █▓█▓▒░█▓▒░█▓▒░     █▓▒░ █▓▒░ █▓▒░  █▓▒░ █▓▒░█▓█▓▒░█▓█▓▒░  ]],
    [[  █▓▒█▓▒█▓▒░████▓▒░  █▓▒░ █▓▒░  █▓▒░█▓▒░  █▓▒░█▓▒█▓█▓▒█▓▒░  ]],
    [[  █▓▒░█▓█▓▒░█▓▒░     █▓▒░ █▓▒░  █▓▒░█▓▒░  █▓▒░█▓▒░█▓▒░█▓▒░  ]],
    [[  █▓▒░ ██▓▒░█▓▒░     █▓▒░ █▓▒░   █▓█▓▒░   █▓▒░█▓▒░    █▓▒░  ]],
    [[  █▓▒░  █▓▒░█▓▒░     █▓▒░ █▓▒░   █▓█▓▒░   █▓▒░█▓▒░    █▓▒░  ]],
    [[  █▓▒░  █▓▒░██████▓▒░ ████▓▒░     █▓▒░    █▓▒░█▓▒░    █▓▒░  ]],
    [[                                                            ]],
  },
  {
    [[ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ]],
    [[ ░     ░░░░   ░         ░░░░░     ░░░░░░   ░░░░░░░░░   ░   ░    ░░░░░░   ░ ]],
    [[ ▒      ▒▒▒   ▒   ▒▒▒▒▒▒▒▒▒   ▒▒▒▒   ▒▒▒▒   ▒▒▒▒▒▒▒   ▒▒   ▒     ▒▒▒▒    ▒ ]],
    [[ ▒   ▒   ▒▒   ▒   ▒▒▒▒▒▒▒   ▒▒▒▒▒▒▒▒   ▒▒▒   ▒▒▒▒▒   ▒▒▒   ▒   ▒  ▒▒     ▒ ]],
    [[ ▓   ▓▓   ▓   ▓       ▓▓▓   ▓▓▓▓▓▓▓▓   ▓▓▓▓   ▓▓▓   ▓▓▓▓   ▓   ▓▓    ▓   ▓ ]],
    [[ ▓   ▓▓▓      ▓   ▓▓▓▓▓▓▓   ▓▓▓▓▓▓▓▓   ▓▓▓▓▓   ▓   ▓▓▓▓▓   ▓   ▓▓▓  ▓▓   ▓ ]],
    [[ ▓   ▓▓▓▓     ▓   ▓▓▓▓▓▓▓▓▓   ▓▓▓▓▓   ▓▓▓▓▓▓▓     ▓▓▓▓▓▓   ▓   ▓▓▓▓▓▓▓   ▓ ]],
    [[ █   █████    █         █████      ███████████   ███████   █   ███████   █ ]],
    [[ █████████████████████████████████████████████████████████████████████████ ]],
  },
  {
    [[ ██   ██║ ███████║  █████   ███║  ███║ ██║ ██    ██║ ]],
    [[ ███  ██║ ██═════╝ ██ ██  ███║  ███║ ██║ ███  ███║ ]],
    [[ ████ ██║ ██       ███║  ███║ ███║  ███║ ██║ ████████║ ]],
    [[ ██████║ ██████║  ███║  ███║ ███║  ███║ ██║ ████████║ ]],
    [[ ██║████║ ██════╝  ███║  ███║ ██ ██  ██║ ██║██ ██║ ]],
    [[ ██║ ███║ ██       ██ ██   █████   ██║ ██║     ██║ ]],
    [[ ██║  ██║ ███████║  █████     ███    ██║ ██║     ██║ ]],
    [[ ╚═╝   ╚═╝ ╚══════╝   ═════       ═══     ╚═╝ ╚═╝     ╚═╝ ]],
  },
  {
    [[                                                 .·▪.     ]],
    [[                                                .▪▪       ]],
    [[      v .   ._, |_  .,                          ▪·.       ]],
    [[   `-._\/  .  \ /    |/_                       .▪.        ]],
    [[       \\  _\, y | \//            _____________║║║___     ]],
    [[ _\_.___\\, \\/ -.\||            ║║║    ]],
    [[   `7-,--.`._||  / / ,          ║║   ]],
    [[   /'     `-. `./ / |/_.'        ]],
    [[             |    |//          ]],
    [[             |_    /           ▐▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄     ║  ]],
    [[             |-   |            ▐███══██████══█████     ║  ]],
    [[             |   =|            ▐███══██████══█████     ║  ]],
    [[             |    |            ▐███████ .█████████     ║  ]],
    [[            / ,  . \           ▐███████  █████████_____║  ]],
  },
  {
    [[ ░█▄░█▒██▀░▄▀▄░█▒█░█░█▄▒▄█ ]],
    [[ ░█▒▀█░█▄▄░▀▄▀░▀▄▀░█░█▒▀▒█ ]],
  },
  {
    [[   \  | ____|  _ \ \ \     /_ _|  \  |  ]],
    [[    \ | __|   |   | \ \   /   |  |\/ |  ]],
    [[  |\  | |     |   |  \ \ /    |  |   |  ]],
    [[ _| \_|_____|\___/    \_/   ___|_|  _|  ]],
  },
  {
    [[  ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·.  ]],
    [[ •█▌▐█▀▄.▀· ▄█▀▄ ▪█·█▌██ ·██ ▐███▪ ]],
    [[ ▐█▐▐▌▐▀▀▪▄▐█▌.▐▌▐█▐█•▐█·▐█ ▌▐▌▐█· ]],
    [[ ██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌ ]],
    [[ ▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀ ]],
  },
  {
    [[ ╔═╗ ╔╗╔═══╗╔═══╗╔╗  ╔╗╔══╗╔═╗╔═╗ ]],
    [[ ║ ╚╗║║║╔══╝║╔═╗║║╚╗╔╝║╚╣╠╝║ ╚╝ ║ ]],
    [[ ║╔╗╚╝║║╚══╗║║ ║║╚╗║║╔╝ ║║ ║╔╗╔╗║ ]],
    [[ ║║╚╗ ║║╔══╝║║ ║║ ║╚╝║  ║║ ║║║║║║ ]],
    [[ ║║ ║ ║║╚══╗║╚═╝║ ╚╗╔╝ ╔╣╠╗║║║║║║ ]],
    [[ ╚╝ ╚═╝╚═══╝╚═══╝  ╚╝  ╚══╝╚╝╚╝╚╝ ]],
  },
  {
    [[ ▀███▄   ▀███▀███▀▀▀███  ▄▄█▀▀██▄ ▀████▀   ▀███▀████▀████▄     ▄███▀ ]],
    [[   ███▄    █   ██    ▀█▄██▀    ▀██▄ ▀██     ▄█   ██   ████    ████   ]],
    [[   █ ███   █   ██   █  ██▀      ▀██  ██▄   ▄█    ██   █ ██   ▄█ ██   ]],
    [[   █  ▀██▄ █   ██████  ██        ██   ██▄  █▀    ██   █  ██  █▀ ██   ]],
    [[   █   ▀██▄█   ██   █  ▄█▄      ▄██   ▀██ █▀     ██   █  ██▄█▀  ██   ]],
    [[   █     ███   ██     ▄███▄    ▄██▀    ▄██▄      ██   █  ▀██▀   ██   ]],
    [[ ▄███▄    ██ ▄██████████ ▀▀████▀▀       ██     ▄████▄███▄ ▀▀  ▄████▄ ]],
  },
  {
    [[  _   _ ___   _____ _   _ _        ]],
    [[ ( ) ( )  _ \(  _  ) ) ( )_) \_/ \ ]],
    [[ |  \| | (_(_) ( ) | | | | |     | ]],
    [[ |     |  _)_| | | | | | | | (_) | ]],
    [[ | | \ | (_( ) (_) | \_/ | | | | | ]],
    [[ (_) (_)____/(_____)\___/(_)_) (_) ]],
  },
  {
    [[  ((    ((.  (   (  (   (( (   (   ]],
    [[  ))\  (\(). )\  )\ )\  ))\)\: )\  ]],
    [[ ((_))))(_) ((_)((_)(_)((_)(_)((_) ]],
    [[ | \| | __|/ _ \\ \ / /_ _|  \/  | ]],
    [[ | .  | _|| (_) |\   / | || |\/| | ]],
    [[ |_|\_|___|\___/  \_/ |___|_|  |_| ]],
  },
  {
    [[  __    __ ________  ______  __     __ ______ __       __  ]],
    [[ |  \  |  \        \/      \|  \   |  \      \  \     /  \ ]],
    [[ | ▓▓\ | ▓▓ ▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓\ ▓▓   | ▓▓\▓▓▓▓▓▓ ▓▓\   /  ▓▓ ]],
    [[ | ▓▓▓\| ▓▓ ▓▓__   | ▓▓  | ▓▓ ▓▓   | ▓▓ | ▓▓ | ▓▓▓\ /  ▓▓▓ ]],
    [[ | ▓▓▓▓\ ▓▓ ▓▓  \  | ▓▓  | ▓▓\▓▓\ /  ▓▓ | ▓▓ | ▓▓▓▓\  ▓▓▓▓ ]],
    [[ | ▓▓\▓▓ ▓▓ ▓▓▓▓▓  | ▓▓  | ▓▓ \▓▓\  ▓▓  | ▓▓ | ▓▓\▓▓ ▓▓ ▓▓ ]],
    [[ | ▓▓ \▓▓▓▓ ▓▓_____| ▓▓__/ ▓▓  \▓▓ ▓▓  _| ▓▓_| ▓▓ \▓▓▓| ▓▓ ]],
    [[ | ▓▓  \▓▓▓ ▓▓     \\▓▓    ▓▓   \▓▓▓  |   ▓▓ \ ▓▓  \▓ | ▓▓ ]],
    [[  \▓▓   \▓▓\▓▓▓▓▓▓▓▓ \▓▓▓▓▓▓     \▓    \▓▓▓▓▓▓\▓▓      \▓▓ ]],
  },
  {
    [[                                                                       ]],
    [[                                                                     ]],
    [[       ████ ██████           █████      ██                     ]],
    [[      ███████████             █████                             ]],
    [[      █████████ ███████████████████ ███   ███████████   ]],
    [[     █████████  ███    █████████████ █████ ██████████████   ]],
    [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
    [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
    [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
    [[                                                                       ]],
  },
}

local header = {
  type = 'text',
  opts = {
    position = 'center',
    hl = 'Type',
  },
}

math.randomseed(os.time())
header.val = potential_headers[math.random(1, #potential_headers)]

local cdir = vim.fn.getcwd()

local nvim_web_devicons = {
  enabled = true,
  highlight = true,
}

local function get_extension(fn)
  local match = fn:match '^.+(%..+)$'
  local ext = ''
  if match ~= nil then
    ext = match:sub(2)
  end
  return ext
end

local nwd = require 'nvim-web-devicons'
local function icon(fn)
  if nwd then
    local ext = get_extension(fn)
    return nwd.get_icon(fn, ext, { default = true })
  end
end

local function file_button(fn, sc, short_fn, autocd)
  short_fn = short_fn or fn
  local ico_txt
  local fb_hl = {}

  if nvim_web_devicons.enabled then
    local ico, hl = icon(fn)
    local hl_option_type = type(nvim_web_devicons.highlight)
    if hl_option_type == 'boolean' then
      if hl and nvim_web_devicons.highlight then
        table.insert(fb_hl, { hl, 0, #ico })
      end
    end
    if hl_option_type == 'string' then
      table.insert(fb_hl, { nvim_web_devicons.highlight, 0, #ico })
    end
    ico_txt = ico .. '  '
  else
    ico_txt = ''
  end
  local cd_cmd = (autocd and ' | cd %:p:h' or '')
  local file_button_el = require('alpha.themes.dashboard').button(sc, ico_txt .. short_fn, '<cmd>e ' .. vim.fn.fnameescape(fn) .. cd_cmd .. ' <CR>')
  local fn_start = short_fn:match '.*[/\\]'
  if fn_start ~= nil then
    table.insert(fb_hl, { 'Comment', #ico_txt - 2, #fn_start + #ico_txt })
  end
  file_button_el.opts.hl = fb_hl
  return file_button_el
end

local default_mru_ignore = { 'gitcommit' }

local mru_opts = {
  ignore = function(path, ext)
    return (string.find(path, 'COMMIT_EDITMSG')) or (vim.tbl_contains(default_mru_ignore, ext))
  end,
  autocd = false,
}

--- @param start number
--- @param cwd string? optional
--- @param items_number number? optional number of items to generate, default = 10
local function mru(start, cwd, items_number, opts)
  opts = opts or mru_opts
  items_number = vim.F.if_nil(items_number, 10)

  local oldfiles = {}
  for _, v in pairs(vim.v.oldfiles) do
    if #oldfiles == items_number then
      break
    end
    local cwd_cond
    if not cwd then
      cwd_cond = true
    else
      cwd_cond = vim.startswith(v, cwd)
    end
    local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
    if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
      oldfiles[#oldfiles + 1] = v
    end
  end
  local target_width = 35

  local tbl = {}
  for i, fn in ipairs(oldfiles) do
    local short_fn
    if cwd then
      short_fn = vim.fn.fnamemodify(fn, ':.')
    else
      short_fn = vim.fn.fnamemodify(fn, ':~')
    end

    if #short_fn > target_width then
      short_fn = plenary_path.new(short_fn):shorten(1, { -2, -1 })
      if #short_fn > target_width then
        short_fn = plenary_path.new(short_fn):shorten(1, { -1 })
      end
    end

    local shortcut = tostring(i + start - 1)

    local file_button_el = file_button(fn, 'r' .. shortcut, short_fn, opts.autocd)
    tbl[i] = file_button_el
  end
  return {
    type = 'group',
    val = tbl,
    opts = {},
  }
end

local section_mru = {
  type = 'group',
  val = {
    {
      type = 'text',
      val = 'Recent files',
      opts = {
        hl = 'Comment',
        shrink_margin = false,
        position = 'center',
      },
    },
    { type = 'padding', val = 1 },
    {
      type = 'group',
      val = function()
        return { mru(0, cdir) }
      end,
      opts = { shrink_margin = false },
    },
  },
}

local function tableInsertMult(list, ...)
  for _, v in ipairs { ... } do
    list[#list + 1] = v
  end
end

local function make_buttons()
  local dashboard = require 'alpha.themes.dashboard'
  local harpoon = require 'harpoon'
  local buttons = {
    type = 'group',
    position = 'center',
    val = {
      { type = 'text', val = 'Harpoon', opts = { hl = 'Comment', position = 'center' } },
      { type = 'padding', val = 1 },
    },
  }
  table.insert(buttons.val, dashboard.button('h', '   Open harpoon window', ':lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<CR>'))
  for i = 1, #harpoon:list().items do
    table.insert(buttons.val, file_button(harpoon:list().items[i].value, tostring(i), false))
  end
  tableInsertMult(
    buttons.val,
    { type = 'padding', val = 1 },
    { type = 'text', val = 'Quick Links', opts = { hl = 'Comment', position = 'center' } },
    { type = 'padding', val = 1 },
    dashboard.button('n', '  New file', ':ene <BAR> startinsert <CR>'),
    dashboard.button('c', '  Configuration', '<cmd>cd $NVIM_CONFIG <BAR> e init.lua<CR>'),
    dashboard.button('l', 'z  Lazy', ':Lazy<CR>'),
    dashboard.button('m', 'm  Mason', ':Mason<CR>'),
    dashboard.button('q', '×  Quit', ':qa<CR>')
  )

  return buttons
end

return {
  'goolord/alpha-nvim',
  priority = 50,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local theta = require 'alpha.themes.theta'
    -- local dashboard = require('alpha.themes.dashboard')
    -- local harpoon = require('harpoon')
    local layout = {
      { type = 'padding', val = 5 },
      header,
      { type = 'padding', val = 1 },
      { type = 'text', val = 'cwd: ' .. vim.fn.getcwd(), opts = { hl = 'Constant', position = 'center' } },
      { type = 'padding', val = 2 },
      section_mru,
      { type = 'padding', val = 2 },
      make_buttons(),
      { type = 'padding', val = 2 },
      { type = 'text', val = 'Be just 1% better today', opts = { hl = 'Comment', position = 'center' } },
    }

    theta.config.layout = layout

    alpha.setup(theta.config)
  end,
}
