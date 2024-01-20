{1 :hrsh7th/nvim-cmp
 :dependencies [:folke/which-key.nvim
                :hrsh7th/cmp-buffer
                :hrsh7th/cmp-cmdline
                :hrsh7th/cmp-nvim-lsp
                :hrsh7th/vim-vsnip
                :neovim/nvim-lspconfig]
 :lazy false
 :config (fn []
           (let [{: config : mapping : setup} (require :cmp)
                 ;;{: default_capabilities} (require :cmp_nvim_lsp)
                 {: register} (require :which-key)]
             ;; (local capabilities (default_capabilities))
             ;; typescript
             ;; (let [{: tsserver} (require :lspconfig)]
             ;;  (tsserver.setup {:capabilities capabilities}))
             (local {: preset} mapping)
             (setup {:snippet {:expand (lambda [args]
                                         ((. vim.fn "vsnip#anonymous") args.body))}
                     :sources (config.sources [{:name :nvim_lsp}])})
             (setup.cmdline "/"
                            {:mapping (preset.cmdline)
                             :sources (config.sources [{:name :buffer}])})
             (setup.cmdline ":"
                            {:mapping (preset.cmdline)
                             :sources (config.sources [{:name :path}]
                                                      [{:name :cmdline
                                                        :option {:ignore_cmds [:Man
                                                                               "!"]}}])})
             (register {:<C-Space> [mapping.complete :Complete]})
             (register {:<C-e> [mapping.aboart :Abort]})
             (register {:<C-n> [mapping.select_next_item "Next item"]})
             (register {:<C-p> [mapping.select_prev_item "Previous item"]})
             (register {:<CR> [(mapping.confirm {:select true})
                               "Previous item"]})))}
