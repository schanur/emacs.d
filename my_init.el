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
   company-lsp
   company-php
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
   gitattributes-mode
   gitconfig-mode
   gitignore-mode
   hungry-delete
   ido
   irony
   irony-eldoc
   js2-closure
   js2-highlight-vars
   js2-mode
   js2-refactor
   js-comint
   lsp-rust
   lsp-ui
   lsp-vue
   magit
   magit-find-file
   magit-gitflow
   magit-svn
   markdown-mode
   meson-mode
   neotree
   nv-delete-back
   origami
   php-mode
   php-refactor-mode
   projectile
   powerthesaurus
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

;; smart-backspace
;; smart-semicolon

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


(custom-set-variables
 '(custom-safe-themes (quote ("9527feeeec43970b1d725bdc04e97eb2b03b15be982ac50089ad223d3c6f2920" default))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-tab ((t (:background "red")))))

(load-directory "~/.emacs.d/custom")
(load-directory "~/.emacs.d/config")


(setq tramp-default-method "ssh")

