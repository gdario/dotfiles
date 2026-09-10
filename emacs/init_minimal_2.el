;; -*- lexical-binding: t; -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (setq backup-directory-alist '(("." . "~/.saves")))
(if window-system (set-frame-font "Monaco 13" nil t))
(tool-bar-mode -1)
;; Note: (truncate-lines) is a toggle.
(add-hook 'prog-mode-hook #'(lambda() (setq truncate-lines t)))

(use-package org-mode
  :defer t
  :hook
  (org-mode . visual-line-mode)
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture))
