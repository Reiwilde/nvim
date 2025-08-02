{1 :nvim-treesitter/nvim-treesitter
 :dependencies []
 :lazy false
 :config (fn []
           (let [{: setup} (require :nvim-treesitter.configs)]
             (setup {:ensure_installed [:dockerfile
                                        :elixir
                                        :erlang
                                        :fennel
                                        :gleam
                                        :java
                                        :javascript
                                        :lua
                                        :nix
                                        :rust
                                        :terraform
                                        :tsx
                                        :typescript
                                        :vim
                                        :vimdoc
                                        :yaml]
                     :highlight {:enable true
                                 :additional_vim_regex_highlighting false}
                     :indent {:enable true}
                     :rainbow {:enable false}})))}
