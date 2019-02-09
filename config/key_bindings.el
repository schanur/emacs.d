;;; package --- Summary

;;; Commentary:

;;; Code:

(global-set-key (kbd "<f2>")  'origami-open-all-nodes)
(global-set-key (kbd "<f3>")  'origami-close-all-nodes)
;; (global-set-key (kbd "<f4>")  'origami-toggle-node)
;; (global-set-key (kbd "<f4>")  'origami-forward-toggle-node)
(global-set-key (kbd "<f4>")  'origami-open-node-recursively)



(global-set-key (kbd "<f6>")  'toggle-menu-bar-mode-from-frame)
(global-set-key (kbd "<f7>")  'neotree-toggle)
(global-set-key (kbd "<f8>")  'global-linum-mode)

(add-hook
 'neotree-mode-hook
 (lambda ()
   (define-key neotree-mode-map (kbd "RET") 'neotree-enter-hide)))

(global-set-key (kbd "<f9>")  'flycheck-next-error)
(global-set-key (kbd "<f10>") 'format-buffer)

(global-set-key (kbd "<f12>") 'eval-buffer)


;; origami-open-node   Open a fold node.
;; origami-open-node-recursively       Open a fold node and all of its children.
;; origami-show-node   Like origami-open-node but also opens parent fold nodes recursively so as to ensure the position where point is is visible.
;; origami-close-node  Close a fold node.
;; origami-close-node-recursively      Close a fold node and all of its children.
;; origami-toggle-node Toggle open or closed a fold node.
;; origami-forward-toggle-node Search forward on this line for a node and toggle it open or closed. This makes toggling nodes much more convenient.
;; origami-recursively-toggle-node     Acts like org-mode header collapsing. Cycle a fold between open, recursively open, closed.
;; origami-open-all-nodes      Open every fold in the buffer.
;; origami-close-all-nodes     Close every fold in the buffer.
;; origami-toggle-all-nodes    Toggle open/closed every fold node in the buffer.
;; origami-show-only-node      Close everything but the folds necessary to see the point. Very useful for concentrating on an area of code.
;; origami-previous-fold       Move to the previous fold.
;; origami-next-fold   Move to the end of the next fold.
;; origami-forward-fold        Move to the start of the next fold.
;; origami-forward-fold-same-level     Move to the start of the next fold that is a sibling of the current fold.
;; origami-backward-fold-same-level    Move to the start of the previous fold that is a sibling of the current fold.
;; origami-undo        Undo the last folding operation.
;; origami-redo        Redo the last undone folding operation.
;; origami-reset       Remove all folds from the buffer and reset all origami state. Useful if origami messes up!

(global-set-key (kbd "C-c C-f n") 'origami-toggle-node)       ;; n for node
(global-set-key (kbd "C-c C-f a") 'origami-toggle-all-nodes)  ;; a for all
(global-set-key (kbd "C-c C-f f") 'origami-show-only-node)    ;; f for focus


;; (bind-key "C-<backspace>" 'nv-delete-back-all)
;; (bind-key "M-<backspace>" 'nv-delet-back)
(require 'nv-delete-back)
(global-set-key (kbd "C-<backspace>") 'nv-delete-back-all)
(global-set-key (kbd "M-<backspace>") 'nv-delete-back)


;; Natural language support.
(global-set-key (kbd "M-n p") 'powerthesaurus-lookup-word-at-point)


(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))


(add-hook 'helm-cscope-mode-hook
          (lambda ()
            (local-set-key (kbd "M-.") 'helm-cscope-find-global-definition)
            (local-set-key (kbd "M-@") 'helm-cscope-find-calling-this-function)
            (local-set-key (kbd "M-s") 'helm-cscope-find-this-symbol)
            (local-set-key (kbd "M-,") 'helm-cscope-pop-mark)))
