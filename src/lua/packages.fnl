(let [{: opt} vim
      {: stdpath : system} vim.fn
      {: fs_stat} vim.loop]
  (local lazypath (.. (stdpath :data) :/lazy/lazy.nvim))
  (when (not (fs_stat lazypath))
    (system [:git
             :clone
             "--filter=blob:none"
             "https://github.com/folke/lazy.nvim.git"
             :--branch=stable
             lazypath]))
  (opt.rtp:prepend lazypath)
  (let [{: setup} (require :lazy)]
    (setup :plugins)))
