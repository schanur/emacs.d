;;; package --- Summary

;;; Commentary:

;;; Code:


;; ;; Reopen all buffers from last session.
;; (setq desktop-dirname             "~/.emacs.d/"
;;       desktop-base-file-name      "emacs.desktop"
;;       desktop-base-lock-name      "lock"
;;       desktop-path                (list desktop-dirname)
;;       desktop-save                t
;;       desktop-files-not-to-save   "^$" ;reload tramp paths
;;       desktop-load-locked-desktop nil
;;       desktop-restore-eager       1
;;       desktop-auto-save-timeout   30)
;; ;;(desktop-save-mode 1)


;; Replaced by dashboard package.
;; ;; Hide startup screen.
;; (setq inhibit-splash-screen   t)
;; (setq inhibit-startup-screen  t)
;; (setq initial-scratch-message "")


(use-package dashboard
    :ensure t
    :diminish dashboard-mode
    :config
    (setq dashboard-banner-logo-title "schanur")
    ;; (setq dashboard-startup-banner nil)
    (setq dashboard-startup-banner 2)
    ;; (setq dashboard-startup-banner "/path/to/image")
    (setq dashboard-items '((recents   . 15)
                            (projects  . 8)
                            (bookmarks . 3)
                            (agenda    . 3)
                            (registers . 3)
                            ))
    ;; (setq dashboard-set-footer nil)
    (dashboard-setup-startup-hook))


;; Disable menu-bar and tool-bar
;; TODO: What exactly is the tool-bar?
(menu-bar-mode -1)
(tool-bar-mode -1)


;; Disable scroll bars
(scroll-bar-mode -1)


;; Better scrolling behaviour.
(setq redisplay-dont-pause t
      scroll-margin 0
      ;; scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)


;; This snippet makes mouse wheel and trackpad scrolling bearable. Scroll
;; in 1-line increments the buffer under the mouse.
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))


;; (require 'uniquify)
;; (setq uniquify-buffer-name-style 'forward)


(setq ring-bell-function 'ignore)


(if (version<= "26.0.50" emacs-version)
    (progn
      (global-display-line-numbers-mode)
      (set-face-background 'line-number              "#000000")
      (set-face-foreground 'line-number              "#272727")
      (set-face-foreground 'line-number-current-line "#505050")
      )
  (
   (setq linum-format "%4d\u2502    ")
   ;; (setq linum-format "%d  ")

   ;; Activate line numbers in all programming mode. Using
   ;; (global-linum-mode) took too much space in minimap buffer.
   (add-hook 'prog-mode-hook 'linum-mode)
   )
  )


;; Marked region is dark red.
(set-face-attribute 'region nil :background "#411")


;; Highlight the current line.
(global-hl-line-mode)
;; (set-face-background 'highlight-current-line-face "#000000")
(set-face-background 'hl-line "#101010")


;; Show both, column and row.
(setq column-number-mode t)

;; ;; Set fonts
;; ;; (set-face-attribute 'default   nil :font "Ubuntu Mono-17")
;; (set-face-attribute 'default   nil :font "Ubuntu Mono-28")
;; ;; (set-face-attribute 'default   nil :font "Terminus-20")
;; ;; (set-face-attribute 'default   nil :font "Terminus-17")
;; ;; (set-face-attribute 'default   nil :font "Fira Code-16")
;; ;; (set-face-attribute 'default   nil :font "Fira Code-16")
;; ;; (set-face-attribute 'default   nil :font "Fira Code-20")

;; ; Use smaller font on screens smaller than 1280x800.
;; (if (< (display-pixel-height) 800)
;;     (set-face-attribute 'default   nil :font "Ubuntu Mono-27")
;;   (set-face-attribute 'default   nil :font "Ubuntu Mono-17"))

;; ;; Use larger font on screens larger than WUXGA.
;; (if (> (display-pixel-height) 1200)
;;     (set-face-attribute 'default   nil :font "Ubuntu Mono-27")
;;   (set-face-attribute 'default   nil :font "Ubuntu Mono-17"))

;; (set-face-attribute 'default   nil :font "Terminus-14")
;; ;; (set-face-attribute 'default   nil :font "Terminus-20")
;; (set-face-attribute 'default   nil :font "Terminus-24")
;; ;; (set-face-attribute 'default   nil :font "Terminus-Bold-18")

;; ;; (set-face-attribute 'default   nil :font "Fira Code-23")


;; (use-package undo-tree
;;   :diminish undo-tree-mode
;;   :straight t

;;   :preface
;;   (eval-when-compile
;;     (declare-function global-undo-tree-mode nil))

;;   :bind
;;   ("C-." . ))
;;   ;; :init
;;   ;; (with-eval-after-load 'evil-leader
;;   ;;   (evil-leader/set-key
;;   ;;     "uv" 'undo-tree-visualize))

;;   :config
;;   (unless (file-exists-p "~/.emacs.d/undo")
;;     (make-directory "~/.emacs.d/undo"))
;;   (global-undo-tree-mode t))


;; super useful for demos
(use-package keycast
  :ensure t)



;; temporarily highlight changes from yanking, etc
(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode +1))



;; Show search summary in mode lien (for example results found in
;; current buffer).
(use-package anzu
  :ensure t
  :bind (("M-%" . anzu-query-replace)
         ("C-M-%" . anzu-query-replace-regexp))
  :config
  (global-anzu-mode))



;; TODO: Move to other config file.
;; Newline at end of file
(setq require-final-newline t)
