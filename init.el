(require 'package)
(package-initialize)

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

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
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
;			   (auto-complete-mode 1))
;		       ))

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


(hungry-delete-mode)


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
        (load (file-name-sans-extension fullpath)))))))

(load-directory "~/.emacs.d/config")
