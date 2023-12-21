-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install `lazy.nvim` (https://github.com/folke/lazy.nvim) - `:help lazy.nvim.txt`
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Configure plugins
require('lazy').setup({
  -- Detect tabstops and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Color scheme - `:help sonokai.txt`
  {
    'sainnhe/sonokai',
    priority = 1000,
    config = function()
      vim.g.sonokai_style = 'default'
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_transparent_background = 1
      vim.cmd.colorscheme 'sonokai'
    end,
  },

  -- Use lualine as statusline - `:help lualine.txt`
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'sonokai',
        component_separators = '│',
        section_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = {
          function()
            if vim.o.expandtab then
              return 'spaces: ' .. tostring(vim.o.shiftwidth)
            else
              return 'tabs: ' .. tostring(vim.o.tabstop)
            end
          end,
          'encoding',
          'fileformat',
          'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
  },
}, {})

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

--
vim.o.fillchars = 'vert:│'

-- Disable netrw banner
vim.g.netrw_banner = 0

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
