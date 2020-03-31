(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(eval-when-compile
  (require 'use-package))

;; ----------------------------------------------------------------------------
;;  		         General configuration
;; ----------------------------------------------------------------------------

;; Show column numbers by default
(setq column-number-mode t)

;; ;; Show matching parentheses by default
;; (setq show-paren-mode 1)

;; Move around windows with SHIFT + arrow
(windmove-default-keybindings)

;; Remove the toolbar
(tool-bar-mode -1)

;; Use visual line mode
(global-visual-line-mode t)

;; Shortcut for org-agenda
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

<<<<<<< HEAD
;; Enable Elpy
(elpy-enable)

;; Enable flycheck real time syntax checking in Elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
=======
;; Enable ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
>>>>>>> 83757f59cf6d104f50b9962184e972cdf011d341

(setq ispell-program-name
      (cond ((eq system-type 'darwin) "/usr/local/bin/ispell")
	    ((eq system-type 'gnu/linux) "/usr/bin/aspell")
	    (t nil)))

;; Don't create backup files
(setq make-backup-files nil)

;; Automatically close HTML tags
(setq sgml-quick-keys 'close)

;; Select the font-type based on the system you are working on
(setq my-preferred-font
      (cond ((eq system-type 'darwin) "Monaco-13")
	    ((eq system-type 'gnu/linux) "monospace-11")
	    (t nil)))

(when my-preferred-font
  (set-frame-font my-preferred-font nil t))

;; ----------------------------------------------------------------------------
;;		   Package Specific Configurations
;; ----------------------------------------------------------------------------

;; Package: fill-column-index
(use-package fill-column-indicator
  :ensure t
  :config
  (setq fci-rule-column 80))

;; Package: markdown-mode
(use-package markdown-mode
  :ensure t
  :defer t)
 
;; Package: ESS
;; Use an indentation style for ESS that mimics the one of RStudio
(use-package ess
  :ensure t
  :defer t
  :config
  (setq ess-default-style 'DEFAULT))

;; Package: poly-R
(use-package poly-R
  :ensure t
  :defer t)

;; Package: magit
(use-package magit
  :ensure t)

;; Package: Elpy
(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  :config
  (when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode)))

;; Package: projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode +1))
  ;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  ;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (elpy use-package projectile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
