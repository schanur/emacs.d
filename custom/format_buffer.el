
(defun format-buffer()
  (interactive)
  (untabify      (point-min) (point-max))
  (indent-region (point-min) (point-max))
  (goto-char     (point-min))
  (whitespace-cleanup)
  )
