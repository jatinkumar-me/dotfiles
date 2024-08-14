local null_ls = require("null-ls")
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    -- javascript/typescript
    -- null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.vale,
    null_ls.builtins.formatting.eslint,
    -- golang
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.formatting.latexindent,
    null_ls.builtins.formatting.beautysh,
  },
  --[[ on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          vim.lsp.buf.format({ async = false });
        end,
      })
    end
  end ]]
})
