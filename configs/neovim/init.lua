-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- TODO: Plugin manager

-- Disable wrapping
vim.wo.wrap = false

-- Show whitespaces
vim.opt.listchars:append({ eol = '¬', space = '·', tab = '→ ' })
vim.opt.list = true

-- Set encoding
vim.opt.encoding = 'utf-8'

-- Show rulers
vim.opt.colorcolumn = '79,100'

-- Indentation setting
vim.opt.tabstop = 4       -- Set width of tab
vim.opt.shiftwidth = 4    -- Set indents width
vim.bo.softtabstop = 4    -- Set number of columns for tab
vim.opt.expandtab = true  -- Expand tabs to spaces

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
