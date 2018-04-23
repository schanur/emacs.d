;;; package --- Summary

;;; Commentary:

;;; Code:

;; (set-face-foreground 'mode-line "black")
;; (set-face-background 'mode-line "purple")
;; (set-face-background 'mode-line-inactive "blue")
;; (set-face-background 'modeline-inactive "red")

;; (setq custom-enabled-themes "badger")
;; (setq custom-safe-themes    "badger")
;; (custom-safe-themes         'badger-theme)


;; We use a high contrast theme in the summer and a low contrast theme in the winter

;; (setq sunny-month-list    '(Apr May June July Aug Sept Oct))
;; (setq high-contrast-theme 'badger)
;; (setq low-contrast-theme  'zenburn)

(add-hook 'after-init-hook (lambda () (load-theme 'badger)))
;; (load-theme 'badger)

;; (set-color-theme-by-current-month(sunny-month-list high-contrast-theme low-contrast-theme)

;; (custom-set-faces
 ;; '(neo-dir-link-face ((t (:foreground "yellow"))))
 ;; '(neo-dir-link-face ((t (:foreground "color-64"))))
 ;; '(neo-file-link-face ((t (:foreground "color-244")))))


;; Make flycheck a bit more alarming by using different background
;; colors instead of different font colors.
;; flycheck-error
;; flycheck-error-list-checker-name
;; flycheck-error-list-column-number
;; flycheck-error-list-error
;; flycheck-error-list-highlight
;; flycheck-error-list-id
;; flycheck-error-list-id-with-explainer
;; flycheck-error-list-info
;; flycheck-error-list-line-number
;; flycheck-error-list-warning
;; flycheck-fringe-error
;; flycheck-fringe-info
;; flycheck-fringe-warning
;; flycheck-info
;; flycheck-warning
