;; Add Melpa to the package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Initialize packages
(package-initialize)

;; Show column numbers by default
(setq column-number-mode t)

;; Package: fill-column-index: set the 80 column inidicator
(setq fci-rule-column 80)

;; Move around windows with SHIFT + arrow
(windmove-default-keybindings)

;; Remove the toolbar
(tool-bar-mode -1)

;; Use an indentation style for ESS that mimics the one of RStudio
(setq ess-default-style 'DEFAULT)

;; Use visual line mode
(global-visual-line-mode t)

;; Use pdflatex by default
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)

;; Stan support
;; M-x package-install [RET] stan-mode [RET]
;; M-x package-install [RET] company-stan [RET]
;; M-x package-install [RET] eldoc-mode [RET]
;; M-x package-install [RET] flycheck-mode [RET]
;; M-x package-install [RET] stan-snippets [RET]

;; Create shortcut for magit-status
(global-set-key (kbd "C-x g") 'magit-status)

;; Use company-mode globally
(add-hook 'after-init-hook 'global-company-mode)

;; Enable projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Enable ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Shortcut to join lines
(global-set-key (kbd "C-x C-j") 'join-line)

;; Shortcut for org-agenda
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

;; Enable Elpy
(elpy-enable)

;; Enable flycheck real time syntax checking in Elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Use python -m json.tool to prettify JSON files
(defun format-json ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)
    )
  )

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
