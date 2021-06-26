(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; Remove the tool-bar (don't confuse it with 
(tool-bar-mode -1)

;;; store all backup and autosave files in the .saves dir

(setq backup-directory-alist `(("." . "~/.saves")))

;;; Set the default font

(if (eq system-type 'darwin)
    (set-frame-font "Monaco-13" nil t)
  (set-frame-font "Monospace-11" nil t))

(global-visual-line-mode t)
(show-paren-mode t)
(electric-pair-mode t)

;;; Make TRAMP faster

(setq remote-file-name-inhibit-cache nil)
(setq vc-ignore-dir-regexp
      (format "%s\\|%s"
                    vc-ignore-dir-regexp
                    tramp-file-name-regexp))
(setq tramp-verbose 1)

;;; Third party packages

(use-package ssh
  :ensure t)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

(use-package ess
  :ensure t
  :defer t
  :init
  (setq ess-style 'DEFAULT))

(use-package poly-markdown
  :ensure t)

(use-package poly-R
  :defer t
  :ensure t)


;; (setq projectile-mode-line "Projectile")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-rpc-virtualenv-path 'current)
 '(package-selected-packages '(ess use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
