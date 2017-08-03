;;; package --- Summary

;;; Commentary:

;;; Code:

;; in default Emacs, themes can be kind of stacked.
;; Dissable this behavior.
(defadvice load-theme
    (before theme-dont-propagate activate)
  (mapc #'disable-theme custom-enabled-themes))


;; (setq month-list '(Jan Feb Mar Apr May June July Aug Sept Oct Nov Dec))


;; (defun is-sunny-month(sunny-month-list month)
;;   (member month sunny-month-list)
;;   )

;; (defun current-month-string()
;;   (nth 1
;;        (split-string
;;         (current-time-string)))
;;   )

;; (defun set-color-theme-by-month-string(month match_month_list match_theme other_theme)
;;   (if (is-sunny-month month)
;;       (load-theme match_theme)
;;     (load-theme other_theme)
;;     )
;;   )

;; (defun set-color-theme-by-current-month(match_month_list match_theme other_theme)
;;   (set-color-theme-by-month-string current-month-string()
;;                                    match_month_list
;;                                    match_theme
;;                                    other_theme)
;;   )

;; (setq sunny-month-list    '(Apr May June July Aug Sept Oct))

;; ;; (print sunny-month-list)
;; (is-sunny-month sunny-month-list (current-month-string))
