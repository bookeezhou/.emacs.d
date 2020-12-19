
;;; init-packages.el --- this is package settings

;;; Commentary:重启emacs
;;; Code:

(use-package restart-emacs)

(global-set-key [f2] 'neotree-toggle)
(global-set-key [f8] 'neotree-dir)


(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))

;;删除行增强插件
(use-package crux
  :bind (("C-a" . crux-move-beginning-of-line)
	 ("C-c ^" . crux-top-join-line)
	 ("C-x ," . crux-find-user-init-file)
	 ("C-S-d" . crux-duplicate-current-line-or-region)
	 ;;("C-c k" . crux-smart-kill-line)
	 ("C-S-k" . crux-smart-kill-line)))

;;窗口跳转
(use-package ace-window
  :bind (("M-o" . 'ace-window)))


;;按下键盘提示哪些快捷键可以操作
(use-package which-key
  :defer nil
  :config (which-key-mode))

;;一次性删除光标前后空白区域
(use-package hungry-delete
  :bind (("C-c DEL" . hungry-delete-backward))
  :bind (("C-c d" . hungry-delete-forward)))

;;移动行/块
(use-package drag-stuff
  :bind (("<M-up>" . drag-stuff-up)
	 ("<M-down>" . drag-stuff-down)))


;; Settings for company
(use-package company
  :diminish (company-mode " Com.")
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :hook (after-init . global-company-mode)
  :config (setq company-dabbrev-code-everywhere t
		        company-dabbrev-code-modes t
		        company-dabbrev-code-other-buffers 'all
		        company-dabbrev-downcase nil
		        company-dabbrev-ignore-case t
		        company-dabbrev-other-buffers 'all
		        company-require-match nil
		        company-minimum-prefix-length 1
		        company-show-numbers t
		        company-tooltip-limit 20
		        company-idle-delay 0
		        company-echo-delay 0
		        company-tooltip-offset-display 'scrollbar
		        company-begin-commands '(self-insert-command)))


;; Better sorting and filtering
(use-package company-prescient
  :init (company-prescient-mode 1))


;;查找
;; ivy & counsel & swipter
(use-package ivy-posframe
  :init
  (setq ivy-posframe-display-functions-alist
	'((swiper . ivy-posframe-display-at-frame-center)
	  (complete-symbol . ivy-posframe-display-at-poin)
	  (counsel-M-x . ivy-posframe-display-at-frame-center)
	  (counsel-find-file . ivy-posframe-display-at-frame-center)
	  (ivy-switch-buffer . ivy-posframe-display-at-frame-center)
	  (t . ivy-posframe-display-at-frame-center)))
  (ivy-posframe-mode 1))

(use-package ivy
  :defer 1
  :demand
  :diminish
  :hook (after-init . ivy-mode)
  :config (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-initial-inputs-alist nil
        ivy-count-format "%d/%d "
        enable-recursive-minibuffers t
        ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
  ;;(ivy-posframe-mode 1)
  )

(use-package ivy-rich
  :hook (after-init . ivy-rich-mode))

(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	     ("C-h b" . counsel-descbinds)
	     ("C-h f" . counsel-describe-function)
	     ("C-h v" . counsel-describe-variable)
         ("C-x C-f" . counsel-find-file)
         ("C-c f" . counsel-recentf)
         ("C-c g" . counsel-git)))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
                swiper-include-line-number-in-search t))

(use-package flycheck
  :hook (prog-mode . flycheck-mode))


(provide 'init-packages)
