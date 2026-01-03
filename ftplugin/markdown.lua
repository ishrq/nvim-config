vim.o.conceallevel = 2

-- MiniAi textobjects
local spec_pair = require('mini.ai').gen_spec.pair
vim.b.miniai_config = {
  custom_textobjects = {
    ['*'] = spec_pair('*', '*', { type = 'greedy' }),
    ['_'] = spec_pair('_', '_', { type = 'greedy' }),
    ['~'] = spec_pair('~', '~', { type = 'greedy' }),
    d = {{ '()%d%d%d%d[-|/]%d%d[-|/]%d%d()', '()%d%d[-|/]%d%d[-|/]%d%d%d%d()', }}, -- date
    f = { '%[%^()%d+()%]' }, -- footnote
    h = { '^#+%s().+%S()' }, -- heading
    t = { '^-%s%[()[%s|x]()%]%s' }, -- todo
    T = { '^-%s%[[%s|x]%]%s().+%S()' }, -- todo item
    u = { 'http[s]?://[^>%]%)\'"]+' }, -- url
  },
}

-- MiniSurround custom surroundings
vim.b.minisurround_config = {
  custom_surroundings = {
    s = {
      input = { '%*%*().-()%*%*' },
      output = { left = '**', right = '**' },
    },
    e = {
      input = { '%*().-()%*' },
      output = { left = '*', right = '*' },
    },
    x = {
      input = { '%~().-()%~' },
      output = { left = '~', right = '~' },
    },
    l = {
      input = { '%[[().-()%]]' },
      output = { left = '[[', right = ']]' },
    },
    c = {
      input = { '%`().-()%`' },
      output = { left = '`', right = '`' },
    },
    C = {
      input = { '%`%`%`\n().-()\n%`%`%`' },
      output = { left = '```\n', right = '\n```' },
    },
    m = {
      input = { '%`%$ ().-() %$%`' },
      output = { left = '`$ ', right = ' $`' },
    },
    M = {
      input = { '%`%\\%[ ().-() %\\%]%`' },
      output = { left = '`\\[ ', right = ' \\]`' },
    },
    t = {
      input = { '%#().-()' },
      output = { left = '#', right = '' },
    },
    T = {
      input = { '%<().-()%>' },
      output = { left = '<', right = '>' },
    },
    Q = {
      input = { '%“().-()%”' },
      output = { left = '“', right = '”' },
    },
  },
}

local map = vim.keymap.set
local nxo = {'n', 'x', 'o'}

-- Convert to pdf, requires pandoc & pdf-engine (wkhtmltopdf)
-- https://nanotipsforvim.prose.sh/export-markdown-as-pdf
map("n", "<C-E>", ":!pandoc %:p --output=%:t:r.pdf --pdf-engine=wkhtmltopdf<CR>:!open %:t:r.pdf<CR><CR>", {buffer = true})

-- Custom textobjects
map(nxo, ']f', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'f')<CR>", {desc='Next Footnote'})
map(nxo, '[f', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'f', {search_method='prev'})<CR>", {desc='Previous Footnote'})
map(nxo, ']u', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'u')<CR>", {desc='Next URL'})
map(nxo, '[u', "<Cmd>lua MiniAi.move_cursor('left', 'i', 'u', {search_method='prev'})<CR>", {desc='Previous URL'})
