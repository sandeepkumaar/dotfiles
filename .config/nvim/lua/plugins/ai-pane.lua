return {
  'dansomething/ai-pane.nvim',
  lazy = false,
  config = function()
    require('ai-pane').setup({
      -- 'claude' starts Claude Code CLI
      command = 'claude',

      -- Restrict search to current tmux window only
      current_window_only = true,
    })
  end,
}
