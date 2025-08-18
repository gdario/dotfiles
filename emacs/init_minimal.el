(require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq backup-directory-alist '(("." . "~/.saves")))
;; (if window-system (set-frame-font "Menlo 13" nil t))

(use-package emacs
  :custom
  (truncate-lines t)
  (inhibit-startup-message t)
  :config
  (if window-system (set-frame-font "Menlo 13" nil t))
  (windmove-default-keybindings 'super)
  (column-number-mode t)
  (tool-bar-mode -1)
  :hook
  (text-mode . visual-line-mode))

(use-package org-mode
  :defer t
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture))
  
