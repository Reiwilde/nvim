{1 :nvim-treesitter/nvim-treesitter
 :dependencies [:hiphish/nvim-ts-rainbow2]
 :lazy false
 :config (fn []
           (let [{: setup} (require :nvim-treesitter.configs)]
             (setup {:ensure_installed [:fennel
                                        :java
                                        :javascript
                                        :lua
                                        :rust
                                        :typescript
                                        :vim
                                        :vimdoc
                                        :yaml]
                     :highlight {:enable true
                                 :additional_vim_regex_highlighting false}
                     :indent {:enable true}
                     :rainbow {:enable true}})))}
