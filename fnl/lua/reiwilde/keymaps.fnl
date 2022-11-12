(let [{: cmd : keymap : lsp} vim
      {: register} (require :which-key)
      telescope (require :telescope.builtin)]

  ;; terminal
  (cmd "inoremap JJ <C-[>")
  (cmd "tnoremap GG <C-\\><C-n>")

  ;; abduco
  (keymap.set
    [:n]
    :<c-z>
    :<nop>
    {:noremap true})

  ;; general
  (register {:<leader> {"," [telescope.buffers "Buffers"]
                        :<space> [telescope.find_files "Find files"]
                        :* [telescope.live_grep "Live grep"]
                        :h [telescope.help_tags "Help tags"]}})

  ;; buffer
  (register {:<leader>b {:B [telescope.buffers "Buffers"]}})

  ;; project
  (register {:<leader>p {:r [telescope.oldfiles "Old files"]}})

  ;; lsp
  (register {:<leader>l {:r [lsp.buf.rename "Rename"]}}))
