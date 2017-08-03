;;; package --- Summary

;;; Commentary:

;;; Code:

;; Emacs's default scrolling behavior, like a lot of the default
;; Emacs experience, is pretty idiosyncratic. The following snippet
;; makes for a smoother scrolling behavior when using keyboard navigation.
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; This snippet makes mouse wheel and trackpad scrolling bearable. Scroll
;; in 1-line increments the buffer under the mouse.
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; Buffer names
;; Setup uniquify so that non-unique buffer names get the parent path
;; included to make them unique.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq ring-bell-function 'ignore)

(setq linum-format "%4d\u2502")

(global-linum-mode)
(setq column-number-mode t)

;; highlight the other bracket
(show-paren-mode)    ; emacs builtin

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode) ; activate rainbow mode for all programming modes

; a lot of ui auto completion
; where do i get the fuzzy matching ???
(require 'ido)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
;; Old ido setup. FIXME: remove
;; (ido-mode 1)
;; (ido-everywhere 1)
;; (setq ido-use-faces nil)

;;(setq ido-enable-flex-matching t)

;; ido like mode for M-x
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; original M-x command
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Recursive minibuffer
(setq enable-recursive-minibuffers t)
(minibuffer-depth-indicate-mode 1)

;; neotree
(setq neo-window-width 32)
(neotree-toggle)
