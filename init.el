;;; package --- Summary

;;; Commentary:

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/my_init.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1c50040ec3b3480b1fec3a0e912cac1eb011c27dd16d087d61e72054685de345" default)))
 '(package-selected-packages
   (quote
    (jade js-comint js2-mode bln-mode importmagic indent-tools ivy-rich zerodark-theme zenburn-theme yasnippet web-mode-edit-element srefactor spacemacs-theme smex seti-theme schrute ruby-refactor robe rainbow-delimiters neotree magit-svn magit-gitflow magit-find-file irony-eldoc hungry-delete hipster-theme hc-zenburn-theme flycheck-irony flycheck-bashate flx-ido f3 emr darkokai-theme darkane-theme cyberpunk-theme coverlay company-irony-c-headers company-irony badger-theme avy-flycheck atom-one-dark-theme atom-dark-theme ample-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-tab ((t (:background "red")))))
