vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    width = {
      min = '10%',
      max = '20%'
    }
  },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true
  },
  filters = {
    git_ignored = false
  },
  system_open = {
    cmd = "open"
  }
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
