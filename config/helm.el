(require 'helm)

(global-set-key (kbd "M-x") 'helm-M-x)


(add-hook 'c-mode-common-hook 'helm-cscope-mode)


(helm-flx-mode +1)
(setq helm-flx-for-helm-find-files t
      helm-flx-for-helm-locate nil)


(require 'helm-fuzzier)
(helm-fuzzier-mode 1)
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)


(require 'helm-fuzzy-find)


(require 'helm-flycheck)
(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))


;; Enable helm-gtags-mode
(add-hook 'c-mode-hook   'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)


(require 'helm-projectile)
(helm-projectile-on)


(require 'helm-config)
(require 'helm-themes)


(setq tramp-default-method "ssh")
(define-key global-map (kbd "C-c s") 'helm-tramp)
;; If you want to speed up tramp uncomment this section.
;; (add-hook 'helm-tramp-pre-command-hook '(lambda () (global-aggressive-indent-mode 0)
;;                                           (projectile-mode 0)
;;                                           (editorconfig-mode 0)))
;; (add-hook 'helm-tramp-quit-hook '(lambda () (global-aggressive-indent-mode 1)
;;                                    (projectile-mode 1)
;;                                    (editorconfig-mode 1)))




(setq helm-buffers-fuzzy-matching t
      helm-imenu-fuzzy-match      t
      helm-recentf-fuzzy-match    t
      helm-locate-fuzzy-match     nil
      helm-M-x-fuzzy-match        t
      helm-semantic-fuzzy-match   t
      helm-projectile-fuzzy-match t)
