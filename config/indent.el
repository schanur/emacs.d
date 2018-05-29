;;; package --- Summary

;;; Commentary:

;;; Code:


(mapc (lambda (x) (add-to-list 'load-path x))
      (file-expand-wildcards "~/.emacs.d/elpa/dtrt-indent*"))

(require 'dtrt-indent)
(dtrt-indent-mode 1)

