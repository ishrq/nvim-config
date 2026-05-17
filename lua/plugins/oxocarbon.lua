return {
  -- https://github.com/nyoom-engineering/oxocarbon.nvim
  "nyoom-engineering/oxocarbon.nvim",
  config = function ()
    vim.opt.background = "dark"
    vim.cmd.colorscheme "oxocarbon"
  end
}
