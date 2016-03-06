(global-set-key (kbd "<f7>") 'neotree-toggle)

(add-hook
 'neotree-mode-hook
 (lambda ()
   (define-key neotree-mode-map (kbd "RET") 'neotree-enter-hide)))
