return{
  -- https://github.com/NvChad/nvim-colorizer.lua
  {
    'NvChad/nvim-colorizer.lua',
    cmd = 'ColorizerToggle',
    config = function ()
      require('colorizer').setup {
        user_default_options = {
          css = true,
          css_fn = true,
          tailwind = true,
        }
      }
    end
  }
}
