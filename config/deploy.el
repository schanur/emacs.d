;;; package --- Summary

;;; Commentary:

;;; Code:



;; (require 'ssh-deploy)

;; (add-hook 'after-save-hook (lambda() (if (and (boundp 'ssh-deploy-on-explicit-save)                    ssh-deploy-on-explicit-save) (ssh-deploy-upload-handler)) ))
;; (add-hook 'find-file-hook  (lambda() (if (and (boundp 'ssh-deploy-automatically-detect-remote-changes) ssh-deploy-automatically-detect-remote-changes) (ssh-deploy-remote-changes-handler)) ))
;; (global-set-key (kbd "C-c C-z f") (lambda() (interactive)(ssh-deploy-upload-handler-forced) ))
;; (global-set-key (kbd "C-c C-z u") (lambda() (interactive)(ssh-deploy-upload-handler) ))
;; (global-set-key (kbd "C-c C-z D") (lambda() (interactive)(ssh-deploy-delete-handler) ))
;; (global-set-key (kbd "C-c C-z d") (lambda() (interactive)(ssh-deploy-download-handler) ))
;; (global-set-key (kbd "C-c C-z x") (lambda() (interactive)(ssh-deploy-diff-handler) ))
;; (global-set-key (kbd "C-c C-z t") (lambda() (interactive)(ssh-deploy-remote-terminal-eshell-base-handler) ))
;; (global-set-key (kbd "C-c C-z T") (lambda() (interactive)(ssh-deploy-remote-terminal-eshell-handler) ))
;; (global-set-key (kbd "C-c C-z h") (lambda() (interactive)(ssh-deploy-remote-terminal-shell-base-handler) ))
;; (global-set-key (kbd "C-c C-z H") (lambda() (interactive)(ssh-deploy-remote-terminal-shell-handler) ))
;; (global-set-key (kbd "C-c C-z R") (lambda() (interactive)(ssh-deploy-rename-handler) ))
;; (global-set-key (kbd "C-c C-z e") (lambda() (interactive)(ssh-deploy-remote-changes-handler) ))
;; (global-set-key (kbd "C-c C-z b") (lambda() (interactive)(ssh-deploy-browse-remote-base-handler) ))
;; (global-set-key (kbd "C-c C-z o") (lambda() (interactive)(ssh-deploy-open-remote-file-handler) ))
;; (global-set-key (kbd "C-c C-z m") (lambda() (interactive)(ssh-deploy-remote-sql-mysql-handler) ))
