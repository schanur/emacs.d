;;; package --- Summary

;;; Commentary:

;;; Code:

;; (message "my_init: start:")

;; Hack to make gnu elpa work with emacs lower to 26.3.
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Fix
;;(require 'ert)

;;(require 'package)

;; (if (version<= "26.0.50" emacs-version)
;;     (
;;      )
;;   (
;;    (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;;    )
;;   )


(setq package-archives '(("gnu"       . "https://elpa.gnu.org/packages/")
                         ;; ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")))

;; (when (version< emacs-version "27.0.0")
;;   (package-initialize))

;; (package-initialize)

(unless package-archive-contents (package-refresh-contents))


(mapc
 (lambda (package)
   (unless (package-installed-p package)
     (package-install package)))
 '(ag
   anaconda-mode
   auto-compile
   bitbake
   cargo
   cargo-mode
   company
   company-anaconda
   company-c-headers
   company-flx
   company-fuzzy
   company-irony
   company-irony-c-headers
   ;; company-lsp
   ;; company-php
   ;; company-shell
   company-statistics
   ;; company-tern
   ;; company-rtags
   ;; company-web
   diff-hl
   dtrt-indent
   dumb-jump
   eglot ;; required by rustic
   elpy
   emr
   ;; ert
   esup ;; Startup profiler.
   flx-ido
   flycheck-rust
   flycheck-irony
   ;; gitattributes-mode
   ;; gitconfig-mode
   ;; gitignore-mode
   helm
   helm-ag
   helm-cscope
   helm-c-yasnippet
   helm-dash
   helm-descbinds
   helm-dictionary
   helm-flx
   helm-flycheck
   helm-flyspell
   helm-fuz
   helm-fuzzy
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
   highlight-parentheses
   hungry-delete
   ;; ido
   irony
   irony-eldoc
   js2-closure
   js2-highlight-vars
   js2-mode
   js2-refactor
   js-comint
   lsp-mode
   ;; lsp-rust
   ;; lsp-sh
   lsp-treemacs
   lsp-ui
   ;; lsp-vue
   magit
   magit-find-file
   magit-gitflow
   magit-svn
   markdown-mode
   meson-mode
   neotree
   nv-delete-back
   opencl-mode
   origami
   php-mode
   php-refactor-mode
   paradox
   powerthesaurus
   projectile
   projectile-ripgrep
   rainbow-delimiters
   realgud
   realgud-lldb
   robe
   ruby-refactor
   rustic
   rust-playground
   schrute
   smex
   srefactor
   ssh-deploy
   systemd
   treemacs
   treemacs-projectile
   undo-tree
   use-package
   web-mode
   web-mode-edit-element
   which-key
   ;; whitespace
   ;; xah-lookup
   xcscope
   visual-regexp
   ;; yasnippet
   ;; yasnippet-snippets
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
   ;; arc-dark-theme
   atom-dark-theme
   atom-one-dark-theme
   badger-theme
   brutalist-theme
   challenger-deep-theme
   chocolate-theme
   colorless-themes
;;   color-theme-solarized
   constant-theme
   cyberpunk-theme
   cyberpunk-2019-theme
   doom-themes
   exotica-theme
   green-is-the-new-black-theme
   hc-zenburn-theme
   horizon-theme
   humanoid-themes
   immaterial-theme
   ;; kaolin-themes
   madhat2r-theme
   material-theme
   moe-theme
   mood-one-theme
   monokai-pro-theme
   monokai-theme
   naysayer-theme
   nyx-theme
   seti-theme
   soothe-theme
   spacemacs-theme
   sunburn-theme
   ;; timu-spacegrey-theme
   vscdark-theme
   zenburn-theme
   zerodark-theme)
 )


;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/manually/irony-mode/elisp/"))


;; (define-key prog-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
;; (eval-after-load "emr" '(emr-initialize))


;; (defvar log-file-path "/dev/shm/emacs")
;; (defvar log-file      (concat log-file-path "emacs_start.log"))

;; ;; Create directory for log file in RAM.
;; (unless (file-directory-p log-file-path)
;;   (make-directory log-file-path))

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
        ;; (write-region (format "%s\n" fullpath) nil log-file 'append)
        (load (file-name-sans-extension fullpath)))))))


;; (custom-set-variables
;;  '(custom-safe-themes (quote ("9527feeeec43970b1d725bdc04e97eb2b03b15be982ac50089ad223d3c6f2920" default))))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(whitespace-tab ((t (:background "red")))))

(setq gc-cons-threshold  200000000)
(setq gc-cons-percentage 0.5)

(load-directory "~/.emacs.d/custom")
(load-directory "~/.emacs.d/config")


;; Replaced by dashboard package.
;; Show how long it took to load all Emacs config files.
;; (add-hook 'emacs-startup-hook
;; 	  (lambda ()
;; 	    (with-current-buffer "*scratch*"
;; 	      (
;; 	       insert
;; 	       "\nEmacs init time: "
;; 	       (emacs-init-time)
;; 	       "\n"
;; 	       ))))


;; (setq tramp-default-method "ssh")

;; (write-region (format "my_init.el load finished\n") nil log-file 'append)
