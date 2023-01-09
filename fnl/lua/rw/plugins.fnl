(global {: cmd : keymap : g} vim)

(let [{: startup} (require :packer)]
  (cmd "packadd packer.nvim")

  (startup 
    (lambda [use]
      (use :wbthomason/packer.nvim)

      (use {1 :nvim-treesitter/nvim-treesitter
            :disable g.vscode
            :run 
              (fn []
                (let [{: update} (require :nvim-treesitter.install)]
                  (local ts-update (update {:with_sync true}))
                  (ts-update)))

            :config
              (fn []
                (let [{: setup} (require :nvim-treesitter.configs)]
                  (setup {:ensure_installed [:fennel
                                             :javascript
                                             :help
                                             :lua
                                             :typescript]

                          :highlight {:enable true
                                      :additional_vim_regex_highlighting false}

                          :indent {:enable true
                                   :disable [:javascript
                                             :typescript]}

                          :rainbow {:enable false
                                    :extended_mode true}})))})

      (use {1 :neovim/nvim-lspconfig
            :disable g.vscode})

      (use {1 :hrsh7th/nvim-cmp
            :disable g.vscode
            :requires [:hrsh7th/cmp-buffer :hrsh7th/cmp-cmdline :hrsh7th/cmp-nvim-lsp]
            :config
              (fn []
                (let [{: config : mapping : setup} (require :cmp)
                      {: default_capabilities} (require :cmp_nvim_lsp)]

                  (local capabilities (default_capabilities))

                  ;; eslint
                  (let [{: eslint} (require :lspconfig)]
                    (eslint.setup {:capabilities capabilities}))

                  ;; typescript
                  (let [{: tsserver} (require :lspconfig)]
                    (tsserver.setup {:capabilities capabilities}))

                  (local {: preset} mapping)

                  (setup {:mapping (preset.insert {:<c-space> (mapping.complete)
                                                   :<c-n> (mapping.select_next_item)
                                                   :<c-p> (mapping.select_prev_item)
                                                   :<c-e> (mapping.abort)
                                                   :<cr> (mapping.confirm {:select true})})
                          
                          :sources (config.sources [{:name :nvim_lsp}])})

                  (setup.cmdline "/" {:mapping (preset.cmdline)
                                      :sources (config.sources [{:name :buffer}])})

                  (setup.cmdline ":" {:mapping (preset.cmdline)
                                      :sources (config.sources [{:name :path}] [{:name :cmdline
                                                                                 :option {:ignore_cmds ["Man" "!"]}}])})

                  ))})
      
      (use {1 :p00f/nvim-ts-rainbow
            :disable g.vscode
            :after :nvim-treesitter})

      (use {1 :nvim-telescope/telescope.nvim
            :disable g.vscode
            :tag "0.1.0"
            :requires :nvim-lua/plenary.nvim})

      (use {1 :tpope/vim-fugitive
            :disable g.vscode})

      (use {1 :folke/which-key.nvim
            :disable g.vscode})

      (use {1 :sainnhe/everforest
            :disable g.vscode
            :config 
              (fn [] 
                (set g.everforest_background :hard)
                (set g.everforest_better_performance 1)

                (cmd "colorscheme everforest"))})

      )))
