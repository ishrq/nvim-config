-- https://github.com/obsidian-nvim/obsidian.nvim
return {
  "obsidian-nvim/obsidian.nvim",
  ft = "markdown",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "Notes",
        path = "~/RESOURCES/Notes",
      }
    },
  },
}
