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

;; (setq projectile-mode-line "Projectile")
