;;; package --- Summary

;;; Commentary:

;;; Code:


;; in default Emacs, themes can be kind of stacked.
;; Dissable this behavior.
(defadvice load-theme
    (before theme-dont-propagate activate)
  (mapc #'disable-theme custom-enabled-themes))
