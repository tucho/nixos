;;; theming.el --- Theming -*- lexical-binding: t; -*-


;;; Commentary:


;;; Code:

;; **  doom themes

(use-package doom-themes
  
  :config
  (doom-themes-visual-bell-config)
  (load-theme 'doom-molokai t)
  
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t))

;; ** doom modeline

(use-package doom-modeline
  
  :init
  (enable doom-modeline-mode)
  
  :custom
  (doom-modeline-column-zero-based nil)
  (doom-modeline-position-column-line-format '(" (%l,%c) "))
  (doom-modeline-enable-word-count t))


;; ** nerd-icons

(use-package nerd-icons
  
  :init
  (unless (find-font (font-spec :family unified-font-family))
    (nerd-icons-install-fonts t))
  
  :custom
  (nerd-icons-font-family unified-font-family))


;;; Footer:

(provide 'theming)


;;; theming.el ends here
