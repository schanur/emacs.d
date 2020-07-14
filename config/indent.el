;; C
(setq-default c-basic-offset 4
              c-indent-level 4
              indent-tabs-mode nil) ;; Do not use TABs.


;; Use heuristics to detect indentation of file.
(use-package dtrt-indent
  :ensure t
  :diminish dtrt-indent-mode
  ;; :straight t

  :init
  (add-hook 'conf-mode-hook 'dtrt-indent-mode)
  (add-hook 'text-mode-hook 'dtrt-indent-mode)
  (add-hook 'prog-mode-hook 'dtrt-indent-mode))

