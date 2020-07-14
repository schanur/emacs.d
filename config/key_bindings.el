(global-set-key (kbd "M-x")                          'undefined) ;; Why do we undefine first?
(global-set-key (kbd "M-x")                          'helm-M-x)

(global-set-key (kbd "C-<backspace>")                'undefined)
(use-package nv-delete-back
 :ensure t
 :bind
 ;; Suggested bindings
 (
  ;; ("C-<backspace>" . nv-delete-back-all) ;; Does not work. Help screen gets opened instead.
  ("M-<backspace>" . nv-delete-back))
 )


(global-set-key (kbd "<f6>")  'toggle-menu-bar-mode-from-frame)
