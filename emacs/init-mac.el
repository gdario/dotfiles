(require 'package)
(package-initialize)

;; To avoid issues with the certificates
(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq backup-directory-alist '(("." . "~/.saves")))

(tool-bar-mode -1)
(set-frame-font "Monaco 13" nil t)
(set-register ?m (cons 'file "~/Documents/org/main.org"))
(keymap-global-set "C-x C-b" 'ibuffer)

(use-package emacs
  :hook
  ((prog-mode . display-line-numbers-mode)
   (prog-mode . electric-pair-mode)))

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

(use-package org-mode
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture)
  :custom
  (org-directory "~/Documents/org")
  (org-capture-templates
   '(("t" "Todo" entry
      (file+headline "~/Documents/org/todos.org" "TODOs")
      "* TODO %?\n  %i\n")
     ("d" "Daily Note" entry
      (file+datetree "~/Documents/org/daily_notes.org")
      "* TITLE %U\n  %i")   
      ;; "* %? %U\n  %i")   
     ("c" "To Check" entry
      (file+headline "~/Documents/org/to_check.org" "To Check")
      "* %?\n %i")))
  :hook
  (org-mode . visual-line-mode)
  :init
  (require 'org-tempo))

(use-package magit
  :ensure t
  :defer t
  :bind (("C-x g" . magit-status)))

(use-package pyvenv
  :ensure t
  :defer t)

(use-package python-mode
  :defer t
  :hook
  (python-mode . eglot-ensure)
  (python-mode . completion-preview-mode))

(use-package toml
  :ensure t
  :defer t)

(use-package yaml
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

(use-package quarto-mode
  :ensure t
  :defer t
  :mode
  ("\\.qmd\\'" . quarto-mode))

(use-package go-mode
  :ensure t
  :defer t
  :mode
  ("\\.go\\'" . go-mode)  
)

(use-package sqlformat
  :ensure t
  :defer t
  :init
  (setq sqlformat-command 'pgformatter)
  (setq sqlformat-args '("-s2" "-g"))
  :hook
  (sql-mode . sqlformat-on-save-mode))

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
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(org-refile-targets '((org-agenda-files :maxlevel . 6)))
 '(package-selected-packages
   '(exec-path-from-shell go-mode magit poly-R pyvenv quarto-mode
			  sqlformat toml yaml))
 '(sql-connection-alist
   '(("truveta" (sql-product 'postgres) (sql-user "dariog")
      (sql-server "redshift-02-us.dap.apollo.roche.com")
      (sql-database "truveta_ehr_claims") (sql-port 5439)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
