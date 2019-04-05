;;; package --- Summary

;;; Commentary:

;;; Code:

(require 'robe)

;; (inf-ruby)
;; (robe-start)



(add-hook 'ruby-mode-hook 'robe-mode)

(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))
