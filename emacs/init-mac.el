(require 'package)
(package-initialize)

;; To avoid issues with the certificates
(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq backup-directory-alist '(("." . "~/.saves")))

;; Place to save third-party info files
(add-to-list 'Info-directory-list "~/.emacs.d/infofiles")

(tool-bar-mode -1)
(set-frame-font "Monaco 13" nil t)
(set-register ?m (cons 'file "~/Documents/org/main.org"))
(keymap-global-set "C-x C-b" 'ibuffer)
(column-number-mode t)

(use-package emacs
  :hook
  ((prog-mode . display-line-numbers-mode)
   ;; (prog-mode . electric-pair-mode)
   (prog-mode . (lambda ()
		  (visual-line-mode -1)
		  (toggle-truncate-lines 1)))))

(use-package windmove
  :bind
  (("M-<left>" . windmove-left)
   ("M-<right>" . windmove-right)
   ("M-<up>" . windmove-up)
   ("M-<down>" . windmove-down)))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '((python-mode python-ts-mode) . ("ty" "server"))))

(use-package exec-path-from-shell
  :ensure t
  :init
  (exec-path-from-shell-initialize))

(use-package org
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture)
  :custom
  (org-clock-persist 'history)
  (org-directory "~/Documents/org")
  (org-capture-templates
   '(("t" "Todo" entry
      (file+headline "~/Documents/org/todos.org" "TODOs")
      "* TODO %?\n  %i\n")
     ("d" "Daily Note" entry
      (file+olp+datetree "~/Documents/org/daily_notes.org")
      "* TITLE %U\n  %i")   
      ;; "* %? %U\n  %i")   
     ("c" "To Check" entry
      (file+headline "~/Documents/org/to_check.org" "To Check")
      "* %?\n %i")))
  :hook
  (org-mode . visual-line-mode)
  :init
  (org-clock-persistence-insinuate)
  (require 'org-tempo)
  (require 'ob-sql)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     (shell . t)
     (sql . t))))

(use-package csv-mode
  :ensure t
  :defer t)

;; (use-package auctex
;;   :ensure t
;;   :defer t)

(use-package magit
  :ensure t
  :defer t
  :bind (("C-x g" . magit-status)))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))

(use-package pyvenv
  :ensure t
  :defer t)

(use-package python-mode
  :defer t
  :hook
  ;; (python-mode . eglot-ensure)
  (python-mode . completion-preview-mode))

(use-package toml
  :ensure t
  :defer t)

(use-package yaml-mode
  :ensure t
  :defer t)

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

(use-package quarto-mode
  :ensure t
  :defer t
  :mode
  ("\\.qmd\\'" . quarto-mode))

(use-package sqlformat
  :ensure t
  :defer t
  :init
  (setq sqlformat-command 'pgformatter)
  (setq sqlformat-args '("-s2" "-g"))
  :hook
  (sql-mode . sqlformat-on-save-mode))

(use-package nov
  :ensure t
  :defer t
  :mode
  ("\\.epub\\'" . nov-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-rpc-python-command "python3")
 '(go-ts-mode-indent-offset 4)
 '(org-agenda-files
   '("~/Documents/org/raan.org" "/Users/dariog/Documents/org/cads.org"
     "/Users/dariog/Documents/org/projects/processor.org"
     "/Users/dariog/Documents/org/german.org"
     "/Users/dariog/Documents/org/misc.org"
     "/Users/dariog/Documents/org/todos.org"
     "/Users/dariog/Documents/org/to_check.org"
     "/Users/dariog/Documents/org/main.org"))
 '(org-export-backends '(ascii beamer html icalendar latex md odt))
 '(org-refile-targets '((org-agenda-files :maxlevel . 6)))
 '(package-selected-packages
   '(csv-mode exec-path-from-shell magit nov poly-R projectile pyvenv
	      quarto-mode sqlformat toml yaml-mode))
 '(sql-connection-alist
   '(("truveta" (sql-product 'postgres) (sql-user "dariog")
      (sql-password "P4r_Z54BhLtkwMIYRe")
      (sql-server "redshift-02-us.dap.apollo.roche.com")
      (sql-database "truveta_ehr_claims") (sql-port 5439)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
