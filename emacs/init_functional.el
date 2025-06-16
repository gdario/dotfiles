(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq backup-directory-alist '(("." . "~/.saves")))
(if window-system (set-frame-font "Menlo 13" nil t))
(setq inhibit-startup-message t)
(column-number-mode t)
(windmove-default-keybindings 'super)
(tool-bar-mode -1)

(use-package org
  :bind
  (("C-c a" . org-agenda)
   ("C-c l" . org-store-link)
   ("C-c c" . org-capture))
  :init
  (require 'org-tempo)
  :hook
  (org-mode . visual-line-mode)
  :config
  (setq org-directory "~/Documents/org")
  (setq org-default-notes-file (concat org-directory "/notes.org")))

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package pyvenv
  :defer t
  :ensure t)

(use-package python-mode
  :defer t
  :init
  (setq python-shell-completion-native-enable nil))

;; (use-package csv-mode
;;   :ensure t
;;   :defer t
;;   :hook
;;   (csv-mode . csv-align-mode))

;; (use-package magit
;;   :ensure t
;;   :defer t
;;   :bind (("C-x g" . magit-status)))

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

(use-package haskell-mode
  :ensure t
  :defer t)

(use-package racket-mode
  :ensure t
  :defer t)

(use-package slime
  :ensure t
  :defer t)

(use-package auctex
  :ensure t
  :defer t)
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-export-backends '(ascii html icalendar md odt))
 '(package-selected-packages
   '(auctex exec-path-from-shell haskell-mode markdown-mode pyvenv
	    racket-mode slime))
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
