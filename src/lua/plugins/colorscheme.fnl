{1 :sainnhe/everforest
 :lazy false
 :priority 1000
 :config (fn []
           (let [{: cmd : g} vim]
             (set g.everforest_background :soft)
             (set g.everforest_better_performace 1)
             (cmd "colorscheme everforest")))}
