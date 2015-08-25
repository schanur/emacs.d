;; (require 'ruby-refactor)
;; (require 'emr)

;; TODO: Check if key is already in use.
;; (define-key prog-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
;; (add-hook 'prog-mode-hook 'emr-initialize)

;; Semantic refactor for C/C++
(require 'srefactor)
;; (require 'srefactor-lisp)

;; C/C++ parsing
(semantic-mode 1) ;; -> this is optional for Lisp

(define-key c-mode-map   (kbd "M-RET")   'srefactor-refactor-at-point)
(define-key c++-mode-map (kbd "M-RET")   'srefactor-refactor-at-point)
(global-set-key          (kbd "M-RET o") 'srefactor-lisp-one-line)
(global-set-key          (kbd "M-RET m") 'srefactor-lisp-format-sexp)
(global-set-key          (kbd "M-RET d") 'srefactor-lisp-format-defun)
(global-set-key          (kbd "M-RET b") 'srefactor-lisp-format-buffer)


;; Elisp refactor
;; (require 'erefactor)
