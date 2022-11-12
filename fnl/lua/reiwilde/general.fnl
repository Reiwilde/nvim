(let [{: cmd : g : o} vim]
  (set g.mapleader " ")
  (set g.splitbelow true)
  (set g.splitright true)

  (set o.autoindent true)
  (set o.expandtab true)
  (set o.relativenumber true)
  (set o.scrolloff 8)
  (set o.shiftwidth 0)
  (set o.smartindent true)
  (set o.softtabstop 0)
  (set o.tabstop 2)

  (cmd "colorscheme catppuccin-macchiato")
  (cmd "au TermOpen * setlocal listchars= nonumber norelativenumber"))
