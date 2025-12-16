-- Toggle !important
-- https://nanotipsforvim.prose.sh/toggle-important-in-css
vim.keymap.set("n", "<leader>i", function ()
  local lineContent = vim.fn.getline('.')
  if lineContent:find("!important") then
    lineContent = lineContent:gsub(" !important", "")
  else
    lineContent = lineContent:gsub(";", " !important;")
  end
  vim.fn.setline(".", lineContent)
end)
