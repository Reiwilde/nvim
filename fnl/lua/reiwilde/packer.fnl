(let [{: cmd} vim 
      {: startup} (require :packer)]
  (cmd "packadd packer.nvim")

  (startup (lambda [use]
    (use :wbthomason/packer.nvim)
    (use :neovim/nvim-lspconfig)
    (use :glepnir/lspsaga.nvim)
    (use :edeneast/nightfox.nvim)

    (use {1 :nvim-treesitter/nvim-treesitter
          :run ":TSUpdate"})

    (use {1 :nvim-telescope/telescope.nvim 
          :tag :0.1.0 
          :requires [:nvim-lua/plenary.nvim]}))))
