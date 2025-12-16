return {
  -- https://github.com/nvim-treesitter/nvim-treesitter
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Decrement selection", mode = "x" },
    },
    opts = {
      highlight = {enable=true},
      indent = {enable=true},
      matchup = {enable=true},
      ensure_installed = {
        "bash", "bibtex", "c", "cpp", "css", "dockerfile", "fish",
        "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
        "go", "gomod", "gosum", "html", "java", "javascript", "json",
        "lua", "make", "markdown", "markdown_inline", "perl", "php", "python",
        "rust", "sql", "toml", "tsx", "typescript", "vim", "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
      textsubjects = {
        enable = true,
        keymaps = {
          ["."] = "textsubjects-smart",
          [";"] = "textsubjects-container-outer",
        },
      },
    },
    --@param opts TSConfig
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
    end
  },
}
