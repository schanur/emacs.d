;; (defun replace-string-buffer ()
;;   (interactive)
;;   (save-excursion
;;     (goto-char(point-min))
;;     (call-interactively 'replace-string)))

;; (defun replace-string-buffer (search-replace-pair)
;;   ;; "uff"
;;   ;; (interactive)
;;   (save-excursion
;;     (goto-char(point-min))
;;     (replace-match (car search-replace-pair) (cdr search-replace-pair))))

;; (defun upcs ()
(defun replace-string-buffer (search-replace-pair)
  "blah"
  (interactive)
  (goto-char(point-min))
  (while (search-forward (car search-replace-pair) nil t)
    (replace-match (cdr (car search-replace-pair)) t nil)))

           ;; (replace-match "BYTE" "uint8_t"))))
    ;; (replace-match (car search-replace-pair) (cdr search-replace-pair))))

(defun replace-string-list (replace-list)
  ;; (print replace-list))
  ;; (print replace-list))
  (mapc 'replace-string-buffer replace-list))

(defun replace-windows-cpp-types ()
  "example doc-string"
  (interactive)
  (replace-string-list '(
                          ;; '("FLOAT"  "float")
                          ;; '("DOUBLE" "double")
                          ;; '("INT"    "int")
                          ;; '("SHORT"  "int16_t")
                          ;; ("BYTE"   "uint8_t")
                          ("BYTE"   "unsigned char")
                          ;; '("DWORD"  "uint32_t")
                          ;; '("WORD"   "uint16_t")
                           )))


;; (setq test-str-list '(
;;                       '("FLOAT"  "float")
;;                       '("DOUBLE" "double")
;;                       '("INT"    "int")
;;                       ))

;; (beginning-of-buffer)

;; (defun my-replace-string ()
;;   (interactive)
;;   (save-excursion
;;     (beginning-of-buffer)
;;     (call-interactively 'replace-string)))
