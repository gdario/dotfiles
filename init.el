;;; init.el --- shamelessly stolen from Bozhidar's Emacs configuration

;;; Commentary:
;; This configuration is based (copied, actually) from the one below.
;; https://github.com/bbatsov/emacs.d/blob/master/init.el

;;; Code:

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; keep the installed packages in .emacs.d
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))

(package-initialize)

;; update the package metadata is the local cache is missing
(unless package-archive-contents
  (package-refresh-contents))

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; disable startup screen
(setq inhibit-startup-screen t)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; Newline at end of file
(setq require-final-newline t)

;; store all backup and autosave files in the .saves dir
(setq backup-directory-alist `(("." . "~/.saves")))

;; Set default font
(if (eq system-type 'darwin)
    (set-frame-font "Monaco-13" nil t)
  (set-frame-font "Monospace-11" nil t))

;; Set default encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; If Emacs is running in graphical mode, use wombat
;; (if (display-graphic-p) (load-theme 'wombat t))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)

(global-set-key (kbd "C-M-z") 'zap-up-to-char)

;; Show ISO week numbers in the calendar
(setq calendar-week-start-day 1
      calendar-intermonth-text
      '(propertize
        (format "%2d"
                (car
                 (calendar-iso-from-absolute
                  (calendar-absolute-from-gregorian (list month day year)))))
        'font-lock-face 'font-lock-function-name-face))

;;; built-in packages

(use-package paren
  :config
  (show-paren-mode +1))

(use-package elec-pair
  :config
  (electric-pair-mode +1))

(use-package abbrev
  :config
  (setq save-abbrevs 'silently)
  (setq-default abbrev-mode t))

(use-package windmove-default-keybindings
  :bind
  (("C-c <left>" . windmove-left)
  ("C-c <right>" . windmove-right)
  ("C-c <up>" . windmove-up)
  ("C-c <down>" . windmove-down)))

(use-package org
  :bind
  (("C-c a" . org-agenda)
  ("C-c l" . org-store-link)
  ("C-c c" . org-capture)
  ("C-c b" . org-switchb))
  :config
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)
  (setq org-log-done t)
  (setq org-babel-python-command "python3")
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (shell . t)
     (r . t)))
    (setq org-agenda-files '("~/org"
			   "~/org/learning"
			   "~/org/misc"
			   "~/org/phc"
			   "~/org/projects")))

;;; third-party packages

;; (use-package auctex
;;   :defer t
;;   :ensure t)

(use-package fill-column-indicator
  :ensure t
  :config
  (setq fci-rule-column 80))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package flx-ido
  :ensure t
  :config
  (flx-ido-mode))

(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-mode +1))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode))
  :init (setq markdown-command "/usr/local/bin/multimarkdown"))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.5)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  (global-company-mode))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package yaml-mode
  :ensure t
  :defer t)

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  :config
  (setq python-shell-interpreter "jupyter"
	python-shell-interpreter-args "console --simple-prompt"
	python-shell-prompt-detect-failure-warning nil)
  (add-to-list 'python-shell-completion-native-disabled-interpreters "jupyter"))

(use-package julia-mode
  :ensure t
  :defer t)

(use-package ess
  :ensure t
  :defer t
  :config
  (setq ess-style 'RStudio))

(use-package poly-markdown
  :defer t
  :ensure t)

(use-package poly-R
  :defer t
  :ensure t)

;; stan-mode.el
(use-package stan-mode
  :mode ("\\.stan\\'" . stan-mode)
  :hook (stan-mode . stan-mode-setup)
  :config
  (setq stan-indentation-offset 2))

;; company-stan.el
(use-package company-stan
  :hook (stan-mode . company-stan-setup)
  :config
  (setq company-stan-fuzzy nil))

;; eldoc-stan.el
(use-package eldoc-stan
  :hook (stan-mode . eldoc-stan-setup)
  :config)

;; flycheck-stan.el
(use-package flycheck-stan
  ;; Add a hook to setup `flycheck-stan' upon `stan-mode' entry
  :hook ((stan-mode . flycheck-stan-stanc2-setup)
         (stan-mode . flycheck-stan-stanc3-setup))
  :config
  (setq flycheck-stanc-executable nil)
  (setq flycheck-stanc3-executable nil))

;; stan-snippets.el
(use-package stan-snippets
  :hook (stan-mode . stan-snippets-initialize)
  :config)

(use-package exec-path-from-shell
  :ensure t
  :if (eq system-type 'darwin)
  :config
  (exec-path-from-shell-initialize))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-rpc-python-command "python3")
 '(elpy-shell-starting-directory 'current-directory)
 '(global-visual-line-mode t)
 '(inferior-ess-r-program "/Users/admin/miniconda3/envs/R/bin/R")
 '(org-export-backends '(ascii beamer html icalendar latex md odt))
 '(package-selected-packages
   '(julia-mode use-package projectile poly-R magit flycheck flx-ido fill-column-indicator exec-path-from-shell ess elpy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
