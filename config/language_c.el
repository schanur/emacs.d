(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


(add-hook 'c-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '(company-irony)
                 ;; '(company-irony-c-headers)
                 ;; '(company-c-headers)
                 ;; '(company-dabbrev)
                 )))

;; (add-hook 'c-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'company-backends)
;;                  '(company-irony)
;;                  '(company-irony-c-headers)
;;                  '(company-c-headers)
;;                  '(company-dabbrev)
;;                  )))
