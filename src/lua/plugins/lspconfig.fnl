{1 :neovim/nvim-lspconfig
 :lazy false
 :config (fn []
           (let [{: diagnostic} vim
                 {: config} vim.lsp]
             (diagnostic.config {:virtual_lines {:current_line true}})
             (config "*" {:root_markers [:.git]})
             (set config.yarn_eslint (vim.deepcopy config.eslint))
             (config :yarn_eslint
                     {:cmd [:yarn
                            :dlx
                            "--package=vscode-langservers-extracted@4.10.0"
                            :vscode-eslint-language-server
                            :--stdio]})
             (set config.yarn_graphql (vim.deepcopy config.graphql))
             (config :yarn_graphql
                     {:cmd [:yarn
                            :dlx
                            "--package=graphql@16.11.0"
                            "--package=graphql-language-service-cli@3.5.0"
                            :graphql-lsp
                            :server
                            :--method=stream]})
             (set config.yarn_tsc (vim.deepcopy config.ts_ls))
             (config :yarn_tsc
                     {:cmd [:yarn
                            :dlx
                            "typescript-language-server@4.3.4"
                            :--stdio]
                      :init_options {:hostInfo :neovim
                                     :tsserver {:path :./node_modules/typescript/bin/tsserver}}})))}
