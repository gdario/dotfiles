;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Add Melpa to the package repositories
(package-initialize)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Move around windows with SHIFT + arrow
(windmove-default-keybindings)

;; Remove the toolbar
(tool-bar-mode -1)

; Activate ido-mode, but ignore it when writing files
;; (require 'ido)
;; (ido-mode t)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(define-key (cdr ido-minor-mode-map-entry) [remap write-file] nil)

;;; MARKDOWN
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

;;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

;; Use an indentation style for ESS that mimics the one of RStudio
(setq ess-default-style 'DEFAULT)

;; Use visual line mode
(global-visual-line-mode t)

;; Use pdflatex by default
(setq TeX-PDF-mode t)

;; Enable company-auctex
(require 'company-auctex)
(company-auctex-init)

;; Create shortcut for magit-status
(global-set-key (kbd "C-x g") 'magit-status)

;; Use company-mode globally
(add-hook 'after-init-hook 'global-company-mode)

;; Enable Elpy
(package-initialize)
(elpy-enable)

;; Enable flycheck real time syntax checking in Elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Use IPython as the interactive python shell
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; Enable projectile
(projectile-mode)

;; Select the font-type based on the system you are working on
(setq my-preferred-font
      (cond ((eq system-type 'darwin) "Monaco-13")
	    ((eq system-type 'gnu/linux) "monospace-12")
	    (t nil)))
(when my-preferred-font
  (set-frame-font my-preferred-font nil t))

(setq ispell-program-name
      (cond ((eq system-type 'darwin) "/usr/local/bin/ispell")
	    (t nil)))

;; Don't create backup files
(setq make-backup-files nil)

;; Show line numbers by default
(global-linum-mode t)

;; Use the wombat theme by default
(if (display-graphic-p)
    (load-theme 'wombat t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(package-selected-packages
   (quote
    (csv-mode ein flx-ido polymode markdown-mode ess ssh yafolding projectile magit elpy company-auctex)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
