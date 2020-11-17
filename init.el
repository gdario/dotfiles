;;; init.el --- shamelessly stolen from Bozhidar's Emacs configuration

;;; Commentary:
;; This configuration is based (copied, actually) from the one below.
;; https://github.com/bbatsov/emacs.d/blob/master/init.el

;;; Code:

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; keep the installed packages in .emacs.d
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))

(package-initialize)

;; update the package metadata is the local cache is missing
(unless package-archive-contents
  (package-refresh-contents))

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; disable startup screen
(setq inhibit-startup-screen t)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; Newline at end of file
(setq require-final-newline t)

;; store all backup and autosave files in the .saves dir
(setq backup-directory-alist `(("." . "~/.saves")))

;; Set default font
(set-frame-font "Monaco-13" nil t)

;; Set default encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)

;;; built-in packages

(use-package paren
  :config
  (show-paren-mode +1))

(use-package abbrev
  :config
  (setq save-abbrevs 'silently)
  (setq-default abbrev-mode t))

(use-package windmove-default-keybindings
  :bind
  (("C-c <left>" . windmove-left)
  ("C-c <right>" . windmove-right)
  ("C-c <up>" . windmove-up)
  ("C-c <down>" . windmove-down)))

(use-package org
  :bind
  (("C-c a" . org-agenda)
  ("C-c l" . org-store-link)
  ("C-c c" . org-capture)
  ("C-c b" . org-switchb)))

;;; third-party packages

(use-package auctex
  :defer t
  :ensure t)

(use-package evil
  :ensure t
  :config (evil-mode t))

(use-package fill-column-indicator
  :ensure t
  :config
  (setq fci-rule-column 80))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package flx-ido
  :ensure t
  :config
  (flx-ido-mode))

(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-mode +1))

(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . gfm-mode)))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.5)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  (global-company-mode))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

(use-package julia-mode
  :ensure t
  :defer t)

(use-package ess
  :ensure t
  :defer t
  :config
  (setq ess-style 'DEFAULT))

(use-package poly-markdown
  :defer t
  :ensure t)

(use-package poly-R
  :defer t
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :if (eq system-type 'darwin)
  :config
  (exec-path-from-shell-initialize))

;;; init.el ends here
