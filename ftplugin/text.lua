-- Mini.ai textobjects
local spec_pair = require('mini.ai').gen_spec.pair
vim.b.miniai_config = {
    custom_textobjects = {
        d = {{ '()%d%d%d%d[-|/]%d%d[-|/]%d%d()', '()%d%d[-|/]%d%d[-|/]%d%d%d%d()', }}, -- date
        u = { 'http[s]?://[^>%]%)\'"]+' }, -- url
    },
}

-- MiniSurround custom surroundings
vim.b.minisurround_config = {
  custom_surroundings = {
    Q = {
      input = { '%“().-()%”' },
      output = { left = '“', right = '”' },
    },
  },
}

local nxo = {'n', 'x', 'o'}
vim.keymap.set(nxo, ']d', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'd')<CR>", {desc='Next date'})
vim.keymap.set(nxo, '[d', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'd', {search_method='prev'})<CR>", {desc='Previous date'})
vim.keymap.set(nxo, ']u', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'u')<CR>", {desc='Next url'})
vim.keymap.set(nxo, '[u', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'u', {search_method='prev'})<CR>", {desc='Previous url'})
