;;; init.el --- Giovanni's Emacs configuration
;;
;; Author: Giovanni d'Ario <giovanni.dario@gmail.com>
;; URL: https://github.com/dariog/dotfiles/emacs.d
;; Keywords: convenience

;;; Commentary:

;; This is my personal Emacs configuration. Work In Progress.

;;; Code:
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; (require 'use-package)
(setq use-package-always-ensure t)

;; Store all backup and autosave files in the .saves dir
(setq backup-directory-alist `(("." . "~/.saves")))

;; Startup settings
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(show-paren-mode t)
(column-number-mode t)

;; Set the font and the location of the spell-checker based on the operating
;; system
(if (eq system-type 'darwin)
    (progn (set-frame-font "Monaco-13" nil t)
     (setq ispell-program-name "/usr/local/bin/ispell"))
  (set-frame-font "Monospace-11" nil t))

;; Enable visual-line mode in all text modes
(add-hook 'text-mode-hook #'visual-line-mode)
(add-hook 'python-mode-hook 'eglot-ensure)

;; Enable hs-minor mode on all programming modes
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; Setup org-mode
(use-package org
  :bind
  (("C-c a" . org-agenda)
   ("C-c l" . org-store-link)
   ("C-c c" . org-capture)
   ("C-c b" . org-switchb))
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (R . t)))
  (electric-indent-mode -1)
  ;; (setq org-clock-persist 'history)
  ;; (org-clock-persistence-insinuate)
  (setq org-babel-python-command "python3")
  (setq org-log-done t))

(use-package company
  :ensure t
  :config
  (global-company-mode t))

(use-package magit
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

;;;; nov allows reading epubs from within Emacs
;; (use-package nov
;;   :defer t
;;   :mode
;;   ("\\.epub\\'" . nov-mode))

;; (use-package sicp
;;   :ensure t
;;   :defer t)
;; 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fill-column 80)
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages '(magit company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
