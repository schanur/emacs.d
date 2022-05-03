(use-package company
  :demand t
  :diminish company-mode

  :preface
  (eval-when-compile
    (declare-function global-company-mode nil))

  :init
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2)
  (setq company-require-match nil)
  (setq company-dabbrev-downcase nil)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-flip-when-above t)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-minimum-width 30)

  :bind
  (:map company-active-map
   ("TAB"      . company-complete-common-or-cycle)
   ([tab]      . company-complete-common-or-cycle)
   ("S-TAB"    . company-select-previous-or-abort)
   ([backtab]  . company-select-previous-or-abort)
   ([S-tab]    . company-select-previous-or-abort)
   ("C-p"      . company-select-previous-or-abort)
   ("C-n"      . company-select-next-or-abort)
   ("C-l"      . company-complete-selection))

  :config
  (global-company-mode t)
  ;; (global-company-fuzzy-mode 1)
  )


(use-package company-prescient
  :after (company prescient)

  :preface
  (eval-when-compile
    (declare-function company-prescient-mode nil))

  :config
  (company-prescient-mode t))


(use-package company-c-headers)
(use-package company-irony-c-headers)
(use-package company-irony)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-c-headers))
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony-c-headers))
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))


