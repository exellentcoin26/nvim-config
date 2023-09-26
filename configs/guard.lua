local ft = require("guard.filetype")

ft("python"):fmt("black"):append("lsp")

local guard = require("guard")
guard.setup({
  fmt_on_save = true,
  lsp_as_default_formatter = true,
})
