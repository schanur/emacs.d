;;; package --- Summary

;;; Commentary:

;;; Code:


;; Do not run the garbage collector that often.
;; Both conditions have to be true before a
;; garbage collection is started.
(setq gc-cons-threshold  20000000)
(setq gc-cons-percentage 0.5)
