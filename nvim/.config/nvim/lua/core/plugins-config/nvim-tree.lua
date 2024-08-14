vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    width = {
      min = 10,
      max = 30
    }
  },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  disable_netrw = false,
  hijack_netrw = true,
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = false,
  },
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
