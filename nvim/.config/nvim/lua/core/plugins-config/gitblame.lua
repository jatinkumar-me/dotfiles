vim.g.gitblame_date_format = '%r'

vim.cmd('GitBlameDisable')
vim.keymap.set('n', '<leader>gb', "<cmd>GitBlameToggle<CR>", { desc = "Toggle [G]it [B]lame" })
