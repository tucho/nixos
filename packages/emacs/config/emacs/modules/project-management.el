;;; project-management.el --- Project management -*- lexical-binding: t; -*-


;;; Commentary:


;;; Code:

;; ** treemacs

(use-package treemacs
  
  :custom
  (treemacs-is-never-other-window t)
  
  :config
  (treemacs-git-mode 'deferred)
  (enable treemacs-git-commit-diff-mode)

  :bind
  ("M-0" . treemacs-select-window))


(use-package treemacs-nerd-icons

  :config
  (treemacs-load-theme "nerd-icons"))


(use-package treemacs-icons-dired

  :hook
  (dired-mode . treemacs-icons-dired-enable-once))


(use-package treemacs-magit

  :after
  (treemacs
   magit))


(use-package treemacs-projectile

  :after
  (treemacs
   projectile))


;; ** projectile

(use-package projectile

  :init
  (enable projectile-mode)

  :bind
  (:map projectile-mode-map
        ("C-c p" . projectile-command-map))

  :custom
  (projectile-cleanup-known-projects t)
  (projectile-enable-caching t))


(use-package ripgrep)


;;; Footer:

(provide 'project-management)


;;; project-management.el ends here
