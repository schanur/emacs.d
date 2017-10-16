;;; package --- Summary

;;; Commentary:

;;; Code:

;; (require 'company)

;;; TODO: Only load this if emacs version is below 25.2
;; (with-eval-after-load 'python
;;   (defun python-shell-completion-native-try ()
;;     "Return non-nil if can trigger native completion."
;;     (let ((python-shell-completion-native-enable t)
;;           (python-shell-completion-native-output-timeout
;;            python-shell-completion-native-try-output-timeout))
;;       (python-shell-completion-native-get-completions
;;        (get-buffer-process (current-buffer))
;;        nil "_"))))

;; (add-to-list 'company-backends 'company-anaconda)
;; (add-hook 'python-mode-hook 'anaconda-mode)

(elpy-enable)
