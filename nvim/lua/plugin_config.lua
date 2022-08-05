-- Plugin configurations (including key mapping for commands)
local map = vim.api.nvim_set_keymap
local bufopts = { noremap = true, silent = true }

-- nvim-tree
require('nvim-tree').setup()
map('n', '<C-b>', ':NvimTreeToggle<cr>', bufopts)

-- lualine
require('lualine').setup{
  options = {
    theme = 'onedark'
  }
}

-- Telescope -- 
require('telescope').setup{
    defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = 'move_selection_next',
        ["<C-j>"] = 'move_selection_next',
        ["<C-k>"] = 'move_selection_previous'
      }
    }
  }
}
map('n', '<C-p>', ':Telescope find_files<cr>', bufopts)
require('telescope').setup {
  defaults = {
    file_ignore_patterns = { 'node_modules' }
  }
}
vim.keymap.set('n', 'gd', ':Telescope lsp_definitions', opts)
vim.keymap.set('n', 'gr', ':Telescope lsp_references', opts)
vim.keymap.set('n', '<leader>lo', ':Telescope lsp_document_symbols<cr>', opts)
vim.keymap.set('n', '<leader>lt', ':Telescope lsp_dynamic_workspace_symbols<cr>', opts)
vim.keymap.set('n', '<leader>gs', ':Telescope git_status<cr>', opts)
vim.keymap.set('n', '<leader>gbs', ':Telescope git_bcommits<cr>', opts)

-- bufferline
vim.opt.termguicolors = true
require("bufferline").setup{}

-- nvim-lspconfig
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help, opts)

-- Vista
map('n', '<leader>vv', ':Vista!!<CR>', bufopts)

-- Hop
require('hop').setup()
map('n', '<leader><leader>f', ':HopWord<cr>', bufopts)

-- Auto pairs
require("nvim-autopairs").setup {}

-- Mason - LSP installer
require("mason").setup()
require("mason-lspconfig").setup()

-- Nvim complete
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  preselect = true,
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' }, -- For ultisnips users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})


-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['tsserver'].setup {
  capabilities = capabilities
}

-- Theme
require('onedark').setup {
  style = 'deep'
}
require('onedark').load()
