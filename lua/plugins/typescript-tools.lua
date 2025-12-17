return {
  -- https://github.com/pmizio/typescript-tools.nvim
  {
    'pmizio/typescript-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim', -- https://github.com/nvim-lua/plenary.nvim
      'neovim/nvim-lspconfig' },
    opts = {},
    ft = {'javascriptreact', 'typescriptreact'},
  },
}
