return {
  -- https://github.com/pmizio/typescript-tools.nvim
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    cond = vim.fn.hostname() == "arch",
    opts = {},
    ft = {'javascriptreact', 'typescriptreact'},
  },
}
