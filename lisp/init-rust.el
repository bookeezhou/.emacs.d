
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

(with-eval-after-load 'rust-mode
  (define-key rust-mode-map (kbd "C-e C-e C-r") 'my-cargo-run))
(defun my-cargo-run ()
  "Build and run Rust code."
  (interactive)
  (cargo-process-run)
  (let (
      (orig-win (selected-window))
      (run-win (display-buffer (get-buffer "*Cargo Run*") nil 'visible))
    )
    (select-window run-win)
    (comint-mode)
    (read-only-mode 0)
    (select-window orig-win)
  )
)  

(use-package flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))


(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "RUST_SRC_PATH")

(provide 'init-rust)
