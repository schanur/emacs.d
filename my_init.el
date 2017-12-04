;;; package --- Summary

;;; Commentary:

;;; Code:

(message "my_init: start:")

;; Fix
(require 'ert)

(require 'package)

(setq package-archives '(("gnu"       . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents (package-refresh-contents))


(mapc
 (lambda (package)
   (unless (package-installed-p package)
     (package-install package)))
 '(anaconda-mode
   bitbake
   cargo
   company
   company-anaconda
   company-flx
   company-irony
   company-irony-c-headers
   company-racer
   company-shell
   company-statistics
   company-tern
   company-rtags
   diff-hl
   elpy
   emr
   ert
   flx-ido
   flycheck-rust
   flycheck-irony
   hungry-delete
   ido
   irony
   irony-eldoc
   js2-closure
   js2-highlight-vars
   js2-mode
   js2-refactor
   js-comint
   magit
   magit-find-file
   magit-gitflow
   magit-svn
   markdown-mode
   neotree
   nv-delete-back
   origami
   projectile
   projectile
   racer
   rainbow-delimiters
   robe
   ruby-refactor
   rust-mode
   rust-playground
   schrute
   smex
   srefactor
   systemd
   use-package
   web-mode
   web-mode-edit-element
   whitespace
   xcscope
   yasnippet)
 )
;;requires Emacs 25
;;   jade -
;;   company-qml


;; uniquify
;; ivy-rich
;; indent-tools
;; importmagic
;; bln-mode

;; Unstable rust packages
;; lsp-rust
;; ob-rust

;; Install themes
(mapc
 (lambda (package)
   (unless (package-installed-p package)
     (package-install package)))
 '(abyss-theme
   alect-themes
   ample-theme
   atom-dark-theme
   atom-one-dark-theme
   badger-theme
   challenger-deep-theme
   cyberpunk-theme
   exotica-theme
   green-is-the-new-black-theme
   hc-zenburn-theme
   kaolin-themes
   madhat2r-theme
   nyx-theme
   seti-theme
   soothe-theme
   spacemacs-theme
   sunburn-theme
   zenburn-theme
   zerodark-theme)
 )


(add-to-list 'load-path (expand-file-name "~/.emacs.d/manually/irony-mode/elisp/"))

                                        ;(load "~/.emacs.d/init_auto-complete-clang.el")

                                        ;(print 'ac-dictionary-directories)



;; snippet system . always load before hippie expand
;;(require 'yasnippet)
;;(yas-global-mode 1)


;; (require 'auto-complete)
(require 'company)
(require 'yasnippet)
(require 'irony) ;Note: hit `C-c C-b' to open build menu

(add-hook 'c++-mode-hook  'irony-mode)
(add-hook 'c-mode-hook    'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; company-irony mode
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;; (require 'ac-company)
;; (ac-company-define-source ac-source-company-irony company-irony)

;; (irony-enable 'ac)



;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)
;; (require 'auto-complete)

;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
                                        ;(ac-set-trigger-key "TAB")
                                        ;(ac-set-trigger-key "<tab>")

;; dirty fix for having AC everywhere
                                        ;(define-globalized-minor-mode real-global-auto-complete-mode
                                        ;  auto-complete-mode (lambda ()
                                        ;                       (if (not (minibufferp (current-buffer)))
                                        ;                          (auto-complete-mode 1))
                                        ;                      ))

                                        ;(require 'auto-complete-clang)
                                        ;(define-key c++-mode-map (kbd "C-S-<return>") 'ac-complete-clang) ;; replace C-S-<return> with a key binding that you want
                                        ;(define-key c++-mode-map (kbd "TAB") 'ac-complete-clang) ;; replace C-S-<return> with a key binding that you want


                                        ;(real-global-auto-complete-mode t)


;; hippie expand
;;(global-set-key (kbd "M-/") 'hippie-expand)
;; (setq hippie-expand-try-functions-list '(yas/hippie-try-expand
;; try-expand-dabbrev
;; try-expand-dabbrev-all-buffers
;; try-expand-dabbrev-from-kill
;; try-complete-file-name-partially
;; try-complete-file-name
;; try-expand-all-abbrevs
;; try-expand-list try-expand-line
;; try-complete-lisp-symbol-partially
;; try-complete-lisp-symbol))

                                        ;(Add-Hook 'prog-mode-hook 'flycheck-mode)
                                        ;(add-hook 'text-mode-hook 'flycheck-mode)

;;;;;(require 'doc-mode)
;;;;;(add-hook 'c-mode-common-hook doc-mode)

(define-key prog-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
(eval-after-load "emr" '(emr-initialize))


;; Recursively load all config files.
(defun load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
	(write-region (format "%s\n" fullpath) nil "/tmp/emacs_start.log" 'append)
	(load (file-name-sans-extension fullpath)))))))


(setq custom-safe-themes t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1c50040ec3b3480b1fec3a0e912cac1eb011c27dd16d087d61e72054685de345" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-tab ((t (:background "red")))))

;; (load-theme 'hipster)

(load-directory "~/.emacs.d/custom")
(load-directory "~/.emacs.d/config")

;; (when (display-graphic-p)
;;   (load-theme 'hipster t)
;;   )

;;(add-hook 'after-init-hook (lambda () (load-theme 'solarized-light)))
;; (add-hook 'after-init-hook (lambda () (load-theme 'hipster)))

;;'(default ((t (:background nil))))
;;'(whitespace-tab ((t (:background "red")))))

(setq tramp-default-method "ssh")

