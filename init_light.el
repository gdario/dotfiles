(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; Remove the tool-bar (don't confuse it with 
(tool-bar-mode -1)

;;; store all backup and autosave files in the .saves dir

(setq backup-directory-alist `(("." . "~/.saves")))
(setq ispell-program-name "/usr/local/bin/ispell")

;;; Set the default font

(if (eq system-type 'darwin)
    (set-frame-font "Monaco-13" nil t)
  (set-frame-font "Monospace-11" nil t))

(global-visual-line-mode t)
(show-paren-mode t)
(electric-pair-mode t)

;;; Make TRAMP faster

(setq remote-file-name-inhibit-cache nil)
(setq vc-ignore-dir-regexp
      (format "%s\\|%s"
                    vc-ignore-dir-regexp
                    tramp-file-name-regexp))
(setq tramp-verbose 1)

;;; Configure Org

(use-package org
  :bind
  (("C-c a" . org-agenda)
  ("C-c l" . org-store-link)
  ("C-c c" . org-capture)
  ("C-c b" . org-switchb))
  :config
  (electric-indent-mode -1)
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)
  (setq org-log-done t)
  (setq org-agenda-files '("~/Documents/org/misc"
			   "~/Documents/org/projects"
			   "~/Documents/org/meetings")))
;;; Third party packages

(use-package ssh
  :ensure t)

(use-package auctex
  :ensure t
  :defer t)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

(use-package ess
  :ensure t
  :defer t
  :init
  (setq ess-style 'DEFAULT))

(use-package poly-markdown
  :ensure t)

(use-package poly-R
  :defer t
  :ensure t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))

;; (setq projectile-mode-line "Projectile")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-rpc-virtualenv-path 'current)
 '(package-selected-packages '(ess use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
