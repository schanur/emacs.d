(require 'company)

;; (add-to-list 'company-backends 'company-c_headers)

;; Load with `irony-mode` as a grouped backend
;; (require 'company-irony-c-headers)

(eval-after-load 'company
'(add-to-list
'company-backends '(company-irony-c-headers company-irony)))

;; When compiler options change, call
;; `company-irony-c-headers-reload-compiler-output` manually to
;; reload.
