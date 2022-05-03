(use-package projectile
  :ensure t
  :custom (projectile-indexing-method 'alien)
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map))
)
