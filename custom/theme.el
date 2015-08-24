
;; in default Emacs, themes can be kind of stacked.
;; Dissable this behavior.
(defadvice load-theme
    (before theme-dont-propagate activate)
  (mapcar #'disable-theme custom-enabled-themes))
