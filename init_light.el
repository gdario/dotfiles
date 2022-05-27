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

;; Set the default font
(if (eq system-type 'darwin)
    (set-frame-font "Monaco-13" nil t)
  (set-frame-font "Monospace-11" nil t))

;; Set Wombat as the theme when in graphical mode
(if (display-graphic-p)
   (load-theme 'wombat t))

(if (eq system-type 'darwin)
    (setq ispell-program-name "/usr/local/bin/ispell"))

;; (global-visual-line-mode t)
(set-default 'truncate-lines t)
(show-paren-mode t)
(column-number-mode t)
;; (electric-pair-mode t)

;; make electric-pair-mode work on more brackets
;; (setq electric-pair-pairs
;;       '(
;;         (?\" . ?\")
;; 	;; (?\' . ?\')
;; 	(?\< . ?\>)
;;         (?\{ . ?\})))

;; Require a newline at end of the file
(setq require-final-newline t)

;;; Enable hs-minor mode on all programming modes
(add-hook 'prog-mode-hook #'hs-minor-mode)
(add-hook 'text-mode-hook #'visual-line-mode)

;; Try to make TRAMP a bit faster
(setq remote-file-name-inhibit-cache nil)
(setq vc-ignore-dir-regexp
      (format "%s\\|%s"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))
(setq tramp-verbose 1)

;; Configure Org
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
  ;; (setq org-agenda-files (directory-files-recursively "~/org/" "\\.org$"))
  (setq org-log-done t))

;;; Third-party packages

;; (use-package auctex
;;   :defer t
;;   :ensure t)

(use-package flycheck
  ;; :defer t
  :ensure t
  :init (global-flycheck-mode))

(use-package exec-path-from-shell
  ;; :defer t
  :ensure t
  :if (memq window-system '(mac ns x))
  :config (exec-path-from-shell-initialize))

(use-package company
  ;; :defer t
  :ensure t
  :config
  (global-company-mode t))

(use-package ssh
  ;; :defer t
  :ensure t)

(use-package elpy
  ;; :defer t
  :ensure t
  :config
  (when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
  ;; If you want to use the Python REPL uncomment these lines
  (setq python-shell-interpreter "python"
	python-shell-interpreter-args "-i")
  ;; ;; If you want to use Jupyter Console uncomment these lines
  ;; (setq python-shell-interpreter "jupyter"
  ;; 	python-shell-interpreter-args "console --simple-prompt"
  ;; 	python-shell-prompt-detect-failure-warning nil)
  ;; (add-to-list 'python-shell-completion-native-disabled-interpreters
  ;;              "jupyter")
  ;; ;; If you want to use IPython uncomment these lines
  ;; (setq python-shell-interpreter "ipython"
  ;; 	python-shell-interpreter-args "-i --simple-prompt")
  :init
  (advice-add 'python-mode :before 'elpy-enable))

(use-package magit
  ;; :defer t
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package ess
  ;; :defer t
  :ensure t
  :init
  (setq ess-style 'DEFAULT))

(use-package poly-markdown
  ;; :defer t
  :ensure t)

(use-package poly-R
  ;; :defer t
  :ensure t)

;; (use-package julia-mode
;;   :ensure t
;;   :defer t)

(use-package markdown-mode
  ;; :defer t
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package projectile
  ;; :defer t
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
 '(c-default-style '((c-mode . "") (c++-mode . "")))
 '(column-number-mode t)
 '(display-fill-column-indicator-column 80)
 '(elpy-shell-starting-directory 'current-directory)
 '(ess-R-font-lock-keywords
   '((ess-R-fl-keyword:keywords . t)
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
     (ess-R-fl-keyword:F&T)))
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages '(flycheck use-package))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
