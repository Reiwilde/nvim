{1 :nvim-telescope/telescope.nvim
 :tag :0.1.5
 :dependencies [:folke/which-key.nvim :nvim-lua/plenary.nvim]
 :lazy false
 :config (fn []
           (let [{: setup} (require :telescope)
                 telescope (require :telescope.builtin)
                 {: register} (require :which-key)]
             (setup {:pickers {:find_files {:find_command [:fd
                                                           :--hidden
                                                           :--follow
                                                           :--type=f
                                                           :--color=never
                                                           :--exclude=.git/*]}}})
             ;; general
             (register {:<Leader> {:h [telescope.help_tags "Help Tags"]}})
             ;; buffer
             (register {:<Leader>b {:f [telescope.buffers :Buffers]}})
             ;; git
             (register {:<Leader>g {:f [telescope.git_files "Find Files"]}})
             ;; project
             (register {:<Leader>p {:f [telescope.find_files "Find Files"]
                                    :g [telescope.live_grep "Live Grep"]
                                    :r [telescope.oldfiles "Old Files"]}})))}
