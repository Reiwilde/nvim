{1 :neanias/everforest-nvim
 :branch :main
 :lazy false
 :priority 1000
 :config (fn []
           (let [{: load : setup} (require :everforest)
                 {: o} vim]
             (set o.background :dark)
             ;(set o.background :light)
             (setup {:background :medium})
             (load)))}
