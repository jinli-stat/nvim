
return {
  'Vigemus/iron.nvim',
  config = function()
    local iron = require('iron.core')
    
    iron.setup {
      config = {
        scratch_repl = true,
        repl_definition = {
          julia = {
            command = { 'julia', '--startup-file=no', '--history-file=no' }
          }
        },
        repl_open_cmd = 'vertical botright 80 split', -- 垂直分割，右侧80列宽
        -- 如果想要水平分割，使用：'botright 20 split'
      },
      -- 不设置 keymaps，使用下面的全局快捷键
      highlight = {
        italic = true
      },
      ignore_blank_lines = true,
    }

    -- 快捷键映射
    -- <leader>sr - 启动/聚焦 Julia REPL（会在右侧打开垂直分割窗口）
    vim.keymap.set('n', '<leader>sr', '<cmd>IronRepl<CR>', { desc = 'Iron: Start/Focus REPL' })
    
    -- <leader>sc - 发送当前行（Normal模式）或选中内容（Visual模式）到 REPL
    vim.keymap.set('n', '<leader>sc', function() iron.send_line() end, { desc = 'Iron: Send current line' })
    vim.keymap.set('v', '<leader>sc', function() iron.visual_send() end, { desc = 'Iron: Send selection' })
    
    -- <leader>sf - 发送整个文件到 REPL
    vim.keymap.set('n', '<leader>sf', function() iron.send_file() end, { desc = 'Iron: Send entire file' })
    
    -- <leader>sx - 重启 REPL（清除所有变量和状态）
    vim.keymap.set('n', '<leader>sx', '<cmd>IronRestart<CR>', { desc = 'Iron: Restart REPL' })
    
    -- <leader>sq - 隐藏 REPL 窗口（不关闭，只是隐藏）
    vim.keymap.set('n', '<leader>sq', '<cmd>IronHide<CR>', { desc = 'Iron: Hide REPL' })
    
    -- 额外有用的快捷键
    -- <leader>si - 中断当前 REPL 执行（相当于按 Ctrl+C）
    vim.keymap.set('n', '<leader>si', function() iron.interrupt() end, { desc = 'Iron: Interrupt REPL' })
    
    -- <leader>cl - 清除 REPL 屏幕内容
    vim.keymap.set('n', '<leader>cl', function() iron.clear() end, { desc = 'Iron: Clear REPL screen' })
    
    -- <leader>ss - 聚焦到 REPL 窗口（光标跳转到 REPL）
    vim.keymap.set('n', '<leader>ss', function() iron.focus_on() end, { desc = 'Iron: Focus on REPL' })
  end,
}