(require 'epa-file)
(epa-file-enable)

;; Use passwords instead of GPG keys.
(setq epa-file-select-keys nil)


;; Use unencrypted .authinfo
;; (setq auth-sources '("~/.authinfo"))
