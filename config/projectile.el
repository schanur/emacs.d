;;; package --- Summary

;;; Commentary:

;;; Code:


;;; Projectile support is currently disabled duo to performance regression.
;;;
(require 'projectile)
(projectile-global-mode)
(setq projectile-keymap-prefix (kbd "C-c C-p"))
