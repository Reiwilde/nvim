{1 :folke/which-key.nvim
 :lazy false
 :version :3.17.0
 :config (fn []
           (let [{: cmd} vim]
             ;; terminal
             (cmd "inoremap JJ <C-[>")
             (cmd "tnoremap GG <C-\\><C-n>")))}
