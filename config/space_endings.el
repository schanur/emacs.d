;;; package --- Summary

;;; Commentary:

;;; Code:

;; Delete trailing spaces on file save operation.
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Highlight tabs and trailing whitespace everywhere.
(setq whitespace-style '(face trailing tabs))
(custom-set-faces
 '(whitespace-tab ((t (:background "red")))))
(global-whitespace-mode)

(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)

