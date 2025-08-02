(let [{: cmd : env : g : opt} vim
      {: has : system} vim.fn]
  (when (not g.vscode)
    (set env.PATH
         (.. env.PATH ":" (system "echo -n $(dirname $MYVIMRC)") :/bin))
    (set env.PATH (.. env.PATH ":" (system "echo -n $(dirname $MYVIMRC)")
                      :/bin/ (system "echo -n $(uname -s)") "-"
                      (system "echo -n $(uname -m)")))
    (set g.mapleader " ")
    (set g.netrw_bufsettings "noma nomod nu rnu nobl nowrap ro")
    (when (has :termguicolors)
      (set opt.termguicolors true))
    (set opt.autoindent true)
    (set opt.background :dark)
    (set opt.clipboard :unnamedplus)
    (set opt.cursorcolumn true)
    (set opt.cursorline true)
    (set opt.expandtab true)
    (set opt.exrc true)
    (set opt.hlsearch false)
    (set opt.incsearch true)
    (set opt.list true)
    (set opt.listchars {:eol "↲"
                        :leadmultispace " "
                        :multispace "•"
                        :tab "→ "
                        :trail "•"})
    (set opt.number true)
    (set opt.relativenumber true)
    (set opt.scrolloff 8)
    (set opt.signcolumn :yes)
    (set opt.splitbelow true)
    (set opt.splitright true)
    (set opt.tabstop 2)
    (set opt.shiftwidth 0)
    (set opt.smartindent true)
    (set opt.softtabstop 0)
    (set opt.wrap false)
    (require :packages)))
