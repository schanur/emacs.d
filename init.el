;; Fix
(require 'ert)


(require 'package)

(setq package-archives '(("gnu"       . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents (package-refresh-contents))


(mapc
 (lambda (package)
   (unless (package-installed-p package)
     (package-install package)))
 '(company
   company-irony
   emr
   ert
   flx-ido
   flycheck-irony
   hungry-delete
   ido
   irony
   irony-eldoc
   neotree
   projectile
   projectile
   rainbow-delimiters
   robe
   ruby-refactor
   smex
   srefactor
   whitespace
   yasnippet)
 )
;; uniquify

;; Install themes
(mapc
 (lambda (package)
   (unless (package-installed-p package)
     (package-install package)))
 '(ample-theme
   atom-dark-theme
   atom-one-dark-theme
   badger-theme
   cyberpunk-theme
   hc-zenburn-theme
   hipster-theme
   seti-theme
   spacemacs-theme
   zenburn-theme
   zerodark-theme)
 )


(add-to-list 'load-path (expand-file-name "~/.emacs.d/manually/irony-mode/elisp/"))

                                        ;(load "~/.emacs.d/init_auto-complete-clang.el")

                                        ;(print 'ac-dictionary-directories)



;; snippet system . always load before hippie expand
;;(require 'yasnippet)
;;(yas-global-mode 1)


;; (require 'auto-complete)
(require 'company)
(require 'yasnippet)
(require 'irony) ;Note: hit `C-c C-b' to open build menu

(add-hook 'c++-mode-hook  'irony-mode)
(add-hook 'c-mode-hook    'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; company-irony mode
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;; (require 'ac-company)
;; (ac-company-define-source ac-source-company-irony company-irony)

;; (irony-enable 'ac)



;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)
;; (require 'auto-complete)

;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
                                        ;(ac-set-trigger-key "TAB")
                                        ;(ac-set-trigger-key "<tab>")

;; dirty fix for having AC everywhere
                                        ;(define-globalized-minor-mode real-global-auto-complete-mode
                                        ;  auto-complete-mode (lambda ()
                                        ;                       (if (not (minibufferp (current-buffer)))
                                        ;                          (auto-complete-mode 1))
                                        ;                      ))

                                        ;(require 'auto-complete-clang)
                                        ;(define-key c++-mode-map (kbd "C-S-<return>") 'ac-complete-clang) ;; replace C-S-<return> with a key binding that you want
                                        ;(define-key c++-mode-map (kbd "TAB") 'ac-complete-clang) ;; replace C-S-<return> with a key binding that you want


                                        ;(real-global-auto-complete-mode t)


;; hippie expand
;;(global-set-key (kbd "M-/") 'hippie-expand)
;; (setq hippie-expand-try-functions-list '(yas/hippie-try-expand
;; try-expand-dabbrev
;; try-expand-dabbrev-all-buffers
;; try-expand-dabbrev-from-kill
;; try-complete-file-name-partially
;; try-complete-file-name
;; try-expand-all-abbrevs
;; try-expand-list try-expand-line
;; try-complete-lisp-symbol-partially
;; try-complete-lisp-symbol))

                                        ;(Add-Hook 'prog-mode-hook 'flycheck-mode)
                                        ;(add-hook 'text-mode-hook 'flycheck-mode)

;;;;;(require 'doc-mode)
;;;;;(add-hook 'c-mode-common-hook doc-mode)

(define-key prog-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
(eval-after-load "emr" '(emr-initialize))


;; Recursively load all config files.
(defun load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))

(load-directory "~/.emacs.d/custom")
(load-directory "~/.emacs.d/config")

;; ------------------------------------------------------------------------
;; ------------------------------ auto generated --------------------------
;; ------------------------------------------------------------------------

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-safe-themes
;;    (quote
;;     ("61b188036ad811b11387fc1ef944441826c19ab6dcee5c67c7664a0bbd67a5b5" "e292ec749f785d348969926448e25790356a7ce1a8fda6e695f5e8b70bed786b" "ad6db94e21962ae96fc834e71b6763dc8cdf9b3798117b70b2bb7b91e628ac34" "1af9aa2eaaaf6cfa7d3b3d0c6d653a9e05b28f11681fbf4efb75812f4a2a310a" "a655f17225ad0a7190c79602593563191b7640ddebbb8c8fbd80c9d82faff1c6" "9228f25531b8da054bb2c9c0d9656b4511103e299df53e200ffad21e08aac533" "b2162e61e5f7b0ef60ae4852037efca37d50d3dcdf1263182178b944d8bfc63a" "e35ef4f72931a774769da2b0c863e11d94e60a9ad97fb9734e8b28c7ee40f49b" "3164a65923ef23e0f3dff9f9607b4da1e07ef1c3888d0f6878feef6c28357732" "ed5af4af1d148dc4e0e79e4215c85e7ed21488d63303ddde27880ea91112b07e" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "219fa8a4c6a53918f31e7fe94634c115c4f0fb08e45cee6a49b341f810ffef85" "c739f435660ca9d9e77312cbb878d5d7fd31e386a7758c982fa54a49ffd47f6e" "d96416845141e99d05d45b5f99ecf46458bf97654be7d2e20184c5edcda1580a" "7dd515d883520286fc8936ce32381fb01b978d0d7cfb6fe56f7f55d8accbf63a" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "56cb99174fad69feba8edd6663c592e77d77332fb4c4bb5be058ef459a426463" "e4bc8563d7651b2fed20402fe37b7ab7cb72869f92a3e705907aaecc706117b5" "96b023d1a6e796bab61b472f4379656bcac67b3af4e565d9fb1b6b7989356610" "3d003561784526d83d1dd187aecf4799c72af27046bc3aa2f6d95c64e5ee4746" "a507b9ca4a605d5256716da70961741b9ef9ec3246041a4eb776102e8df18418" "97a2b10275e3e5c67f46ddaac0ec7969aeb35068c03ec4157cf4887c401e74b1" "456ac8176c7c01680384356cbdc568a7683d1bada9c83ae3d7294809ddda4014" "c4e6fe8f5728a5d5fd0e92538f68c3b4e8b218bcfb5e07d8afff8731cc5f3df0" "2a12e95e9ee6ed57592e7df12f3f028205575e9b3affdb5e6fa589421c618136" "37e30d51d5ad32443dce5c6df7bdaabf87968989c231b3a475b7d6e473dfeae0" "764e3a6472a3a4821d929cdbd786e759fab6ef6c2081884fca45f1e1e3077d1d" "1cd9defef2a98138c732728568b04043afd321eb802d25a254777de9b2463768" "1a85b8ade3d7cf76897b338ff3b20409cb5a5fbed4e45c6f38c98eee7b025ad4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "573e46dadf8c2623256a164831cfe9e42d5c700baed1f8ecd1de0675072e23c2" "fc2782b33667eb932e4ffe9dac475f898bf7c656f8ba60e2276704fabb7fa63b" "024b0033a950d6a40bbbf2b1604075e6c457d40de0b52debe3ae994f88c09a4a" "c3e567dedaa800e869d879c4df8478237d6ea31fd04464086fd674c864fe4d71" "18e89f93cbaaac214202142d910582354d36639f21f32b04718ca6425dbc82a2" "cd540cb356cb169fa1493791bd4cbb183c5ad1c672b8d1be7b23e5e8c8178991" default))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:background nil)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("c93fabc360a4b2adb84cc7ab70a717a990777452ab0328b23812c779ff274154" "0f98f9c2f1241c3b6227af48dc96e708ec023dd68363edb5d36dc7beaad64c23" "94ba29363bfb7e06105f68d72b268f85981f7fba2ddef89331660033101eb5e5" "9b402e9e8f62024b2e7f516465b63a4927028a7055392290600b776e4a5b9905" "705f3f6154b4e8fac069849507fd8b660ece013b64a0a31846624ca18d6cf5e1" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "ad950f1b1bf65682e390f3547d479fd35d8c66cafa2b8aa28179d78122faa947" "87a7e23d0a43222336abde73c34deebe144ff4ddf78e1e4222008a809448b8c5" "e15e15c389b9a2f813bb3b8034f0777bbfb1f80b2349c5c98a84b9d807275fac" "1c50040ec3b3480b1fec3a0e912cac1eb011c27dd16d087d61e72054685de345" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "4c9ba94db23a0a3dea88ee80f41d9478c151b07cb6640b33bfc38be7c2415cc4" "f3d6a49e3f4491373028eda655231ec371d79d6d2a628f08d5aa38739340540b" "4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "7beac4a68f03662b083c9c2d4f1d7f8e4be2b3d4b0d904350a9edf3cf7ce3d7f" "beeb5ac6b65fcccfe434071d4624ff0308b5968bf2f0c01b567d212bcaf66054" "6998bd3671091820a6930b52aab30b776faea41449b4246fdce14079b3e7d125" "c987721d93f0858a2eec882e58c5c45b67d6492bfadae3e00c115ba2616b7fe0" "561ba4316ba42fe75bc07a907647caa55fc883749ee4f8f280a29516525fc9e8" "c86f868347919095aa44d2a6129dd714cbcf8feaa88ba954f636295b14ceff8f" "8fed5e4b89cf69107d524c4b91b4a4c35bcf1b3563d5f306608f0c48f580fdf8" "83e584d74b0faea99a414a06dae12f11cd3176fdd4eba6674422539951bcfaa8" "7abf5a28ec511e7e8f5fe10978b3d63058bbd280ed2b8d513f9dd8b7f5fc9400" "ba6f8606cae826654d4c2242363f2042dd35c1595ef6367ad44d5f42851e6aa9" "90d329edc17c6f4e43dbc67709067ccd6c0a3caa355f305de2041755986548f2" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "ed5af4af1d148dc4e0e79e4215c85e7ed21488d63303ddde27880ea91112b07e" "fc01bb8da59411baec19563336db6afc0cd872931388a363aa2effee4a426e35" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "90edd91338ebfdfcd52ecd4025f1c7f731aced4c9c49ed28cfbebb3a3654840b" "cdd26fa6a8c6706c9009db659d2dffd7f4b0350f9cc94e5df657fa295fffec71" default)))
 '(fci-rule-color "#383838")
 '(highlight-changes-colors (quote ("#ff8eff" "#ab7eff")))
 '(highlight-tail-colors
   (quote
    (("#424748" . 0)
     ("#63de5d" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#424748" . 100))))
 '(linum-format " %5i ")
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(pos-tip-background-color "#E6DB74")
 '(pos-tip-foreground-color "#242728")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#d01A4E")
     (60 . "#cb4b16")
     (80 . "#b58900")
     (100 . "#b58900")
     (120 . "#b58900")
     (140 . "#7E7D7E")
     (160 . "#7E7D7E")
     (180 . "#9FAA9B")
     (200 . "#9FC59F")
     (220 . "#859900")
     (240 . "#31be67")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#268bd2")
     (320 . "#268bd2")
     (340 . "#00a74e")
     (360 . "#d33682"))))
 '(vc-annotate-very-old-color "#d33682")
 '(weechat-color-list
   (unspecified "#242728" "#424748" "#F70057" "#ff0066" "#86C30D" "#63de5d" "#BEB244" "#E6DB74" "#40CAE4" "#06d8ff" "#FF61FF" "#ff8eff" "#00b2ac" "#53f2dc" "#f8fbfc" "#ffffff"))
 '(when
      (or
       (not
        (boundp
         (quote ansi-term-color-vector)))
       (not
        (facep
         (aref ansi-term-color-vector 0))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(whitespace-tab ((t (:background "red")))))

(setq tramp-default-method "ssh")
