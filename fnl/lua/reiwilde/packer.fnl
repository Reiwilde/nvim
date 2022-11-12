(let [{: cmd : lsp} vim 
      {: startup} (require :packer)]
  (cmd "packadd packer.nvim")

  (startup (lambda [use]
    (use :wbthomason/packer.nvim)

    (use :edeneast/nightfox.nvim)

    (use {1 :catppuccin/nvim
          :as :catppuccin})

    (use {1 :hrsh7th/nvim-cmp
          :requires :hrsh7th/cmp-nvim-lsp
          :config (fn []
                    (let [{: mapping : setup} (require :cmp)]
                      (setup {:mapping (mapping.preset.insert {:<c-j> (mapping.select_next_item)
                                                               :<c-k> (mapping.select_prev_item)
                                                               :<c-e> (mapping.abort)
                                                               :<cr> (mapping.confirm {:select true})})
                              :sources [{:name :nvim_lsp}
                                        {:name :neorg}]})))})

    (use {1 :neovim/nvim-lspconfig
          :after :hrsh7th/nvim-cmp
          :config (fn []
                   (let [{: default_capabilities} (require :cmp_nvim_lsp)]
                     ;;(local capabilities (default_capabilities (lsp.protocol.make_client_capabilities)))
                     (local capabilities (default_capabilities))

                     ;; astro
                     (let [{: astro} (require :lspconfig)]
                       (astro.setup {:capabilities capabilities
                                     :cmd ["./node_modules/.bin/astro-ls"
                                           :--stdio]}))

                     ;; go
                     (let [{: gopls} (require :lspconfig)]
                       (gopls.setup {:capabilities capabilities}))

                     ;; typescript
                     (let [{: tsserver} (require :lspconfig)]
                       (tsserver.setup {:capabilities capabilities
                                        :cmd [:typescript-language-server 
                                              :--stdio
                                              :--tsserver-path "./node_modules/typescript/lib"]}))))})

    (use {1 :nvim-neorg/neorg
          :after :nvim-treesitter/nvim-treesitter
          :requires :nvim-lua/plenary.nvim
          :run ":Neorg sync-parsers"
          :config (fn []
                    (let [{: setup} (require :neorg)]
                      (setup {:load  {:core.defaults {}
                                      :core.norg.completion {:config {:engine :nvim-cmp}}}})))})

    (use {1 :nvim-telescope/telescope.nvim 
          :requires :nvim-lua/plenary.nvim
          :tag :0.1.0 
          :config (fn []
                    (let [{: setup} (require :telescope)
                             telescope (require :telescope.builtin)]
                      (setup {:pickers {:find_files {:find_command ["fd"
                                                                    "--type"
                                                                    "f"
                                                                    "--color=never"
                                                                    "--hidden"
                                                                    "--follow"
                                                                    "-E"
                                                                    ".git/*"]}}})))})

    (use {1 :nvim-treesitter/nvim-treesitter
          :config (fn []
                    (let [{: setup} (require :nvim-treesitter.configs)]
                      (setup {:ensure_installed [:astro
                                                 :bash
                                                 :css
                                                 :dockerfile
                                                 :fennel
                                                 :gitignore
                                                 :go
                                                 :html
                                                 :java
                                                 :javascript
                                                 :lua
                                                 :python
                                                 :scss
                                                 :typescript]
                              :highlight {:enable true}})))})

    (use {1 :folke/which-key.nvim
          :config (fn []
                    (let [{: setup} (require :which-key)]
                      (setup)))}))))
