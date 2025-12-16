-- Some options are enabled through mini.basics

--CONTEXT
vim.o.sidescrolloff  = 4
vim.o.numberwidth    = 3
vim.o.signcolumn     = "yes:1"
vim.o.statuscolumn   = "%l%s"
vim.o.scrolloff      = 8

--WHITESPACE
vim.o.expandtab      = true
vim.o.shiftwidth     = 2
vim.o.softtabstop    = 2
vim.o.tabstop        = 2

--WRAP
vim.o.lbr            = true
vim.o.wrap           = true
vim.o.whichwrap      = '<,>,h,l' --move up/down at line-end

--FOLD
vim.o.foldlevel      = 99
vim.o.foldmethod     = 'indent' --manual, indent, syntax, expr, marker

--HISTORY
vim.o.swapfile       = false

--GENERAL
vim.o.autoread       = true
vim.o.grepprg        = 'rg' --default grep
vim.o.lazyredraw     = true
vim.o.spell          = true
vim.o.spellsuggest   = 'best,5'
vim.o.updatetime     = 50  --decrease update time

--DISABLE BUILT-IN
vim.g.loaded_gzip = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_tutor = 1
vim.g.loaded_zipPlugin = 1

--From https://this-week-in-neovim.org/2023/Jan/9
local ns = vim.api.nvim_create_namespace('toggle_hlsearch')

local function toggle_hlsearch(char)
  if vim.fn.mode() == 'n' then
    local keys = { '<CR>', 'n', 'N', '*', '#', '?', '/' }
    local new_hlsearch = vim.tbl_contains(keys, vim.fn.keytrans(char))
    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end

vim.on_key(toggle_hlsearch, ns)

--From https://nanotipsforvim.prose.sh/stop-yourself-from-overnesting
vim.cmd.highlight("Overnesting guibg=#E06C75")
vim.fn.matchadd("Overnesting", ("\t"):rep(5) .. "\t*")

-- Diagnostics
vim.diagnostic.config {
  title = true,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
  virtual_text = false,
  float = {
    source = 'if_many',
    style = 'minimal',
    border = 'rounded',
    header = '',
    prefix = '',
  },
}
