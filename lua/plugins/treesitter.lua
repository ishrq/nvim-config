return {
  -- https://github.com/nvim-treesitter/nvim-treesitter
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    -- require'nvim-treesitter'.install({
    --   "astro", "bash", "c", "cpp", "css", "dockerfile",
    --   "fish", "git_rebase", "gitattributes", "gitcommit",
    --   "go", "html", "java", "javascript", "json", "lua",
    --   "latex", "make", "markdown", "markdown_inline",
    --   "perl", "php", "python", "rust", "sql", "toml",
    --   "tsx", "typescript", "yaml",
    -- })

    local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

    local ignore_filetypes = {
      'checkhealth',
      'lazy',
      'mason',
    }

    -- highlighting
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '<filetype>' },
      callback = function() vim.treesitter.start() end,
    })

    -- folding
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'

    -- indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

  end
}
