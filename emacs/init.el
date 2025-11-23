(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq backup-directory-alist '(("." . "~/.saves")))

(use-package emacs
  :custom
  (truncate-lines t)
  (inhibit-startup-message t)
  :config
  ;; (if window-system (set-frame-font "Menlo 13" nil t))
  (if window-system
      (set-frame-font "JetBrainsMono Nerd Font 14" nil t))
  (windmove-default-keybindings 'super)
  (column-number-mode t)
  (tool-bar-mode -1)
  :hook
  (prog-mode . display-line-numbers-mode)
  (text-mode . visual-line-mode))

(use-package org-mode
  :defer t
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture)
  :init
  (require 'org-tempo)
  :hook
  (org-mode . visual-line-mode))
  ;; (org-mode . (lambda () (setq electric-indent-local-mode -1))))

(use-package magit
  :ensure t
  :defer t)

(use-package pyvenv
  :ensure t
  :defer t)

(use-package python-mode
  :defer t
  :custom
  (display-fill-column-indicator-column 80)
  (display-line-numbers-mode)
  ;; (display-line-numbers-type 'relative)
  :hook
  (python-mode . display-fill-column-indicator-mode)
  (python-mode . display-line-numbers-mode))

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
  
(use-package yaml-mode
  :ensure t
  :defer t)

(use-package toml-mode
  :ensure t
  :defer t)

(use-package ess
  :ensure t
  :defer t
  :config
  (setq ess-style 'RStudio)
  :hook
  (ess-r-mode . display-fill-column-indicator-mode)
  (ess-r-mode . display-line-numbers-mode))

(use-package poly-noweb
  :ensure t
  :defer t)

(use-package poly-markdown
  :ensure t
  :defer t)

(use-package poly-R
  :ensure t
  :defer t)

(use-package racket-mode
  :ensure t
  :defer t)

(use-package sicp
  :ensure t)

(use-package nov
  :ensure t
  :defer t
  :mode
  ("\\.epub\\'" . nov-mode))

;; (use-package auctex
;;   :ensure t
;;   :defer t)

(use-package typst-ts-mode
  :ensure t
  :defer t)

(use-package rust-mode
  :ensure t
  :defer t
  :config
  (setq rust-format-on-save t))

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package orderless
  :ensure t
  :defer t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defuaults nil)
  (completion-pcm-leading-wildcard t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit nov orderless poly-R pyvenv racket-mode rust-mode sicp
	   toml-mode typst-ts-mode vertico yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
