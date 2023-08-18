(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; store all backup and autosave files in the .saves dir
(setq backup-directory-alist `(("." . "~/.saves")))

;; Set the default font, based on the OS
(if (eq system-type 'darwin)
    (progn (set-frame-font "Monaco-13" nil t)
     (setq ispell-program-name "/usr/local/bin/ispell"))
  (set-frame-font "Monospace-11" nil t))

(tool-bar-mode -1)
(show-paren-mode t)
(electric-pair-mode t)

;; Enable visual-line mode in all text modes
(add-hook 'text-mode-hook #'visual-line-mode)

;; Enable hs-minor mode on all programming modes
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; Configure org-mode
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(setq org-log-done t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (R . t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fill-column 80)
 '(python-shell-completion-native-enable nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
