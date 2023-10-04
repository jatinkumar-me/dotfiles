-- Config for indent blank line plugins.

local highlight = {
  "DarkGrayHighlight",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "DarkGrayHighlight", { fg = "#292A2B" })
end)

require("ibl").setup { indent = { highlight = highlight, char = "" }, scope = { show_start = false, char = "│"} }
