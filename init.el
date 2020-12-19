
;;指定加载lisp脚本的目录
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))

;;用户界面操作的包文件，放到指定位置
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-elpa)
(require 'init-consts)
(require 'init-kbd)
(require 'init-startup)
(require 'init-packages)
(require 'init-rust)
(require 'init-lsp)
;;调用init-ui.el脚本
(require 'init-ui)



(when (file-exists-p custom-file)
  (load-file custom-file))

