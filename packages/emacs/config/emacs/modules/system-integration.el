;;; system-integration.el --- System integration -*- lexical-binding: t; -*-


;;; Commentary:


;;; Code:

;; ** exec-path-from-shell

(use-package exec-path-from-shell
  
  :config
  (exec-path-from-shell-initialize))


;; ** pinentry

(use-package pinentry
  
  :custom
  (epg-pinentry-mode 'loopback)
  
  :config
  (pinentry-start))


;; ** direnv

(use-package direnv
  
  :config
  (enable direnv-mode))


;; ** hardcore mode

(use-package hardcore-mode
  
  :custom
  (too-hardcore-backspace t)
  (too-hardcore-return t)
  
  :config
  (enable global-hardcore-mode))


;;; Footer:

(provide 'system-integration)


;;; system-integration.el ends here
