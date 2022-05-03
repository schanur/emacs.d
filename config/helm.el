(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key   (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; (global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; (setq helm-completion-style 'helm-fuzzy)
;; (setq helm-completion-style '(flex))
;; (setq helm-completion-style 'emacs)
;; (setq completion-styles '(helm-flex))

(setq helm-recentf-fuzzy-match t
      helm-buffers-fuzzy-matching t
      helm-completion-in-region-fuzzy-match t
      helm-mode-fuzzy-match t)
;; (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;;(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-l") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-h a") 'helm-apropos)
(setq helm-apropos-fuzzy-match  t
      helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t
      helm-fd-fuzzy-match       t)

(helm-autoresize-mode t)
(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))
;; (add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)
(helm-mode 1)

(require 'helm-projectile)
(helm-projectile-on)


;; (global-unset-key (kbd "C-c h /"))
;; (use-package helm-fd
;;   :ensure t
;;   ;; :bind (:map helm-command-map
;;   ;;             ("/" . 'helm-fd-fix-path))
;;   )


;; (let ((default-directory (file-name-as-directory dir)))
;;   (helm :sources 'helm-fd-source
;;         :buffer "*helm fd*"
;;         :ff-transformer-show-only-basename nil
;;         :case-fold-search helm-file-name-case-fold-search)
;;   )


;; (setq helm-fd-cmd "fdfind")
;; (defun helm-fd-fix-path ()
;;   (interactive)
;;   (helm-fd-1 "/home/ze/local/dev/all")
;;   )
;; (global-unset-key (kbd "C-c h /"))
;; (global-set-key   (kbd "C-c h /") 'helm-fd-fix-path)

;; (use-package helm-youtube
;;   :ensure t
;;   :bind (:map helm-command-map
;;               ("y" . helm-youtube))
;;   :config
;;   (setq browse-url-browser-function 'browse-url-generic)
;;   (setq browse-url-generic-program "google-chrome-open-url")
;;   )

;; (require 'helm)
;; (require 'helm-config)

;; ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
;; (global-set-key (kbd "C-c h") 'helm-command-prefix)
;; (global-unset-key (kbd "C-x c"))

;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; (when (executable-find "curl")
;;   (setq helm-google-suggest-use-curl-p t))

;; (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
;;       helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
;;       helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
;;       helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
;;       helm-ff-file-name-history-use-recentf t
;;       helm-echo-input-in-header-line t)

;; (defun spacemacs//helm-hide-minibuffer-maybe ()
;;   "Hide minibuffer in Helm session if we use the header line as input field."
;;   (when (with-helm-buffer helm-echo-input-in-header-line)
;;     (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
;;       (overlay-put ov 'window (selected-window))
;;       (overlay-put ov 'face
;;                    (let ((bg-color (face-background 'default nil)))
;;                      `(:background ,bg-color :foreground ,bg-color)))
;;       (setq-local cursor-type nil))))


;; (add-hook 'helm-minibuffer-set-up-hook
;;           'spacemacs//helm-hide-minibuffer-maybe)

;; (setq helm-autoresize-max-height 60)
;; (setq helm-autoresize-min-height 20)
;; (setq-default helm-M-x-fuzzy-match t)
;; (setq-default helm-mode-fuzzy-match t)
;; (setq-default helm-completion-in-region-fuzzy-match t)

;; (helm-autoresize-mode 1)

;; (helm-mode 1)




;; ;; (require 'helm-config)


;; (use-package helm
;;   :demand t
;;   :bind ("M-x" . helm-M-x)
;;   :config
;;   (helm-mode 1)
;;   ;; (setq helm-mode-fuzzy-match t)
;;   ;; (setq helm-completion-in-region-fuzzy-match t)
;;   (setq helm-candidate-number-limit 100)
;;   )

;; (use-package helm-fuzzy
;;   :init
;;   (with-eval-after-load 'helm
;;     (helm-fuzzy-mode 1)))

;; (use-package helm-descbinds
;;   :config
;;   (helm-descbinds-mode)
;;   )

;; ;; (use-package helm-config
;; ;;   :config
;; ;;   (helm-mode-fuzzy-match t)

;; ;;   :bind
;; ;;   (("M-x" . helm-M-x)
;; ;;    ("C-x C-f" . helm-find-files)
;; ;;    :map helm-map
;; ;;    ("C-j" . helm-next-line)
;; ;;    ("C-k" . helm-previous-line)
;; ;;    :map helm-find-files-map
;; ;;    ("C-h" . helm-find-files-up-one-level)
;; ;;    ("C-l" . helm-execute-persistent action))
;; ;; )
