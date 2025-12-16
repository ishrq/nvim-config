return {
  -- https://github.com/folke/snacks.nvim
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = {},
      explorer = {},
      rename  = {},
      words = {},
    },
    keys = {
      -- rename
      { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
      -- word
      { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    }
  }
}
