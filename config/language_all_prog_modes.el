;;; package --- Summary

;;; Commentary:

;;; Code:


(setq-default tab-width 4)


(use-package abbrev
  :config
  (setq save-abbrevs 'silently)
  (setq-default abbrev-mode t))


(use-package flycheck
  :ensure t
  :diminish flycheck-mode

  :preface
  (eval-when-compile
    (declare-function global-flycheck-mode nil))

  :init
  ;; (add-hook 'markdown-mode-hook 'flycheck-mode)
  ;; (add-hook 'text-mode-hook 'flycheck-mode)
  (add-hook 'rust-mode-hook 'flycheck-mode)
  (add-hook 'text-mode-hook 'flycheck-mode)

  :config
  (global-flycheck-mode t))



(use-package origami
  :diminish origami-mode

  :preface
  (eval-when-compile
    (declare-function global-origami-mode nil))

  :config
  (global-origami-mode t)
  (global-set-key (kbd "C-x C-z") 'origami-mode-map)
  ;; :bind
  ;; (
  ;; ("C-TxAB" . origami-toggle-node)
  ;; ("M-TAB" . origami-toggle-all-nodes)
  ;; )

 ;;  :bind (:map origami-mode-map
 ;;  (
 ;;  ("C-TAB" . origami-toggle-node)
 ;;  ("M-TAB" . origami-toggle-all-nodes)))
  )


(use-package rainbow-delimiters
  :commands rainbow-delimiters-mode

  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))


(require 'lsp-mode)
