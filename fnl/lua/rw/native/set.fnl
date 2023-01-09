(global {: cmd : g : opt} vim)
(global {: has} vim.fn)

(set g.mapleader " ")

(when (has :termguicolors)
  (set opt.termguicolors true))

(set opt.background :dark)
(set opt.cursorcolumn true)
(set opt.cursorline true)

(set opt.number true)
(set opt.relativenumber true)

(set opt.scrolloff 8)
(set opt.wrap false)

(set opt.autoindent true)
(set opt.expandtab true)
(set opt.shiftwidth 0)
(set opt.smartindent true)
(set opt.softtabstop 0)
(set opt.tabstop 2)
(set opt.hlsearch false)
(set opt.incsearch true)

(set opt.splitbelow true)
(set opt.splitright true)
