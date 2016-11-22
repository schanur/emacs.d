(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'"  . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'"    . web-mode))

;; Using web-mode for editing plain HTML files can be done this way
(add-to-list 'auto-mode-alist '("\\.html?\\'"     . web-mode))



;; "web-mode-edit-element" is a smart enhancement for the package web-mode inspired by the packages ParEdit and Paxedit.

;; It provides a few helper-functions for attribute- and element-handling based on the functions given by web-mode. Further more it provides functions for slurping, barfing, dissolving, raising ... elements inspired by ParEdit and Paxedit. Last but not least this package includes a minor mode to provide a keymap with default bindings using commands of web-mode and this package.

To use this package, add the following lines somewhere in you init file:
(require 'web-mode-edit-element)
(add-hook 'web-mode-hook 'web-mode-edit-element-minor-mode)

;; See keymap in the main file or online https://github.com/jtkDvlp/web-mode-edit-element
