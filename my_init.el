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
   company-web
   diff-hl
   dtrt-indent
   eglot ;; required by rustic
   elpy
   emr
   ert
   esup ;; Startup profiler.
   flx-ido
   flycheck-rust
   flycheck-irony
   gitattributes-mode
   gitconfig-mode
   gitignore-mode
   helm
   helm-ag
   helm-cscope
   helm-c-yasnippet
   helm-dash
   helm-dictionary
   helm-flx
   helm-flycheck
   helm-flyspell
   helm-fuzzier
   helm-fuzzy-find
   helm-flycheck
   helm-gtags
   helm-lsp
   helm-projectile
   helm-rg
   helm-rtags
   helm-themes
   helm-tramp
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
   lsp-sh
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
   paradox
   powerthesaurus
   projectile
   projectile-ripgrep
   racer
   rainbow-delimiters
   robe
   ruby-refactor
   rustic
   rust-playground
   schrute
   smex
   srefactor
   ssh-deploy
   systemd
   use-package
   web-mode
   web-mode-edit-element
   which-key
   whitespace
   xcscope
   visual-regexp
   yasnippet
   yasnippet-snippets
   zzz-to-char
   )
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
   arc-dark-theme
   atom-dark-theme
   atom-one-dark-theme
   badger-theme
   brutalist-theme
   challenger-deep-theme
   color-theme-solarized
   constant-theme
   cyberpunk-theme
   cyberpunk-2019-theme
   doom-themes
   exotica-theme
   green-is-the-new-black-theme
   hc-zenburn-theme
   immaterial-theme
   kaolin-themes
   madhat2r-theme
   material-theme
   moe-theme
   monokai-theme
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

