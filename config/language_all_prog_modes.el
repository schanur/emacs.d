;;; package --- Summary

;;; Commentary:

;;; Code:


;; Enable comment line wrap in all programming major modes.  (add-hook
;; 'prog-mode-hook 'refill-mode)

(global-flycheck-mode)

(hungry-delete-mode)

;; Text folding.
(require 'origami)
(global-origami-mode)

;; What to hightlight in Flycheck.


