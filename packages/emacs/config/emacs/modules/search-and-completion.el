;;; search-and-completion.el --- Search and completion -*- lexical-binding: t; -*-


;;; Commentary:


;;; Code:

;; ** vertico

(use-package vertico
  
  :init
  (enable vertico-mode)
  
  :hook
  (rfn-eshadow-update-overlay . vertico-directory-tidy)
  
  :bind
  (:map vertico-map
        ("TAB" . minibuffer-complete)
        ("C-<backspace>" . vertico-directory-delete-word)
        ("M-<backspace>" . vertico-directory-delete-word)))

;; ** orderless

(use-package orderless
  
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; ** marginalia

(use-package marginalia
  
  :custom
  (marginalia-max-relative-age 0)
  
  :init
  (enable marginalia-mode))


(use-package nerd-icons-completion
  
  :after
  (nerd-icons
   marginalia)
  
  :config
  (nerd-icons-completion-mode))


;; ** consult

(use-package consult

  :bind
  ("C-c M-x" . consult-mode-command)
  ("C-c h" . consult-history)

  ("C-x b" . consult-buffer)
  ("C-x 4 b" . consult-buffer-other-window)
  ("C-x 5 b" . consult-buffer-other-frame)

  ("M-y" . consult-yank-pop)

  ("M-g g" . consult-goto-line)
  ("M-g M-g" . consult-goto-line)
  ("M-g o" . consult-outline)

  ("M-s l" . consult-line)
  ("M-s k" . consult-keep-lines)
  ("M-s u" . consult-focus-lines)

  (:map minibuffer-local-map
        ("M-s" . consult-history)
        ("M-r" . consult-history)))


;; ** corfu

(use-package corfu

  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 1)
  (corfu-preselect 'prompt)
  (tab-always-indent 'complete)

  :bind
  (:map corfu-map
        ("TAB" . corfu-next)
        ("S-TAB" . corfu-previous))

  :init
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode))


(use-package  nerd-icons-corfu

  :after
  (nerd-icons
   corfu)

  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))


;;; Footer:

(provide 'search-and-completion)


;;; search-and-completion.el ends here
