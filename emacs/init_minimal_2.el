;; -*- lexical-binding: t; -*-

; To prevent the flood of warnings on the mac
(require 'comp)
(setq native-comp-driver-options
      (cons "-mmacosx-version-min=11" native-comp-driver-options))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq backup-directory-alist '(("." . "~/.saves")))
(if window-system (set-frame-font "Monaco 13" nil t))
(tool-bar-mode -1)
;; Note: (truncate-lines) is a toggle.
(add-hook 'prog-mode-hook #'(lambda() (setq truncate-lines t)))

(with-eval-after-load 'python
  ;; 1. Point Emacs to the correct macOS executable
  (setq python-shell-interpreter "python3")
  ;; 2. Prevent libedit from injecting incompatible terminal characters
  (setq python-shell-interpreter-args "-i")
  ;; 3. Disable native completion which causes hangs on macOS Python 3.9
  (setq python-shell-completion-native-enable nil)
  ;; 4. Silence the warning (the shell usually works perfectly fine anyway)
  (setq python-shell-prompt-detect-failure-warning nil))

(use-package org-mode
  :defer t
  :hook
  (org-mode . visual-line-mode)
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture))
