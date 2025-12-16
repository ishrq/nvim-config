-- MiniSurround custom surroundings
vim.b.minisurround_config = {
  custom_surroundings = {
    m = {
      input = { '%$ ().-() %$' },
      output = { left = '$ ', right = ' $' },
    },
    M = {
      input = { '%\\%[\n().-()\n%\\%]' },
      output = { left = '\\[\n', right = '\n\\]' },
    },
    B = {
      input = { '%\\begin%{%}\n ().-() \n%\\end%{%}' },
      output = { left = '\\begin{}\n', right = '\n\\end{}' },
    },
    s = {
      input = { '%\\textbf%{%().-() %}' },
      output = { left = '\\textbf{', right = '}' },
    },
    e = {
      input = { '%\\textit%{%().-() %}' },
      output = { left = '\\textit{', right = '}' },
    },
    Q = {
      input = { '%“().-()%”' },
      output = { left = '“', right = '”' },
    },
  },
}

-- MiniAi textobjects
local spec_pair = require('mini.ai').gen_spec.pair
vim.b.miniai_config = {
  custom_textobjects = {
    u = { 'http[s]?://[^>%]%)\'"]+' }, -- url
  },
}

local map = vim.keymap.set
local nxo = {'n', 'x', 'o'}

map(nxo, ']u', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'u')<CR>", {desc='Next URL'})
map(nxo, '[u', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'u', {search_method='prev'})<CR>", {desc='Previous URL'})

vim.o.conceallevel = 1
