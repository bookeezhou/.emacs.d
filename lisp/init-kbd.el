
;;yes/no简写
(use-package emacs
  :config (defalias 'yes-or-no-p 'y-or-n-p))

(when *is-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none))

(provide 'init-kbd)
