;;(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/melpa/")
;;			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;;                         ("org" . "http://elpa.emacs-china.org/org/")))


(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
                         ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))


;; 关闭签名校验
(setq package-check-signature nil)


(require 'package)

;; 初始化包管理器
(unless (bound-and-true-p pacakge--initialized)
  ;;启动不直接连接包源
  (setq package-enable-at-startup nil)
  (package-initialize))


;;刷新软件源索引
(unless package-archive-contents
   (package-refresh-contents))
(unless (package-installed-p 'use-package)
   (package-refresh-contents)
   (package-install 'use-package))

;; 配置 use-pacakge 通用配置
(eval-and-compile
(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-always-demand nil
      use-package-expand-minimally t
      use-package-verbose t))
 


(require 'use-package)

(provide 'init-elpa)
