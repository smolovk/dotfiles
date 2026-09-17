return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    require('orgmode').setup({
      org_agenda_files = '~/org/**/*',
      org_default_notes_file = '~/org/log.org',
    })

    vim.keymap.set('n', '<leader>x', function()
      local line = vim.api.nvim_get_current_line()
      local row = vim.api.nvim_win_get_cursor(0)[1]

      if line:match('%[ %]') then
        local timestamp = os.date('[%Y-%m-%d %a %H:%M]')
        local new_line = line:gsub('%[ %]', '[X]', 1) .. ' ' .. timestamp
        vim.api.nvim_buf_set_lines(0, row - 1, row, false, { new_line })
      elseif line:match('%[X%]') then
        local new_line = line:gsub('%[X%]', '[ ]', 1):gsub('%s*%[%d%d%d%d%-%d%d%-%d%d.-$', '')
        vim.api.nvim_buf_set_lines(0, row - 1, row, false, { new_line })
      end
    end, { desc = 'Toggle checkbox with timestamp' })

    vim.lsp.enable('org')
  end,
}
