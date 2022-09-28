(let [{: setup} (require :nvim-treesitter.configs)]
 (setup {:ensure_installed [:bash
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
          :highlight {:enable true}}))
