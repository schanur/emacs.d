;;; package --- Summary

;;; Commentary:

;;; Code:

(require 'bitbake)

(add-to-list 'auto-mode-alist '("\\.bb\\'"       . bitbake-mode))
(add-to-list 'auto-mode-alist '("\\.bbappend\\'" . bitbake-mode))
