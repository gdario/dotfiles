;;; init.el --- Giovanni's Emacs configuration
;;
;; Author: Giovanni d'Ario <giovanni.dario@gmail.com>
;; URL: https://github.com/dariog/dotfiles/emacs.d
;; Keywords: convenience

;;; Commentary:

;; This is my personal Emacs configuration.  Nothing more, nothing less.

;;; Code:

(require 'package)

;; Uncomment for the bleeding-edge version of Melpa
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; activate all the packages (in particular autoloads)
(package-initialize)

;; list the packages you want
(setq package-list '(use-package))

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Remove the tool-bar (don't confuse it with
(tool-bar-mode -1)

;; store all backup and autosave files in the .saves dir
(setq backup-directory-alist `(("." . "~/.saves")))

;; (global-visual-line-mode t)
(set-default 'truncate-lines t)
(show-paren-mode t)
(column-number-mode t)
(electric-pair-mode t)

;; Set the location of the spell-checker
(if (eq system-type 'darwin)
    (progn (set-frame-font "Monaco-13" nil t)
     (setq ispell-program-name "/usr/local/bin/ispell"))
  (set-frame-font "Monospace-11" nil t))

;; Require a newline at end of the file
;; (setq require-final-newline t)

;;; Enable hs-minor mode on all programming modes
(add-hook 'prog-mode-hook #'hs-minor-mode)
(add-hook 'text-mode-hook #'visual-line-mode)

;; Configure Org
(use-package org
  :bind
  (("C-c a" . org-agenda)
  ("C-c l" . org-store-link)
  ("C-c c" . org-capture)
  ("C-c b" . org-switchb))
  :config
  (setq org-log-done t))

;;; ---------- Third-party packages ----------

(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config (exec-path-from-shell-initialize))

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

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

(use-package ssh
  :defer t
  :ensure t)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package ess
  :defer t
  :ensure t
  :config
  (setq ess-style 'RStudio))

(use-package poly-markdown
  :defer t
  :ensure t)

(use-package poly-R
  :defer t
  :ensure t)

(use-package markdown-mode
  :defer t
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; ;;; stan-mode.el
;; (use-package stan-mode
;;   :ensure t
;;   :defer t
;;   :mode ("\\.stan\\'" . stan-mode)
;;   :hook (stan-mode . stan-mode-setup)
;;   ;;
;;   :config
;;   ;; The officially recommended offset is 2.
;;   (setq stan-indentation-offset 2))

;; ;;; company-stan.el
;; (use-package company-stan
;;   :ensure t
;;   :defer t
;;   :hook (stan-mode . company-stan-setup)
;;   :config
;;   ;; Whether to use fuzzy matching in `company-stan'
;;   (setq company-stan-fuzzy nil))

;; ;;; eldoc-stan.el
;; (use-package eldoc-stan
;;   :ensure t
;;   :defer t
;;   :hook (stan-mode . eldoc-stan-setup))

;; ;;; flycheck-stan.el
;; (use-package flycheck-stan
;;   :ensure t
;;   :defer t
;;   ;; Add a hook to setup `flycheck-stan' upon `stan-mode' entry
;;   :hook ((stan-mode . flycheck-stan-stanc2-setup)
;;          (stan-mode . flycheck-stan-stanc3-setup))
;;   :config
;;   ;; A string containing the name or the path of the stanc2 executable
;;   ;; If nil, defaults to `stanc2'
;;   (setq flycheck-stanc-executable nil)
;;   ;; A string containing the name or the path of the stanc2 executable
;;   ;; If nil, defaults to `stanc3'
;;   (setq flycheck-stanc3-executable nil))

;; ;;; stan-snippets.el
;; (use-package stan-snippets
;;   :ensure t
;;   :defer t
;;   :hook (stan-mode . stan-snippets-initialize))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style (quote ((c-mode . "") (c++-mode . ""))))
 '(column-number-mode t)
 '(display-fill-column-indicator-column 80)
 '(ess-R-font-lock-keywords
   (quote
    ((ess-R-fl-keyword:keywords . t)
     (ess-R-fl-keyword:constants . t)
     (ess-R-fl-keyword:modifiers . t)
     (ess-R-fl-keyword:fun-defs . t)
     (ess-R-fl-keyword:assign-ops . t)
     (ess-R-fl-keyword:%op% . t)
     (ess-fl-keyword:fun-calls . t)
     (ess-fl-keyword:numbers)
     (ess-fl-keyword:operators . t)
     (ess-fl-keyword:delimiters)
     (ess-fl-keyword:=)
     (ess-R-fl-keyword:F&T))))
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(package-selected-packages (quote (poly-R poly-markdown ess magit ssh use-package)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
