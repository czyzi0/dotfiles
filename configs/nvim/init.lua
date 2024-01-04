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

  -- Better highlighting and navigation for code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

}, {})


-- Disable netrw banner
vim.g.netrw_banner = 0
-- Use tree style listing in netrw
vim.g.netrw_liststyle = 3

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
-- Disable wrapping
vim.wo.wrap = false
-- Show whitespaces
vim.opt.listchars:append({ eol = '¬', space = '·', tab = '→ ' })
vim.opt.list = true
-- Set encoding
vim.opt.encoding = 'utf-8'
-- Show rulers
vim.opt.colorcolumn = '79,100'
-- Set scrolloffs
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
-- Indentation setting
vim.opt.tabstop = 4       -- Set width of tab
vim.opt.shiftwidth = 4    -- Set indents width
vim.bo.softtabstop = 4    -- Set number of columns for tab
vim.opt.expandtab = true  -- Expand tabs to spaces

-- Set split directions
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set highlight on search
vim.o.hlsearch = false

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

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true


-- Easy split creation
vim.keymap.set('n', '<leader>v', ':Vex!<CR>', { desc = 'Split right' })
vim.keymap.set('n', '<leader>h', ':Hex<CR>', { desc = 'Split below' })
-- Easy split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to split left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to split below' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to split above' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to split right' })
-- Easy vertical split resizing
vim.keymap.set('n', '<C-Left>', ':vertical resize +3<CR>', { desc = 'Resize vertical split'})
vim.keymap.set('n', '<C-Right>', ':vertical resize -3<CR>', { desc = 'Resize vertical split'})
-- Easy horizontal split resizing
vim.keymap.set('n', '<C-Up>', ':horizontal resize +1<CR>', { desc = 'Resize horizontal split'})
vim.keymap.set('n', '<C-Down>', ':horizontal resize -1<CR>', { desc = 'Resize horizontal split'})

-- Center cursor after scrolling half the page
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Move selected lines up and down
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- Easy global replace - TODO: Check if this is helpful
vim.keymap.set('v', '<leader>r', '"hy:%s/<C-r>h//g<left><left>')


-- Configure treesitter - `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
-- `:TSInstallInfo` for more info, `:TSInstall ...` to install new language
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Select supported languages
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'css',
      'dockerfile',
      'html',
      'javascript',
      'json',
      'latex',
      'lua',
      'markdown',
      'python',
      'vimdoc',
      'vim',
    },
    -- Do not autoinstall languages that are not installed
    auto_install = false,

    highlight = { enable = true },
  }
end, 0)
