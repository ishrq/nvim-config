return {
  -- https://github.com/lervag/vimtex
  {
    'lervag/vimtex',
    ft = {'tex'},
    init = function()
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_view_general_viewer = 'zathura'
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_conceal = 'abdmg'
    end
  }
}
