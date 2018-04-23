

(require 'rust-mode)

;; (setenv "RUST_SRC_PATH" ${HOME}/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src)

;; ********************************************************************
;; * Rust by lsp-rust                                                 *
;; ********************************************************************

(with-eval-after-load 'lsp-mode
  (require 'lsp-rust)
  (add-hook 'rust-mode-hook #'lsp-rust-enable))

(add-hook 'rust-mode-hook #'lsp-rust-enable)
(add-hook 'rust-mode-hook #'flycheck-mode)

;; ********************************************************************
;; * Racer                                                            *
;; ********************************************************************

;; (require 'rust-mode)

;; (setq racer-rust-src-path (substitute-in-file-name "$HOME/.cargo/bin"))

;; (add-hook 'rust-mode-hook #'racer-mode)
;; (add-hook 'racer-mode-hook #'eldoc-mode)

;; ;; Use company for racer completion.
;; (add-hook 'racer-mode-hook #'company-mode)
;; (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
;; (setq company-tooltip-align-annotations t)
