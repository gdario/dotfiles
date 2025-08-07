(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq backup-directory-alist '(("." . "~/.saves")))
(if window-system (set-frame-font "Menlo 13" nil t))
(setq inhibit-startup-message t)
(column-number-mode t)
(windmove-default-keybindings 'super)
(tool-bar-mode -1)

(add-hook 'text-mode-hook '(lambda ()
    (setq truncate-lines nil
          word-wrap t)))

(add-hook 'prog-mode-hook '(lambda ()
    (setq visual-line-mode t
          word-wrap nil)))
