;; When saving small files, emacs tries to copy files with uuencode
;; and base64 instead of copying wihth an extra scp session. This
;; fails on machines without uuencode/base64 support. We want to use
;; scp always.
(setq tramp-copy-size-limit nil)
