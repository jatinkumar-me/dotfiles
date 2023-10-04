local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- javascript/typescript
    null_ls.builtins.formatting.prettier,
    -- golang
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.formatting.latexindent
  },
})
