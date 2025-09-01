vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

-- No highights
vim.keymap.set("n", "<leader>h", "<cmd>noh<CR>", { desc = "No highights" });


vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

--Replacing the file
vim.keymap.set("n", "<leader>;", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current text" })

--Making the file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Close a window
vim.keymap.set('n', '<C-q>', '<C-w>q')

-- Jump between buffers
vim.keymap.set('n', 'th', [[<Cmd>bprev<CR>]], { desc = "Jump to previous buffer" })
vim.keymap.set('n', 'tl', [[<Cmd>bnext<CR>]], { desc = "Jump to next buffer" })
vim.keymap.set('n', 'tc', [[<Cmd>bdelete<CR>]], { desc = "Close current buffer" })

-- Toggle nvim illuminate
vim.keymap.set('n', '<leader>k', [[<Cmd>IlluminateToggle<CR>]], { desc = "Disable LSP Highlights" })

-- Go to next reference.
vim.keymap.set('n', '<leader>n', [[<Cmd>lua require('illuminate').goto_next_reference()<CR>]],
{ desc = "Go to next reference" })
-- Go to previous reference
vim.keymap.set('n', '<leader>N', [[<Cmd>lua require('illuminate').goto_prev_reference()<CR>]],
{ desc = "Go to previous reference" })

vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>')
vim.keymap.set('t', '<C-q>', '<C-\\><C-n><C-w>q')
vim.keymap.set('t', '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<A-l>', '<C-\\><C-n><C-w>l')

-- Opens an existing terminal window in a horizontal split.
-- Creates a new one if it doesn't exists
function OpenTerminalBuffer()
  local terminal_bufnr = nil
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(bufnr, 'buftype') == 'terminal' then
      terminal_bufnr = bufnr
      break
    end
  end

  -- Check if there's an existing terminal buffer
  if terminal_bufnr ~= nil then
    -- Open the existing terminal buffer in a new split window below the current buffer
    vim.api.nvim_command('belowright sb' .. terminal_bufnr)     -- Adjust the width as needed
  else
    -- Create a new terminal buffer
    vim.api.nvim_command('belowright new sb')     -- Adjust the width as needed
    vim.fn.termopen('bash')
  end
end

-- Open a horizontal split terminal
vim.keymap.set('n', 'to', [[<Cmd>lua OpenTerminalBuffer()<CR>a]],
{ desc = "Open a terminal in a horizontal split below the current buffer" })
