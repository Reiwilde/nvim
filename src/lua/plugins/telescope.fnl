;; https://github.com/nvim-telescope/telescope.nvim
;; telescope.nvim is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core. Telescope is centered around modularity, allowing for easy customization.
;; Community driven builtin pickers, sorters and previewers.

{1 :nvim-telescope/telescope.nvim
 :branch :master
 ;:tag :0.1.8
 :dependencies [:folke/which-key.nvim :nvim-lua/plenary.nvim]
 :lazy false
 :config (fn []
           (let [{: setup} (require :telescope)
                 telescope (require :telescope.builtin)
                 {: add} (require :which-key)]
             (setup {:defaults {:path_display [:filename_first :truncate]}
                     :pickers {:find_files {:hidden true}
                               :live_grep {:additional_args [:--hidden :--trim]
                                           :glob_pattern [:!/.git :!/.yarn/]}}})
             (add [{1 :<Leader>f :group :Telescope}
                   {1 :<Leader>fb 2 telescope.buffers :desc :Buffers}
                   {1 :<Leader>ff 2 telescope.find_files :desc "Find files"}
                   {1 :<Leader>fg 2 telescope.live_grep :desc "Live grep"}
                   {1 :<Leader>fh 2 telescope.help_tags :desc "Help tags"}
                   {1 :<Leader>fr 2 telescope.oldfiles :desc "Old files"}
                   {1 :<Leader>fv 2 telescope.git_files :desc "Git files"}])))}
