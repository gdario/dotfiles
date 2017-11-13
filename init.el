
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
(require 'ido)
(ido-mode t)
(define-key (cdr ido-minor-mode-map-entry) [remap write-file] nil)

;; Use markdown-mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

; Use visual line mode
(global-visual-line-mode t)

;; Use pdflatex by default
(setq TeX-PDF-mode t)

;; Enable company-auctex
(require 'company-auctex)
(company-auctex-init)

;; Create shortcut for magit-status
(global-set-key (kbd "C-x g") 'magit-status)

;; Use company-mode globally
;; (add-hook 'after-init-hook 'global-company-mode)

;; Enable Elpy
(package-initialize)
(elpy-enable)

;; Enable flycheck real time syntax checking in Elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Use IPython as the interactive python shell
(elpy-use-ipython)

;; Enable yafolding
(setq yafolding-mode t)

;; Enable projectile
(projectile-global-mode)
