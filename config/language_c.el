;;; package --- Summary

;;; Commentary:

;;; Code:

(require 'company)

;; (add-to-list 'company-backends 'company-c_headers)

;; Load with `irony-mode` as a grouped backend
;; (require 'company-irony-c-headers)

(add-hook 'c++-mode-hook  'irony-mode)
(add-hook 'c-mode-hook    'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(eval-after-load 'company
'(add-to-list
'company-backends '(company-irony-c-headers company-irony)))

(eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; Use compile_commands.json database.
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;; When compiler options change, call
;; `company-irony-c-headers-reload-compiler-output` manually to
;; reload.

(require 'xcscope)
