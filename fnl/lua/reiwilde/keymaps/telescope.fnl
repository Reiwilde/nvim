(let [{: keymap} vim
      telescope (require :telescope.builtin)
      opts {:noremap true}]
  (keymap.set
    :n
    :<LEADER>fb
    telescope.buffers
    opts)
  (keymap.set
    :n
    :<LEADER>ff
    telescope.find_files
    opts)
  (keymap.set
    :n
    :<LEADER>fh
    telescope.help_tags
    opts)
  (keymap.set
    :n
    :<LEADER>fg
    telescope.live_grep
    opts))
