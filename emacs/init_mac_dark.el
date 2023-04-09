;;; init.el --- Giovanni's Emacs configuration
;;
;; Author: Giovanni d'Ario <giovanni.dario@gmail.com>
;; URL: https://github.com/dariog/dotfiles/emacs.d
;; Keywords: convenience

;;; Commentary:

;; This is my personal Emacs configuration.  Nothing more, nothing less.

;;; Code:
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Automatically update installed packages
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; Store all backup and autosave files in the .saves dir
(setq backup-directory-alist `(("." . "~/.saves")))

;; Startup settings
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(setq visible-bell t)
(set-default 'truncate-lines t)
(show-paren-mode t)
(column-number-mode t)
(electric-pair-mode t)

;; Set the font and the location of the spell-checker based on the operating
;; system
(if (eq system-type 'darwin)
    (progn (set-frame-font "Monaco-13" nil t)
     (setq ispell-program-name "/usr/local/bin/ispell"))
  (set-frame-font "Monospace-11" nil t))

;; Set Wombat as the theme when in graphical mode
(if (display-graphic-p)
   (load-theme 'wombat t))

;; Enable visual-line mode in all text modes
(add-hook 'text-mode-hook #'visual-line-mode)

;; Enable hs-minor mode on all programming modes
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; Require a newline at end of the file
;; (setq require-final-newline t)

;; Setup org-mode
(use-package org
  :bind
  (("C-c a" . org-agenda)
  ("C-c l" . org-store-link)
  ("C-c c" . org-capture)
  ("C-c b" . org-switchb))
  :config
  ;; (electric-indent-mode -1)
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)
  (setq org-log-done t)
  (setq org-agenda-files (directory-files-recursively "~/org/" "\\.org$"))
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a"))))

(use-package exec-path-from-shell
  :defer t
  :if (memq window-system '(mac ns x))
  :config (exec-path-from-shell-initialize))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package elpy
  :defer t
  :if (memq window-system '(mac ns x))
  :config
  (setq python-shell-completion-native-enable nil)
  :init
  (advice-add 'python-mode :before 'elpy-enable))

(use-package ssh
  :defer t)

(use-package ido
  :defer t
  :config
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1))

(use-package company
  :ensure t
  :config
  (global-company-mode t))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))

(use-package yasnippet
  :ensure t
  :config (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

(use-package magit
  :defer t
  :bind (("C-x g" . magit-status)))

(use-package markdown-mode
  :defer t
  :commands (markdown-mode gfm-mode)
  :mode
  (("README\\.md\\'" . gfm-mode)
   ("\\.md\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "multimarkdown"))

(use-package ess
  :defer t
  :config
  (setq ess-style 'RStudio))

(use-package poly-markdown
  :defer t)

(use-package poly-R
  :defer t)

(use-package quarto-mode
  :defer t
  :mode (("\\.Rmd" . poly-quarto-mode)))

;;; stan-mode.el
(use-package stan-mode
  :ensure t
  :defer t
  :mode ("\\.stan\\'" . stan-mode)
  :hook (stan-mode . stan-mode-setup)
  ;;
  :config
  ;; The officially recommended offset is 2.
  (setq stan-indentation-offset 2))

;;; company-stan.el
(use-package company-stan
  :ensure t
  :defer t
  :hook (stan-mode . company-stan-setup)
  :config
  ;; Whether to use fuzzy matching in `company-stan'
  (setq company-stan-fuzzy nil))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-rpc-python-command "python3")
 '(elpy-shell-starting-directory 'current-directory)
 '(fill-column 80)
 '(package-selected-packages '(auto-package-update hs-minor-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
