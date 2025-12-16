return {
  -- https://github.com/echasnovski/mini.nvim
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function ()

      require('mini.cmdline').setup()
      require('mini.completion').setup()
      require('mini.cursorword').setup()
      require('mini.extra').setup()
      require('mini.git').setup()
      require('mini.move').setup()
      require('mini.pairs').setup()
      require('mini.pick').setup()
      require('mini.splitjoin').setup()
      require('mini.statusline').setup()
      require('mini.surround').setup()
      require('mini.trailspace').setup()
      require('mini.visits').setup()

      local gen_ai_spec = require('mini.extra').gen_ai_spec
      require('mini.ai').setup{
        custom_textobjects = {
          B = gen_ai_spec.buffer(),
          D = gen_ai_spec.diagnostic(),
          I = gen_ai_spec.indent(),
          N = gen_ai_spec.number(),
        },
        n_lines = 500,
        silent = true,
      }

      require('mini.align').setup{
        mappings = {
          start = 'gA',
          start_with_preview = 'ga',
        }
      }

      require('mini.basics').setup({
        options = {
          basic = true,
          extra_ui = true,
          win_borders = 'default',
        },
        mappings = {
          basic = true,
          option_toggle_prefix = '',
          windows = false,
          move_with_alt = true,
        },
        autocommands = {
          basic = true,
          relnum_in_visual_mode = false,
        },
        silent = false,
      })

      require('mini.bracketed').setup{
        file       = { suffix = '' },
        diagnostic = { suffix = '' },
        oldfile    = { suffix = '' },
        treesitter = { suffix = '' },
        undo       = { suffix = '' },
        yank       = { suffix = '' },
      }

      local gen_clues = require('mini.clue').gen_clues
      require('mini.clue').setup{
        window = {
          delay = 500,
        },
        triggers = {
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },
          { mode = 'i', keys = '<C-x>' },
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },
          { mode = 'n', keys = '<C-w>' },
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },

        clues = {
          gen_clues.builtin_completion(),
          gen_clues.g(),
          gen_clues.marks(),
          gen_clues.registers(),
          gen_clues.windows(),
          gen_clues.z(),
        },
      }

      require('mini.diff').setup{
        view = {
          style = 'sign',
          signs = { add = '▎', change = '▎', delete = '▎' },
        },
      }

      local hex_clr = {}
      hex_clr = require('mini.hipatterns').gen_highlighter.hex_color()

      require('mini.hipatterns').setup{
        highlighters = {
          hex_color = hex_clr,
          url       = { pattern = 'http[s]?://[^>%]%)\'"]+', group = 'Url'},

          date = {
            pattern = function(buf_id)
              if vim.bo[buf_id].filetype == 'text' then return nil end
              return '()%d%d%d%d[-|/]%d%d[-|/]%d%d()'
            end,
            group = 'Date'
          },

          fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
          hack  = { pattern = 'HACK',  group = 'MiniHipatternsHack'  },
          todo  = { pattern = 'TODO',  group = 'MiniHipatternsTodo'  },
          note  = { pattern = 'NOTE',  group = 'MiniHipatternsNote'  },
        },
      }

      require('mini.indentscope').setup{
        draw = {
          animation = require('mini.indentscope').gen_animation.none()
        },
        symbol = "│",
      }

      require('mini.jump').setup{
        delay = { idle_stop = 10 }
      }

      require('mini.operators').setup{
        exchange = {prefix = 'ge'},
        replace = {prefix = 'gR'},
      }

      local latex_patterns = { 'latex/**/*.json', '**/latex.json', 'plaintex.lua' }
      local web_patterns = { 'html.json', 'css.json', 'javascript/*.json', '**/javascript.json',  }
      local md_patterns = { 'markdown.lua', 'markdown.json', '**/markdown.json' }

      local lang_patterns = {
        astro = web_patterns,
        javascript = web_patterns,
        typescript = web_patterns,
        tex = latex_patterns,
        plaintex = latex_patterns,
        markdown_inline = md_patterns,
      }

      local gen_loader = require('mini.snippets').gen_loader
      require('mini.snippets').setup{
        snippets = {
          gen_loader.from_file('~/.config/nvim/snippets/global.lua'),
          gen_loader.from_lang({ lang_patterns = lang_patterns }),
        },
      }

      require('mini.keymap').setup()

      --Tab completion
      local mk = require('mini.keymap')
      mk.map_multistep('i', '<Tab>',   { 'pmenu_next' })
      mk.map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
      mk.map_multistep('i', '<CR>',    { 'pmenu_accept', 'minipairs_cr' })
      mk.map_multistep('i', '<BS>',    { 'minipairs_bs' })

      --Lazy navigation
      local notify_many_keys = function(key)
        local lhs = string.rep(key, 7)
        local action = function() vim.notify('Too many ' .. key) end
        require('mini.keymap').map_combo({ 'n', 'x' }, lhs, action)
      end
      notify_many_keys('h')
      notify_many_keys('j')
      notify_many_keys('k')
      notify_many_keys('l')

      require('mini.notify').setup{
        lsp_progress = {
          enable = false,
        }
      }
      vim.notify = require('mini.notify').make_notify()

      local map = vim.keymap.set

      -- mini.basic
      map({ 'n', 'i', 'x' }, '<C-s>', '<Nop>')

      --- mini.diff
      map('n', '<Leader>hp', '<Cmd> lua MiniDiff.toggle_overlay()<CR>', {desc='Hunk Preview'})

      -- mini.pick / mini.extra
      map('n', '<Leader>1', '<Cmd> lua MiniExtra.pickers.oldfiles()<CR>', {desc='Pick Recent Files'})
      map('n', '<Leader>D', '<Cmd> lua MiniExtra.pickers.diagnostic()<CR>', {desc='Pick Diagnostics'})
      map('n', '<Leader>e', '<Cmd> lua MiniExtra.pickers.explorer()<CR>', {desc='Pick Explorer'})
      map('n', '<Leader>:', '<Cmd> lua MiniExtra.pickers.history()<CR>', {desc='Pick Command History'})
      map('n', '<Leader>fd', '<Cmd> lua MiniPick.builtin.files()<CR>', {desc='Pick Find Files'})
      map('n', '<Leader>gb', '<Cmd> lua MiniExtra.pickers.git_branches()<CR>', {desc='Pick Git Branches'})
      map('n', '<Leader>gB', '<Cmd> lua MiniExtra.pickers.git_branches({ scope = "local" })<CR>', {desc='Pick Git Local Branches'})
      map('n', '<Leader>gc', '<Cmd> lua MiniExtra.pickers.git_commits()<CR>', {desc='Pick Git Commits'})
      map('n', '<Leader>gf', '<Cmd> lua MiniExtra.pickers.git_files()<CR>', {desc='Pick Git Files'})
      map('n', '<Leader>gF', '<Cmd> lua MiniExtra.pickers.git_files({ scope="modified" })<CR>', {desc='Pick Git Modified Files'})
      map('n', '<Leader>gh', '<Cmd> lua MiniExtra.pickers.git_hunks({})<CR>', {desc='Pick Git Hunks'})
      map('n', '<Leader>q', '<Cmd> lua MiniExtra.pickers.list({ scope = "quickfix" })<CR>', {desc='Pick Quickfix List'})
      map('n', '<Leader>rg', '<Cmd> lua MiniPick.builtin.grep_live()<CR>', {desc='Pick Grep'})

      -- mini.visits
      map('n', '<Leader>va', '<Cmd> lua MiniVisits.add_label()<CR>', { desc = 'Add Label' })
      map('n', '<Leader>vA', '<Cmd> lua MiniVisits.add_label("core")<CR>', { desc = 'Add Label Core' })
      map('n', '<Leader>vr', '<Cmd> lua MiniVisits.remove_label()<CR>', { desc = 'Remove Label' })
      map('n', '<Leader>vR', '<Cmd> lua MiniVisits.remove_label("core")<CR>', { desc = 'Remove Label Core' })
      map('n', '<Leader>vc', '<Cmd> lua MiniVisits.select_path("", { filter = "core" })<CR>', { desc = 'List Visit Path Core' })
      map('n', '<Leader>vC', '<Cmd> lua MiniVisits.select_path(nil, { filter = "core" })<CR>', { desc = 'List Visit Path cwd' })
      map('n', '<Leader>vl', '<Cmd> lua MiniExtra.pickers.visit_labels()<CR>', {desc='Pick Visit Label'})
      map('n', '<Leader>vL', '<Cmd> lua MiniExtra.pickers.visit_paths()<CR>', {desc='Pick Visit Paths'})

      -- Iterate based on recency
      local sort_latest = MiniVisits.gen_sort.default({ recency_weight = 1 })
      local map_iterate_core = function(lhs, direction, desc)
        local opts = { filter = 'core', sort = sort_latest, wrap = true }
        local rhs = function()
          MiniVisits.iterate_paths(direction, vim.fn.getcwd(), opts)
        end
        vim.keymap.set('n', lhs, rhs, { desc = desc })
      end

      map_iterate_core('[V', 'last',     'Core label (earliest)')
      map_iterate_core('[v', 'forward',  'Core label (earlier)')
      map_iterate_core(']v', 'backward', 'Core label (later)')
      map_iterate_core(']V', 'first',    'Core label (latest)')

      -- mini.trailspace
      map('n', '<Leader>t', '<Cmd>lua MiniTrailspace.trim()<CR>', {desc='Trim trailing space'})
      map('n', '<Leader>T', '<Cmd>lua MiniTrailspace.trim_last_lines()<CR>', {desc='Trim trailing lines'})

      -- mini.ai
      local nxo = {'n','x','o'}
      map(nxo, ']a', "MiniAi.move_cursor('left', 'i', 'a')", {desc='Next argument'})
      map(nxo, '[a', "MiniAi.move_cursor('left', 'i', 'a', {search_method='prev'})", {desc='Previous argument'})
      map(nxo, ']F', "MiniAi.move_cursor('left', 'i', 'f')", {desc='Next function'})
      map(nxo, '[F', "MiniAi.move_cursor('left', 'i', 'f', {search_method='prev'})", {desc='Previous function'})

    end
  }
}
