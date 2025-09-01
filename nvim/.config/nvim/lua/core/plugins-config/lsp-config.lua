-- See https://gpanders.com/blog/whats-new-in-neovim-0-11/ for a nice overview
-- of how the lsp setup works in neovim 0.11+.

require("mason-lspconfig").setup()

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    -- Disable omnifunc for now
    -- if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
    --   vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
    --   vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    --   vim.keymap.set('i', '<C-Space>', function()
    --     vim.lsp.completion.get()
    --   end)
    -- end

    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end
      vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = desc })
    end

    -- Enable code actions on normal and visual mode
    vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = '[C]ode [A]ction' })

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>f', function ()
      vim.lsp.buf.format({
        async = true,
        bufnr = ev.buf,
      }) end
      , '[F]ormat')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')
  end,
})

-- Diagnostics
vim.diagnostic.config({
  -- Use the default configuration
  -- virtual_lines = true

  -- Alternatively, customize specific options
  virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor line
    current_line = true,
  },
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
capabilities = capabilities
