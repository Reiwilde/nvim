;; https://github.com/nvim-telescope/telescope.nvim
;; telescope.nvim is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core. Telescope is centered around modularity, allowing for easy customization.
;; Community driven builtin pickers, sorters and previewers.

{1 :nvim-telescope/telescope.nvim
 :tag :0.1.8
 :dependencies [:folke/which-key.nvim :nvim-lua/plenary.nvim]
 :lazy false
 :config (fn []
           (let [{: setup} (require :telescope)
                 telescope (require :telescope.builtin)
                 {: add} (require :which-key)]
             (setup {:defaults {:vimgrep_arguments [:rg
                                                    :--column
                                                    :--color=never
                                                    :--hidden
                                                    :--line-number
                                                    :--no-heading
                                                    :--smart-case
                                                    :--trim
                                                    :--with-filename]}
                     :pickers {:find_files {:find_command [:fd
                                                           :--color=never
                                                           :--follow
                                                           :--hidden
                                                           :--type=f]}}})
             (add [{1 :<Leader>f :group :Telescope}
                   {1 :<Leader>fb 2 telescope.buffers :desc :Buffer}
                   {1 :<Leader>ff 2 telescope.find_files :desc "Find Files"}
                   {1 :<Leader>fg 2 telescope.live_grep :desc "Live Grep"}
                   {1 :<Leader>fh 2 telescope.help_tags :desc "Help Tags"}
                   {1 :<Leader>fr 2 telescope.oldfiles :desc "Old Files"}
                   {1 :<Leader>fv 2 telescope.git_files :desc "Git Files"}])))}
