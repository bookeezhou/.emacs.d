
;;---------------------------------------------------
;;             RUST config
;;---------------------------------------------------
(use-package toml-mode)


(use-package rust-mode
  :hook (rust-mode . lsp))

(add-hook 'rust-mode-hook 'cargo-minor-mode)

;; rust tab 
(add-hook 'rust-mode-hook
	            (lambda () (setq indent-tabs-mode nil)))


;; Add keybindings for interacting with Cargo
(use-package cargo
  ;;(define-key rust-mode-map (kbd "C-c C-c") 'rust-run)
  )

(use-package flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))


(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "RUST_SRC_PATH")

(provide 'init-rust)
