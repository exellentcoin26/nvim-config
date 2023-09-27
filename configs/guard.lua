local ft = require("guard.filetype")

ft("python"):fmt("yapf") -- use yapf until black does not give a segmentation fault anymore
ft("rust"):fmt("rustfmt")
ft("lua"):fmt("stylua")

return {
  fmt_on_save = true,
  lsp_as_default_formatter = false,
}
