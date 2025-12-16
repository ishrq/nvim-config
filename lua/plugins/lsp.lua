return {
  {
    -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',
    cond = vim.fn.hostname() == 'arch',
    dependencies = {
      {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        lazy = true,
      },
      {
        -- https://github.com/mason-org/mason.nvim
        'williamboman/mason-lspconfig.nvim',
      },
    },
    config = function()
      -- Setup Mason
      require('mason').setup()

      -- Configure mason-lspconfig
      require('mason-lspconfig').setup({
        ensure_installed = {
          'astro', 'cssls', 'clangd', 'denols', 'gopls',
          'html', 'intelephense', 'jdtls', 'lua_ls', 'marksman',
          'ruff', 'tailwindcss', 'texlab', 'ty',
        }
      })

      -- Server-specific configurations
      vim.lsp.config('html', {
        filetypes = { 'html', 'templ', 'astro' }
      })

      local map = vim.keymap.set
      map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = "Workspace Add Folder" })
      map('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc = "Workspace List Folder" })
      map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = "Workspace Remove Folder" })
      map('n', '[e', function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end, { desc = 'Previous error' })
      map('n', ']e', function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end, { desc = 'Next error' })

    end,
  },
  -- https://github.com/nvimtools/none-ls.nvim
  {
    'nvimtools/none-ls.nvim',
    cond = vim.fn.hostname() == 'arch',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    opts = function()
      local null_ls = require('null-ls')
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      local hover = null_ls.builtins.hover
      local completion = null_ls.builtins.completion

      return {
        sources = {
          completion.spell,
          formatting.prettierd,
          diagnostics.fish,
          diagnostics.stylint,
          diagnostics.todo_comments,
          diagnostics.trail_space,
          hover.dictionary,
        }
      }
    end,
  },
}
