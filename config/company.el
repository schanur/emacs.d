;;; package --- Summary

;;; Commentary:

;;; Code:

(require 'company)

;; (require 'company-qml)
;; (require 'company-racer)


;; (with-eval-after-load 'company
;;   (add-to-list 'company-backends
;;                'company-racer
;;                'company-shell
;;                ))
;; 'company-qml

(add-to-list 'company-backends 'company-tern)

(require 'company-statistics)
(company-statistics-mode)


;;; Web mode
(add-to-list 'company-backends 'company-web-html)
(add-to-list 'company-backends 'company-web-jade)
(add-to-list 'company-backends 'company-web-slim)

;;; or, for example, setup web-mode-hook:

;; (define-key web-mode-map (kbd "C-'") 'company-web-html)
;; (add-hook 'web-mode-hook (lambda ()
;;                            (set (make-local-variable 'company-backends) '(company-web-html company-files))
;;                            (company-mode t)))


;;; Global options.

(add-hook 'after-init-hook 'global-company-mode)

(setq company-idle-delay .1)

(with-eval-after-load 'company
  (company-flx-mode +1))

(require 'company-lsp)
(push 'company-lsp company-backends)
