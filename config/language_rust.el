
;; (add-hook 'rust-mode-hook 'flycheck-mode)

;; (define-key yas-minor-mode-map [(tab)] nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)


(setq lsp-rust-server 'rust-analyzer) ;; deprecated
(setq rustic-lsp-server 'rust-analyzer)
(setq lsp-prefer-capf t)
;; Rustic, LSP

(use-package flycheck
  :ensure t
  )

(use-package rustic
  :ensure t
  )

(use-package lsp-ui
  :ensure t
  )

(use-package helm-lsp
  :ensure t
  :config
  (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol))
