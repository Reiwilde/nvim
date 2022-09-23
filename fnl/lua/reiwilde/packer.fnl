(vim.cmd "packadd packer.nvim")

(let [packer (require :packer)]
  (packer.startup (lambda [use]
    (use :wbthomason/packer.nvim)
    (use {1 :nvim-treesitter/nvim-treesitter :run ":TSUpdate"})
    (use :EdenEast/nightfox.nvim))))

