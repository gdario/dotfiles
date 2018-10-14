;; Add Melpa to the package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Move around windows with SHIFT + arrow
(windmove-default-keybindings)

;; Remove the toolbar
(tool-bar-mode -1)

;; Use an indentation style for ESS that mimics the one of RStudio
(setq ess-default-style 'DEFAULT)

;; Use visual line mode
(global-visual-line-mode t)

;; Use pdflatex by default
(setq TeX-PDF-mode t)

;; Create shortcut for magit-status
(global-set-key (kbd "C-x g") 'magit-status)

;; ;; Use company-mode globally
;; (add-hook 'after-init-hook 'global-company-mode)

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

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
