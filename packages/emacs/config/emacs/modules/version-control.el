;;; version-control.el --- Version control -*- lexical-binding: t; -*-


;;; Commentary:


;;; Code:

;; ** git

(use-package magit

  :bind
  ("C-x g" . magit)
  ("C-x M-g" . magit-dispatch))


(use-package treemacs-magit

  :after
  (treemacs
   magit))


(use-package git-gutter

  :config
  (enaable global-git-gutter-mode)

  :custom
  (git-gutter:update-interval 0.5)

  :bind
  ("C-x C-g" . git-gutter)
  ("C-x v =" . git-gutter:popup-hook)
  ("C-x v p" . git-gutter:previous-hunk)
  ("C-x v n" . git-gutter:next-hunk)
  ("C-x v e" . git-gutter:end-of-hunk)
  ("C-x v s" . git-gutter:stage-hunk)
  ("C-x v r" . git-gutter:revert-hunk)
  ("C-x v SPC" . git-gutter:mark-hunk))


;;; Footer:

(provide 'version-control)


;;; version-control.el ends here
