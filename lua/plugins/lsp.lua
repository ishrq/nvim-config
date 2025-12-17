return {
  {
    -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        -- https://github.com/mason-org/mason.nvim
        'williamboman/mason.nvim',
        cmd = 'Mason',
      },
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup()

      require('mason-lspconfig').setup({
        ensure_installed = {
          'astro', 'biome', 'clangd', 'gopls',
          'html', 'jdtls', 'lua_ls', 'marksman',
          'ruff', 'tailwindcss', 'texlab', 'ty',
        },
      })

      local map = vim.keymap.set
      map('n', '[e', function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end, { desc = 'Previous error' })
      map('n', ']e', function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end, { desc = 'Next error' })
    end,
  },
  {
    -- https://github.com/nvimtools/none-ls.nvim
    'nvimtools/none-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = function()
      local b = require('null-ls').builtins
      return {
        sources = {
          b.completion.spell,
          b.diagnostics.fish,
          b.diagnostics.stylint,
          b.diagnostics.todo_comments,
          b.diagnostics.trail_space,
          b.hover.dictionary,
        },
      }
    end,
  },
}
