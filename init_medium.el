;;; init.el --- shamelessly stolen from Bozhidar Batsov's Emacs configuration

;;; Commentary:
;; This configuration is based (let's say copied) from the one below.
;; https://github.com/bbatsov/emacs.d/blob/master/init.el

;;; Code:

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; keep the installed packages in .emacs.d
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))

;; update the package metadata if the local cache is missing
(unless package-archive-contents
  (package-refresh-contents))

;; Remove the toolbar
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

;; Set default font
(if (eq system-type 'darwin)
    (set-frame-font "Monaco-13" nil t)
  (set-frame-font "Monospace-11" nil t))

;; Set default encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; store all backup and autosave files in the .saves dir

(setq backup-directory-alist `(("." . "~/.saves")))

;; Make ispell accessible
(if (eq system-type 'darwin)
    (setq ispell-program-name "/usr/local/bin/ispell"))

;; Set the visual line mode in every buffer (to be reviewed)
(global-visual-line-mode t)

;; If Emacs is running in graphical mode, use wombat
;; (if (display-graphic-p)
;;     (load-theme 'wombat t))

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

;; Make TRAMP faster

(use-package tramp
  :config
  (setq remote-file-name-inhibit-cache nil)
  (setq vc-ignore-dir-regexp
	(format "%s\\|%s"
                vc-ignore-dir-regexp
                tramp-file-name-regexp))
  (setq tramp-verbose 1)
)

;;; Built-in packages

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
  :init
  (electric-indent-mode -1)
  :config
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)
  (setq org-log-done t)
  (setq org-babel-python-command "python3")
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (shell . t)))
  (setq org-agenda-files '("~/Documents/Notes/org"
			   "~/Documents/Notes/org/learning"
			   "~/Documents/Notes/org/meetings"
			   "~/Documents/Notes/org/misc"
			   "~/Documents/Notes/org/projects")))
  
(use-package ssh
  :ensure t)

;;; Third-party packages

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
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

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
  :init
  (elpy-enable)
  (setq python-shell-interpreter "jupyter"
	python-shell-interpreter-args "console --simple-prompt"
	python-shell-prompt-detect-failure-warning nil)
  (add-to-list 'python-shell-completion-native-disabled-interpreters "jupyter"))

(use-package julia-mode
  :defer t
  :ensure t)

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

(use-package exec-path-from-shell
  :ensure t
  :if (eq system-type 'darwin)
  :config
  (exec-path-from-shell-initialize))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-rpc-python-command "python3")
 '(elpy-rpc-virtualenv-path 'current)
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
 '(global-visual-line-mode t)
 '(package-selected-packages '(elpy use-package))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here

