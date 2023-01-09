(global {: cmd : keymap : lsp} vim)
(global {: nvim_create_autocmd} vim.api)

;; terminal
(cmd "inoremap JJ <C-[>")
(cmd "tnoremap GG <C-\\><C-n>")

(let [{: register} (require :which-key)
      telescope (require :telescope.builtin)]

  ;; general
  (register {:<leader> {:h [telescope.help_tags "Help Tags"]}})

  ;; buffer
  (register {:<leader>b {:f [telescope.buffers "Buffers"]}})

  ;; git
  (register {:<leader>g {:f [telescope.git_files "Find Files"]}})

  ;; project
  (register {:<leader>p {:f [telescope.find_files "Find Files"]
                         :g [telescope.live_grep "Live Grep"]
                         :r [telescope.oldfiles "Old Files"]}})

  ;; lsp
  (nvim_create_autocmd
    :LspAttach
    {:callback
      (lambda [args]
        (register {:gD [lsp.buf.declaration "[G]oto [D]eclariation"]
                   :gd [lsp.buf.definition "[G]oto [D]efinition"]
                   :gI [lsp.buf.implementation "[G]oto [I]mplementation"]
                   :gr [telescope.lsp_references "[G]oto [R]eferences"]
                   :K [lsp.buf.hover "Hover Documentation"]
                   :<C-k> [lsp.buf.signature_help "Signature Documentation"]}

                  {:buffer args.buf}))})

  )
