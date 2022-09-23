(let [{ : cmd : g : o } vim]
  (set o.expandtab true)
  (set o.shiftwidth 0)
  (set o.softtabstop 0)
  (set o.tabstop 2)
  (set o.number true)
  (set g.mapleader " ")
  (set g.scrolloff 8)
  (set g.termguicolors true)

  ;; tree-sitter
  (let [ts (require :nvim-treesitter.configs)]
    (ts.setup { :highlight { :enable true } }))
  )

