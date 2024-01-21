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

  -- Delete buffers without changing window layout
  'moll/vim-bbye',

  -- Easy commenting - https://github.com/numToStr/Comment.nvim
  {
    'numToStr/Comment.nvim',
    opts = { mappings = { extra = false } },
  },

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
        lualine_b = { 'branch' },
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

  -- LSP stuff
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Package managers for LSPs
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
    },
  },

  -- Autocompletion things
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet engine and completion source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Autocompletion from LSP
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
  },

}, {})


-- Disable netrw banner
vim.g.netrw_banner = 0
-- Use basic style listing in netrw
vim.g.netrw_liststyle = 0
-- Show line numbers in netrw
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

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
vim.opt.tabstop = 4      -- Set width of tab
vim.opt.shiftwidth = 4   -- Set indents width
vim.bo.softtabstop = 4   -- Set number of columns for tab
vim.opt.expandtab = true -- Expand tabs to spaces

-- Set split directions
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Recursive searching
vim.opt.path:append '**'

-- Show wildcard menu
vim.opt.wildmenu = true

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

-- Disable built-in Autocompletion
-- vim.o.complete = false

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
vim.keymap.set('n', '<C-Left>', ':vertical resize +3<CR>', { desc = 'Resize vertical split' })
vim.keymap.set('n', '<C-Right>', ':vertical resize -3<CR>', { desc = 'Resize vertical split' })
-- Easy horizontal split resizing
vim.keymap.set('n', '<C-Up>', ':horizontal resize +1<CR>', { desc = 'Resize horizontal split' })
vim.keymap.set('n', '<C-Down>', ':horizontal resize -1<CR>', { desc = 'Resize horizontal split' })

-- Easy buffer navigation
vim.keymap.set('n', '<leader>,', ':bprevious<CR>')
vim.keymap.set('n', '<leader>.', ':bnext<CR>')

-- Adding empty line below or above in normal mode
vim.keymap.set('n', '<leader>o', ':call append(line("."), "")<CR>', { desc = 'Empty line below in normal mode' })
vim.keymap.set('n', '<leader>O', ':call append(line(".")-1, "")<CR>', { desc = 'Empty line above in normal mode' })

-- Easy search for files
vim.keymap.set('n', '<leader>f', ':find ', { desc = 'Search for file' })

-- Center cursor after scrolling half the page
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Move selected lines up and down
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- Easy global replace - TODO: Check if this is helpful
vim.keymap.set('v', '<leader>r', '"hy:%s/<C-r>h//g<left><left>')

-- Disable space in normal and visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<NOP>', { silent = true })

-- For habit breaking
vim.keymap.set({ 'n', 'i', 'v' }, '<Up>', '<NOP>')
vim.keymap.set({ 'n', 'i', 'v' }, '<Down>', '<NOP>')
vim.keymap.set({ 'n', 'i', 'v' }, '<Left>', '<NOP>')
vim.keymap.set({ 'n', 'i', 'v' }, '<Right>', '<NOP>')


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
    indent = { enable = true },
  }
end, 0)


-- LSP configuration
require('mason').setup()

local on_attach = function(_, bufnr)
  -- Rename variable
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })

  -- Jump
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })

  -- Documentation keymaps
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Documentation' })
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Documentation' })

  -- Command `:Format` local to the buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer' })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = { globals = { 'vim' } },
    },
  },
}

local handlers = {
  function(server_name)
    require('lspconfig')[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetype = (servers[server_name] or {}).filetypes,
    })
  end,
}

require('mason-lspconfig').setup({
  ensure_installed = vim.tbl_keys(servers),
  handlers = handlers,
})


-- Autocompletion configuration - `:help cmp`
local cmp = require('cmp')
local luasnip = require('luasnip')
luasnip.config.setup({})
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete({}),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
  },
})
