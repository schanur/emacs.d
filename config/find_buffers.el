;; (use-package recentf
;;   :ensure t
;;   :config
;;   (setq recentf-save-file (expand-file-name "recentf" bozhidar-savefile-dir)
;;         recentf-max-saved-items 500
;;         recentf-max-menu-items 15
;;         ;; disable recentf-cleanup on Emacs start, because it can cause
;;         ;; problems with remote files
;;         recentf-auto-cleanup 'never)
;;   (recentf-mode +1))
