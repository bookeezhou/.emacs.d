;;隐藏菜单栏、工具栏、滚动条
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;;显示时间
(display-time-mode 1) ;; 常显
(setq display-time-24hr-format t) ;;格式
(setq display-time-day-and-date t) ;;显示时间、星期、日期



;;高亮行颜色设置
;;(set-face-foreground 'highlight "white") 
;;(set-face-background 'highlight "blue")

;;区域选择的背景、前景色设置
;;(set-face-foreground 'region "cyan")
(set-face-background 'region "#eacd76")
;;(set-face-background 'region "#ECDA83")

;;Titlebar
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(let ((display-table (or standard-display-table (make-display-table))))
  (set-display-table-slot display-table 'vertical-border (make-glyph-code ?│)) ; or ┃ │
  (setq standard-display-table display-table))
(set-face-background 'vertical-border (face-background 'default))
(set-face-foreground 'vertical-border "grey")
;; line number
;;(global-linum-mode 1) (setq linum-format "%d|")


;;highlight当前行
(global-hl-line-mode 1)
(show-paren-mode t)                                              ;; 括号配对
(electric-pair-mode t)
(global-auto-revert-mode 1)                                      ;; 自动加载外部修改过的文件
(setq user-full-name "bookee"                                   ;; 设置用户名
      frame-title-mode t                                         ;; 在窗口的标题栏上显示文件名称
      frame-title-format "emacs@%b"                              ;; 设置标题栏
      inhibit-splash-screen t                                    ;; 关闭启动画面
;;      gnus-inhibit-startup-message t                             ;; 关闭引导界面
      make-backup-files nil                                      ;; 关闭自动备份文件~
      backup-inhibited t                                         ;; 不产生备份
      auto-save-mode nil                                         ;; 自动保存模式
      truncate-lines nil                                         ;; 自动换行
      transient-mark-mode t                                      ;; 高亮显示选择区域
;;      blink-cursor-blinks 2                                      ;; 光标闪烁3次
      global-font-lock-mode t                                    ;; 进行语法加亮
      show-paren-style 'parenthesis                              ;; 只高亮括号
;;      require-final-newline t                                    ;; 自动的在文件末增加一新行
      track-eol t                                                ;; 当光标在行尾上下移动的时候，始终保持在行尾。
;;      c-default-style "awk"                                      ;; 设置c++编译颜色风格
;;      visible-bell t                                             ;; 关闭提示音
;;      ring-bell-function 'ignore                                 ;; 没有提示音，也不闪屏
;;      initial-frame-alist (quote ((fullscreen . maximized)))     ;; 默认全屏
)


(use-package emacs
  :if (display-graphic-p)
  :config
  ;;Font Settings
  (if *is-windows*
      (progn
	(set-face-attribute 'default nil :font "Microsoft Yahei Mono 9")
	(dolist (charset '(kana han synbol cjk-misc bpomofo))
	  (set-fontset-font (frame-parameter nil 'font)
	  charset (font-spec :famil "Microsoft Yahei Mon" :size 12))))
    (set-face-attribute 'default nil :font "Source Code Pro 12"))
  ;;设置行号
  (setq display-line-numbers-type 't)
  (global-display-line-numbers-mode t))

;;-----------------------------------------------------------------
;; 设置主题
;;-----------------------------------------------------------------
(use-package gruvbox-theme
  :init (load-theme 'gruvbox-dark-soft t))
(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'respectful)
  (sml/setup))


;;暴露lisp脚本
(provide 'init-ui)
