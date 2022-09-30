(let [{: keymap} vim
      opts {:noremap true :silent false}]

  ;; Lsp finder find the symbol definition implement reference
  ;; if there is no implement it will hide
  ;; when you use action in finder like open vsplit then you can
  ;; use <C-t> to jump back
  (keymap.set
    :n
    :<LEADER>lh
    "<CMD>Lspsaga lsp_finder<CR>"
    opts)

  ;; open lazygit in lspsaga float terminal
  (keymap.set
    :n
    :<LEADER>lt
    "<CMD>Lspsaga open_floaterm<CR>"
    opts)

  ;; close floaterm
  (keymap.set
    :t
    :<M-d>
    "<C-\\><C-n><CMD>Lspsaga close_floaterm<CR>"
    opts
  ))
