-- See `:help vim.o`
--  For more options, you can see `:help option-list`

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.autoindent = true
vim.g.smartindent = true

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = "a"

vim.o.spell = false

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function ()
   vim.o.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true

vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Enable winbar
vim.o.winbar = "%<%f"

-- Set grep command
vim.o.grepprg = "rg --vimgrep"

vim.o.expandtab = true

-- Sets the startup order of neovim.
vim.o.exrc = true

--- Copied from the nvim repo of maxniia: https://github.com/MaxNiia/nvim/
local settings = {}

---@class options.SettingConfig
---@field name string
---@field default_value string|integer|boolean|table
---@field description string
---@param config options.SettingConfig
local setting = function (config)
   if vim.g[config.name] == nil then
      vim.g[config.name] = config.default_value
   end

   table.insert(settings, config)
end

setting({
   name = "clangd_query_driver",
   default_value = "/usr/bin/clang, /usr/bin/clang++",
   description = "Query driver for clangd, where clangd retrieves standard library symbols from.",
})

setting({
   name = "copyright_text",
   default_value = {
      "Copyright",
      "Year: {YEAR}",
   },
   description = "Text to insert when copyright is invoked.",
})

vim.g.available_settings = settings
