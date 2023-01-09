(global {: cmd : g} vim)

(when (not g.vscode)
  (require :rw/native/set))

(require :rw/plugins)

(when (not g.vscode)
  (require :rw/native/keymaps)

  (cmd "autocmd TermOpen * setlocal listchars= nonumber norelativenumber")
  (cmd (.. "augroup relative-line-number-toggle\n"
           "autocmd!\n"
           "autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != \"i\" | set rnu   | endif\n"
           "autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                    | set nornu | endif\n"
           "augroup end"))

  )
