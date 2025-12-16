-- Set <Space> as Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Declare variables
local map = vim.keymap.set

-- General
map('n', '<Leader>=', ':set spell!<CR>', { desc = 'Toggle spell check' })
map('n', '<Leader>8', ':execute "set cc=" . (&cc == "" ? "80" : "")<CR>', { desc = 'Toggle character column', silent = true})
map('n', 'X', ':keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<CR>', { desc = 'Split line', silent = true })
map('i', '<C-z>', '<C-g>u<Esc>[S1z=`]a<C-g>u', { desc = 'Fix last spelling' })

-- Better indenting
map('v', '<', '<gv^')
map('v', '>', '>gv^')

-- Command mode movement
map('c', '<C-a>', '<Home>')
map('c', '<C-n>', '<Down>')
map('c', '<C-p>', '<Up>')

-- Less cursor movement
map('', 'J', 'mzJ`z')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', '*', '*zz')
map('n', '#', '#zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', '{', '{zz')
map('n', '}', '}zz')
map('n', 'zo', 'zozz')
map('n', 'zr', 'zrzz')
map('n', 'zR', 'zRzz')
map('n', 'zc', 'zczz')
map('n', 'zm', 'zmzz')
map('n', 'zM', 'zMzz')
map('v', 'y', 'ygv<Esc>')

-- Undo break-points
map('i', ',', ',<C-g>u')
map('i', '.', '.<C-g>u')
map('i', ';', ';<C-g>u')

-- Explorer, tabs, windows, frequent files
map('n', '\\c', ":tab drop ~/RESOURCES/Backlog/capture.txt<CR>", { desc = 'Open capture.txt' })

-- Smart `dd` (don't yank blank lines)
-- https://nanotipsforvim.prose.sh/keeping-your-register-clean-from-dd
map('n', 'dd', function () if vim.fn.getline(".") == "" then return '"_dd' end return 'dd' end, { expr = true })

-- .repeat & macro on visually selected
map("x", ".", ":norm .<CR>")
map("x", "@", ":norm @q<CR>")

-- copy diagnostics
-- https://redlib.catsarch.com/r/neovim/comments/1lczcvz/yank_open_float_diagnostics_to_clipboard/
local function copy_diags(first, last, include_lines)
  vim.fn.setreg("+", {}, "V")
  local msgs = {}
  for l = first, last do
    for _, d in ipairs(vim.diagnostic.get(0, { lnum = l - 1 })) do
      local m = include_lines and (l .. ": " .. d.message)
      or d.message
      table.insert(msgs, m)
      vim.fn.setreg("+", vim.fn.getreg "+" .. m .. "\n", "V")
    end
  end
  if #msgs == 0 then
    return nil
  end
  return table.concat(msgs, "\n")
end

map("n", "<leader>zy", function()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local txt = copy_diags(line, line)
  if not txt then
    vim.notify("No diagnostics on line " .. line, vim.log.levels.ERROR)
    return
  end
  vim.notify(
    "Diagnostics from line "
    .. line
    .. " copied to clipboard.\n\n"
    .. txt,
    vim.log.levels.INFO
  )
end, { desc = "Copy current line errors" })

map("v", "<leader>zy", function()
  local s = vim.fn.getpos("'<")[2]
  local e = vim.fn.getpos("'>")[2]
  local txt = copy_diags(s, e, true)
  if not txt then
    vim.notify("No diagnostics in selection", vim.log.levels.ERROR)
    return
  end
  vim.notify(
    "Diagnostics from lines "
    .. s
    .. "-"
    .. e
    .. " copied to clipboard.\n\n"
    .. txt,
    vim.log.levels.INFO
  )
end, { desc = "Copy selected lines errors" })
