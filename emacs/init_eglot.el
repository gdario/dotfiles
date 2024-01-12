(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(if (eq system-type 'darwin)
    (progn (set-frame-font "MesloLGS NF-13" nil t)
     (setq ispell-program-name "/usr/local/bin/ispell"))
  (set-frame-font "Monospace-11" nil t))

;; Store all backup and autosave files in the .saves dir
(setq backup-directory-alist `(("." . "~/.saves")))

;; Startup defaults
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(show-paren-mode t)
(column-number-mode t)
(electric-pair-mode t)

;; Enable visual-line mode in all text modes
(add-hook 'text-mode-hook #'visual-line-mode)

;; Enable hs-minor mode on all programming modes
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; Setup org-mode
(use-package org
  :bind
  (("C-c a" . org-agenda)
  ("C-c l" . org-store-link)
  ("C-c c" . org-capture))
  :config
  (setq org-babel-python-command "python3")
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (R . t)))
  (setq org-log-done t))

(use-package company
  :ensure t
  :defer t)

(use-package python-mode
  :hook
  ((python-mode . eglot-ensure)
   (python-mode . company-mode)))

(use-package pyvenv
  :ensure t
  :defer t)

(use-package magit
  :defer t
  :ensure t
  :bind (("C-x g" . magit-status)))

;; (use-package markdown-mode
;;   :defer t
;;   :commands (markdown-mode gfm-mode)
;;   :mode
;;   (("README\\.md\\'" . gfm-mode)
;;    ("\\.md\\'" . markdown-mode)
;;    ("\\.markdown\\'" . markdown-mode))
;;   :init
;;   (setq markdown-command "multimarkdown"))

;; (use-package ess
;;   :defer t
;;   :ensure t
;;   :hook
;;   ((ess-r-mode . eglot-ensure))
;;   ((ess-r-mode . company-mode))
;;   :config
;;   (setq ess-style 'RStudio))

;; (use-package poly-markdown
;;   :defer t
;;   :ensure t)

;; (use-package poly-R
;;   :defer t
;;   :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
