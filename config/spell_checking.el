;;; package --- Summary

;;; Commentary:

;;; Code:

(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(add-hook 'org-mode-hook 'turn-on-flyspell)

(use-package flyspell
  :config
  (when (eq system-type 'windows-nt)
    (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/"))
  (setq ispell-program-name "aspell" ; use aspell instead of ispell
        ispell-extra-args '("--sug-mode=ultra"))
  (add-hook 'text-mode-hook #'flyspell-mode)
  (add-hook 'prog-mode-hook #'flyspell-prog-mode))
