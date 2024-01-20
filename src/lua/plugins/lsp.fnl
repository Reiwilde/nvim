{1 :neovim/nvim-lspconfig
 :dependencies [:folke/which-key.nvim :nvim-telescope/telescope.nvim]
 :lazy false
 :config (fn []
           (let [{: cmd : lsp} vim
                 {: nvim_create_autocmd} vim.api
                 {: register} (require :which-key)
                 telescope (require :telescope.builtin)]
             ;; lsp
             (nvim_create_autocmd :LspAttach
                                  {:callback (lambda [args]
                                               (register {:gD [lsp.buf.declaration
                                                               "[G]oto [D]eclariation"]
                                                          :gd [lsp.buf.definition
                                                               "[G]oto [D]efinition"]
                                                          :gI [lsp.buf.implementation
                                                               "[G]oto [I]mplementation"]
                                                          :gr [telescope.lsp_references
                                                               "[G]oto [R]eferences"]
                                                          :K [lsp.buf.hover
                                                              "Hover Documentation"]
                                                          :<C-k> [lsp.buf.signature_help
                                                                  "Signature Documentation"]}
                                                         {:buffer args.buf}))})))}
