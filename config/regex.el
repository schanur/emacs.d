;;; package --- Summary

;;; Commentary:

;;; Code:


(use-package visual-regexp
  :commands (vr/replace vr/query-replace)
  ;; :straight t

  :init
  (define-key global-map (kbd "C-c r") 'vr/replace)
  (define-key global-map (kbd "C-c q") 'vr/query-replace)
  )


(use-package visual-regexp-steroids
  :after visual-regexp
  ;; :straight t
  )
