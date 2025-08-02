{1 :folke/which-key.nvim
 :lazy false
 :config (fn []
           (let [{: cmd} vim]
             ;; terminal
             (cmd "inoremap JJ <C-[>")
             (cmd "tnoremap GG <C-\\><C-n>")))}
