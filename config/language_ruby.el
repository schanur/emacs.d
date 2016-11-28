;;; package --- Summary

;;; Commentary:

;;; Code:

(require 'robe)

(inf-ruby)
(robe-start)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
    (rvm-activate-corresponding-ruby))
