(use-package company-web
  :ensure t
)
(use-package ac-html-bootstrap
  :ensure t
)

(use-package rainbow-mode
  :ensure t
  :diminish "🌈" ;; Rainbow emoji
  :hook (scss-mode less-mode css-mode))

(use-package web-mode
  :ensure t
  :diminish "🌎"
  :mode
  (("\\.phtml\\'"    . web-mode)
  ("\\.tpl\\.php\\'" . web-mode)
  ("\\.jsp\\'"       . web-mode)
  ("\\.as[cp]x\\'"   . web-mode)
  ("\\.erb\\'"       . web-mode)
  ("\\.mustache\\'"  . web-mode)
  ("\\.djhtml\\'"    . web-mode)
  ("\\.jst.ejs\\'"   . web-mode)
  ("\\.html?\\'"     . web-mode)
  ("\\.hbs\\'"       . web-mode)

  )
  :init
  (setq web-mode-enable-block-face t)
  (setq web-mode-enable-comment-keywords t)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t)
  (setq web-mode-script-padding 2)
  (setq web-mode-style-padding 2)
  (setq web-mode-comment-style 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-markup-indent-offset 2))

(setq css-indent-level 2)
(setq css-indent-offset 2)

(use-package less-css-mode
  :ensure t
)


(use-package scss-mode
  :ensure t
  :init
  (setq scss-compile-at-save nil))


;; (emagician/defhook run-prog-mode-hooks css-mode-hook
;;   "Runs the progmode hooks"
;;   (run-hooks 'prog-mode-hook))

;; (add-hook 'scss-mode-hook 'run-prog-mode-hooks)


(use-package apache-mode
    :ensure t
)


(use-package company-restclient
  :ensure t
)

(use-package restclient
  :ensure t
  :init
  (use-package company-restclient)
  )
