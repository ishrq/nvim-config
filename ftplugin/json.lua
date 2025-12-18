-- pretty print with `jq`
vim.keymap.set('n', '<C-p>', ':%!jq .<CR>')

-- https://github.com/JoosepAlviste/dotfiles/blob/master/config/nvim/ftplugin/json.lua
-- pressing 'o' to create new line appends comma ',' at prev line
vim.keymap.set('n', 'o', function()
  local line = vim.api.nvim_get_current_line()

  local should_add_comma = string.find(line, '[^,{[]$')
  if should_add_comma then
    return 'A,<cr>'
  else
    return 'o'
  end
end, { buffer = true, expr = true })
