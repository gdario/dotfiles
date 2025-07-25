(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq backup-directory-alist '(("." . "~/.saves")))
(if window-system
    (progn
      (set-frame-font "Menlo 13" nil t)
      (load-theme 'spacemacs-light t)))

(setq inhibit-startup-message t)
(column-number-mode t)
(windmove-default-keybindings 'super)
(tool-bar-mode -1)
(keymap-global-set "C-M-z" 'zap-up-to-char)

(add-hook 'text-mode-hook '(lambda ()
    (setq truncate-lines nil
          word-wrap t)))

(add-hook 'prog-mode-hook '(lambda ()
    (setq visual-line-mode t
          word-wrap nil)))

(use-package spacemacs-theme
  :ensure t)

(use-package org
  :bind
  (("C-c a" . org-agenda)
   ("C-c l" . org-store-link)
   ("C-c c" . org-capture))
  :init
  (require 'org-tempo)
  (if window-system (setq org-hide-emphasis-markers t))
  :hook
  (org-mode . visual-line-mode)
  (org-mode . (lambda () (setq electric-indent-local-mode -1)))
  :config
  (setq org-directory "~/Documents/org")
  (setq org-default-notes-file (concat org-directory "/notes.org")))

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; (use-package corfu
;;   :ensure t
;;   :defer t
;;   :init
;;   (global-corfu-mode))

(use-package pyvenv
  :defer t
  :ensure t)

(use-package python-mode
  :defer t
  :init
  (setq python-shell-completion-native-enable nil)
  :hook
  (python-mode . eglot-ensure)
  (python-mode . completion-preview-mode))

(use-package magit
  :ensure t
  :defer t
  :bind (("C-x g" . magit-status)))

(use-package markdown-mode
  :ensure t
  :defer t
  :commands (markdown-mode gfm-mode)
  :mode
  (("README\\.md\\'" . gfm-mode)
   ("\\.md\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "multimarkdown")
  :hook
  (markdown-mode . visual-line-mode))

(use-package nov
  :ensure t
  :defer t
  :mode
  ("\\.epub\\'" . nov-mode))

(use-package yaml-mode
  :ensure t
  :defer t)

(use-package toml-mode
  :ensure t
  :defer t)

;; (use-package auctex
;;   :ensure t
;;   :defer t)

(use-package ess
  :ensure t
  :defer t
  :config
  (setq ess-style 'RStudio))

(use-package poly-noweb
  :ensure t
  :defer t)

(use-package poly-markdown
  :ensure t
  :defer t)

(use-package poly-R
  :ensure t
  :defer t)

(use-package vertico
  :ensure t
  :defer t
  :init
  (vertico-mode))

(use-package sicp
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("9af2b1c0728d278281d87dc91ead7f5d9f2287b1ed66ec8941e97ab7a6ab73c0"
     default))
 '(org-export-backends '(ascii html icalendar md odt))
 '(package-selected-packages nil)
 '(sql-connection-alist
   '(("trinetx-pca" (sql-product 'postgres) (sql-user "dariog")
      (sql-server "redshift-01-us.dap.apollo.roche.com")
      (sql-database "trinetx_pca") (sql-port 5439))
     ("pincai" (sql-product 'postgres) (sql-user "dariog")
      (sql-server "redshift-02-us.dap.apollo.roche.com")
      (sql-database "premier_phd_ac") (sql-port 5439)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
