;;; init.el --- Emacs initialization


;;; Commentary:


;;; Code:

;; * Ancillary macros and functions

;; Macros to enable and disable modes.
(defmacro set-mode (mode value)
  "Call a '-mode' function with 'value' as its argument, if this function exists."
  `(when (fboundp ',mode)
     (funcall ',mode ,value)))

(defmacro enable (mode)
  "Call the '-mode' function with 1 as its argument, thus enabling this mode."
  `(set-mode ,mode 1))

(defmacro disable (mode)
  "Call the '-mode' function with -1 as its argument, thus disabling this mode."
  `(set-mode ,mode -1))

;; Function to expand a file contained in the Emacs configuration directory.
(defun emacs-d (filename)
  "Expand FILENAME relative to 'user-emacs-directory'."
  (expand-file-name filename user-emacs-directory))

;; Function to reload the entire Emacs configuration.
(defun reload-emacs-config ()
  "Reload the init.el file, thus 'rerunnig' all the configuration."
  (interactive)
  (load-file (emacs-d "init.el"))
  (message "configuration reloaded"))


;; * General settings

;; ** Tweak user interface

;; Do not show the startup screen.
(setq inhibit-startup-screen t)

;; Remove distracting elements.
(disable menu-bar-mode)
(disable tool-bar-mode)
(disable scroll-bar-mode)
(disable horizontal-scroll-bar-mode)

;; Allow frames to be resized pixelwise.
(setq frame-resize-pixelwise t)

;; Maximize frame.
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Configure fonts.
(setq unified-font-family "Hurmit Nerd Font")

(set-face-attribute 'default nil
                    :family "Hurmit Nerd Font"
                    :height 100)

;; Tooltips config.
(setq use-system-tooltips nil)


;; ** Line numbering and highlighting

;; Highlight the current line.
(enable global-hl-line-mode)

;; Show line numbers.
(setq display-line-numbers-width-start t)
(enable global-display-line-numbers-mode)

;; Configure mode line to show point's current line and column numbers.
(enable line-number-mode)
(enable column-number-mode)


;; ** Text manipulation

;; Enable visual line mode globally ("break" long logical lines into two or more screen lines).
(enable global-visual-line-mode)


;; **  Disable auto-save and backup

;; Disable auto-save files (those like #filename#).
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)

;; Disable backup files (those like filename~).
(setq make-backup-files nil)


;; ** Tweak *scratch* buffer

;; Start with a clean the scratch buffer.
(setq initial-scratch-message nil)

;; Make the scratch buffer unkillable.
(defun dont-kill-but-bury-scratch ()
  (if (equal (buffer-name (current-buffer))
             "*scratch*")
      (progn
        (bury-buffer)
        nil)
    t))

(add-hook 'kill-buffer-query-functions 'dont-kill-but-bury-scratch)


;; **  Minibuffer

;; Support opening new minibuffers from inside existing minibuffers.
(setq enable-recursive-minibuffers t)

;; Hide commands in M-x which do not work in the current mode.
(setq read-extended-command-predicate #'command-completion-default-include-p)

;; Do not allow the cursor in the minibuffer prompt
(setq minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))


;; ** Configure indentation and tabulation

;; Make indentation space-only and tabulation 4-space wide.
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


;; ** Set coding system

;; Set UTF-8 as the coding system for:
;; - newly created buffers;
;; - subprocess I/O;
;; - file names;
;; - terminal;
;; - keyboard.
(set-default-coding-systems 'utf-8)


;; ** Misc

(fset 'yes-or-no-p 'y-or-n-p)
(enable global-auto-revert-mode)


;; * Configure package and use-package

;; I am going to use ~package~ as the package manager and ~use-package~ for package configuration.

;; ** Configure package

;; Require ~package~.
(require 'package)

;; Prevent it from messing with ~init.el~.
(setq package--init-file-ensured t)
(setq custom-file (emacs-d "custom-file.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; Configure archives.
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setq package-archive-priorities '(("melpa" . 20)
                                   ("gnu" . 10)))


;; ** Configure use-package

;; Require and configure ~use-package~. Enable ~always-ensure~ feature.
(eval-when-compile
  (require 'use-package))

(use-package use-package
  
  :ensure nil)

(use-package use-package-ensure
  
  :ensure nil
  
  :after
  (use-package)
  
  :custom
  (use-package-always-ensure t))

;; Configure ~bind-key~ (needed to use the ~:bind~ keyword in ~use-package~).
(use-package bind-key
  
  :ensure nil)



;; * Org mode

;; ** General configurattion

(use-package org
  
  :ensure nil
  
  :hook
  (org-mode . org-indent-mode)
  
  :custom
  (org-src-window-setup 'current-window)
  (org-special-ctrl-a/e t)
  (org-special-ctrl-k t)
  (org-ctrl-k-protect-subtree t))


;; ** Source code block tag expansion

;; org-tempo is not a separate package but a module within org that can be enabled. org-tempo allows for '<s' followed by TAB to expand to a begin_src tag. Other expansions available include:

;; | Typing the below + TAB | Expands to ...                          |
;; |------------------------+-----------------------------------------|
;; | <a                     | '#+BEGIN_EXPORT ascii' … '#+END_EXPORT  |
;; | <c                     | '#+BEGIN_CENTER' … '#+END_CENTER'       |
;; | <C                     | '#+BEGIN_COMMENT' … '#+END_COMMENT'     |
;; | <e                     | '#+BEGIN_EXAMPLE' … '#+END_EXAMPLE'     |
;; | <E                     | '#+BEGIN_EXPORT' … '#+END_EXPORT'       |
;; | <h                     | '#+BEGIN_EXPORT html' … '#+END_EXPORT'  |
;; | <l                     | '#+BEGIN_EXPORT latex' … '#+END_EXPORT' |
;; | <q                     | '#+BEGIN_QUOTE' … '#+END_QUOTE'         |
;; | <s                     | '#+BEGIN_SRC' … '#+END_SRC'             |
;; | <v                     | '#+BEGIN_VERSE' … '#+END_VERSE'         |

(use-package org-tempo
  
  :ensure nil
  
  :after
  (org))


;; ** Enable org bullets

;; org-bullets gives us attractive bullets rather than asterisks.
(use-package org-bullets
  
  :hook
  (org-mode . org-bullets-mode))


;; ** Generate table of contents

(use-package toc-org
  
  :hook
  (org-mode . toc-org-enable))


;; * PDF

(use-package pdf-tools
  
  :hook
  (pdf-view-mode . (lambda ()
                     (disable display-line-numbers-mode)))
  
  :config
  (pdf-tools-install))


;; *  Theming

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


;; * Usability

;; ** which-key

(use-package which-key
  
  :ensure nil
  
  :init
  (enable which-key-mode)
  
  :custom
  (which-key-popup-type 'side-window)
  (which-key-side-window-location 'bottom)
  (which-key-sort-order 'which-key-local-then-key-order)
  (which-key-add-column-padding 4)
  (which-key-max-description-length 40)
  
  :bind
  ("C-c C-SPC" . which-key-show-top-level))


;; ** ace-window

(use-package ace-window
  
  :custom
  (aw-dispatch-always t)
  (aw-scope 'frame)
  (aw-ignore-current nil)
  
  :custom-face
  (aw-leading-char-face ((t ( :background "dark orange"
                              :foreground "dark red"
                              :weight bold
                              :height 1.5))))
  
  :bind
  ("M-o" . ace-window))


;; * System integration

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


;; * Search and completion

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


;; * Project/workspace management and navigation

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


;; * Version control

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


;; * Programming

;; ** Code formatting

;; *** smartparens

(use-package smartparens

  :hook
  (prog-mode . smartparens-strict-mode)

  :config
  (require 'smartparens-config)

  :bind
  (:map smartparens-mode-map
        ("C-M-f" . sp-forward-sexp)
        ("C-M-b" . sp-backward-sexp)

        ("C-M-n" . sp-beginning-of-next-sexp)
        ("C-M-S-n" . sp-end-of-next-sexp)
        ("C-M-p" . sp-beginning-of-previous-sexp)
        ("C-M-S-p" . sp-end-of-previous-sexp)

        ("C-M-a" . sp-beginning-of-sexp)
        ("C-M-e" . sp-end-of-sexp)

        ("C-M-<down>" . sp-down-sexp)
        ("C-M-S-<down>" . sp-backward-down-sexp)

        ("C-M-<up>" . sp-backward-up-sexp)
        ("C-M-S-<up>" . sp-up-sexp)

        ("C-M-<space>" . sp-mark-sexp)

        ("C-M-<right>" . sp-forward-slurp-sexp)
        ("C-M-<left>" . sp-backward-slurp-sexp)

        ("C-M-S-<right>" . sp-backward-barf-sexp)
        ("C-M-S-<left>" . sp-forward-barf-sexp)

        ("C-M-]" . sp-unwrap-sexp)
        ("C-M-[" . sp-backward-unwrap-sexp)
        ("C-M-r" . sp-rewrap-sexp)

        ("C-M-j" . sp-join-sexp)
        ("C-M-s" . sp-split-sexp)

        ("C-M-t" . sp-transpose-sexp)

        ("C-M-k" . sp-kill-sexp)
        ("C-M-w" . sp-copy-sexp)
        ("C-M-<backspace>" . sp-backward-delete-sexp)
        ("C-M-<delete>" . sp-delete-sexp)
        ("C-M-d" . sp-delete-sexp)

        ("C-S-f" . sp-forward-symbol)
        ("C-S-b" . sp-backward-symbol)
        ("C-S-k" . sp-kill-symbol)
        ("C-S-<backspace>" . sp-backward-delete-symbol)
        ("C-S-<delete>" . sp-delete-symbol)
        ("C-S-d" . sp-delete-symbol)))


;; *** aggressive-indent

(use-package aggressive-indent

  :hook
  (prog-mode . aggressive-indent-mode)

  :custom
  (aggressive-indent-sit-for-time 5.0))


;; *** rainbow-delimitters

(use-package rainbow-delimiters

  :hook
  (prog-mode . rainbow-delimiters-mode))


;; *** ethan-wspaces

;; (use-package ethan-wspace

;;   :config
;;   (setq mode-require-final-newline nil)
;;   (enable global-ethan-wspace-mode))


;; ** Syntax checking

;; *** flycheck

(use-package flycheck

  :init
  (enable global-flycheck-mode))


;; ** Language server protocol

(use-package lsp-mode

  :after
  (direnv)

  :init
  (setq lsp-keymap-prefix "C-c l")

  :config
  (advice-add 'lsp :before #'direnv-update-environment)

  :hook
  (lsp-mode . lsp-enable-which-key-integration)

  :custom
  (lsp-keymap-prefix "C-c l")
  (lsp-completion-provider :none)
  (lsp-diagnostics-provider :flycheck)
  (lsp-keep-workspace-alive nil)
  (lsp-completion-enable t)
  (lsp-completion-enable-additional-text-edit t)
  (lsp-completion-show-kind t)
  
  :commands lsp)


(use-package lsp-completion

  :ensure nil
  :no-require t

  :hook
  (lsp-mode . lsp-completion-mode))


(use-package lsp-ui

  :after
  (lsp-mode)

  :bind
  ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
  ([remap xref-find-references] . lsp-ui-peek-find-references)

  :commands lsp-ui-mode)


(use-package lsp-treemacs

  :after
  (lsp-mode
   treemacs)

  :custom
  (lsp-treemacs-sync-mode t)

  :commands lsp-treemacs-errors-list)


(use-package dap-mode

  :after
  (lsp-mode)

  :config
  (enable dap-mode)
  (enable dap-ui-mode)
  (enable dap-ui-controls-mode)
  (enable dap-auto-configure-mode))


;; ** Treesit

(use-package treesit-auto

  :custom
  (treesit-auto-install 'prompt)
  (treesit-language-source-alist '((bash "https://github.com/tree-sitter/tree-sitter-bash")
                                   (c "https://github.com/tree-sitter/tree-sitter-c")
                                   (clojure "https://github.com/clojure-emacs/clojure-ts-mode")
                                   (cmake "https://github.com/uyha/tree-sitter-cmake")
                                   (common-lisp "https://github.com/theHamsta/tree-sitter-commonlisp")
                                   (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
                                   (css "https://github.com/tree-sitter/tree-sitter-css")
                                   (csharp "https://github.com/tree-sitter/tree-sitter-c-sharp")
                                   (elisp "https://github.com/Wilfred/tree-sitter-elisp")
                                   (go "https://github.com/tree-sitter/tree-sitter-go")
                                   (go-mod "https://github.com/camdencheek/tree-sitter-go-mod")
                                   (html "https://github.com/tree-sitter/tree-sitter-html")
                                   (js . ("https://github.com/tree-sitter/tree-sitter-javascript" "master" "src"))
                                   (json "https://github.com/tree-sitter/tree-sitter-json")
                                   (lua "https://github.com/Azganoth/tree-sitter-lua")
                                   (make "https://github.com/alemuller/tree-sitter-make")
                                   (markdown "https://github.com/ikatyang/tree-sitter-markdown")
                                   (python "https://github.com/tree-sitter/tree-sitter-python")
                                   (r "https://github.com/r-lib/tree-sitter-r")
                                   (rust "https://github.com/tree-sitter/tree-sitter-rust")
                                   (toml "https://github.com/tree-sitter/tree-sitter-toml")
                                   (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src"))
                                   (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src"))
                                   (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))


;; ** Languages

;; *** Clojure

(use-package clojure-mode

  :hook
  (clojure-mode . lsp)
  (clojurescript-mode . lsp)
  (clojurec-mode . lsp))


(use-package cider

  :after
  (clojure-mode)

  :config
  (add-to-list 'auto-mode-alist '("\\.repl\\'" . clojure-mode))

  :hook
  (clojure-mode . cider-mode)
  (cider-mode . cider-enable-flex-completion)
  (before-save . (lambda ()
                   (clojure-sort-ns)
                   (cider-format-buffer)))
  (cider-mode . turn-on-smartparens-strict-mode)
  (cider-repl-mode . turn-on-smartparens-strict-mode)
  (eval-expression-minibuffer-setup . eldoc-mode)
  (eval-expression-minibuffer-setup . turn-on-smartparens-strict-mode)

  :custom
  (cider-enrich-classpath t)
  (cider-save-file-on-load t)
  (nrepl-log-messages t)
  (cider-special-mode-truncate-lines nil)
  (cider-font-lock-dynamically '(macro core function var deprecated))
  (cider-eldoc-display-context-dependent-info t)
  (cider-print-fn 'pr)
  (cider-overlays-use-font-lock t)
  (cider-repl-history-file (expand-file-name ".cider-repl-history" "~"))

  :bind
  (:map cider-repl-mode-map
        ("<return>" . cider-repl-newline-and-indent)
        ("C-<return>" . cider-repl-return)))


(use-package flycheck-clojure

  :after
  (flycheck
   cider)

  :commands
  (flycheck-clojure-setup)

  :hook
  (after-init . global-flycheck-mode)
  (cider-mode . (lambda ()
                  (setq next-error-function #'flycheck-next-error-function))))


(use-package clj-refactor

  :after
  (clojure-mode)

  :hook
  (clojure-mode . clj-refactor-mode))


(use-package hugsql-ghosts :disabled

  :hook
  (cider-mode . hugsql-ghosts-install))


;; *** Python

(use-package python

  :pin manual

  :custom
  (python-shell-interpreter "uv run ipython")
  (python-shell-interpreter-args "-i --simple-prompt --InteractiveShell.display.page=True")
  (add-to-list 'python-shell-completion-native-disables-interpreters "ipython"))


(use-package ipython-shell-send)


(use-package uv-mode

  :hook
  (python-mode . uv-mode-auto-activate-hook))


(use-package lsp-pyright

  :hook
  (python-mode . (lambda ()
                   (require 'lsp-pyright)
                   (lsp))))


;; *** Lua

(use-package lua-mode

  :custom
  (lua-indent-level 2))


;; *** Nix

(use-package nix-mode

  :mode "\\.nix\\'"

  ;; :hook
  ;; (nix-mode . lsp)
  )


;; *** Docker

(use-package docker)


(use-package dockerfile-mode

  :config
  (add-to-list 'auto-mode-alist '("Dockerfile" . dockerfile-mode)))


(use-package docker-compose-mode

  :config
  (add-to-list 'auto-mode-alist '("docker-compose.yml" . docker-compose-mode)))


;; *** Terraform

(use-package terraform-mode)


;; *** Lilypond

(use-package lilypond-mode
  
  :load-path
  "/usr/share/emacs/site-lisp"
  
  :mode
  "\\.\\(ly\\|ily\\)$")


;; *** Markdown

(use-package markdown-mode

  :mode
  ("READEME\\.md\\'" . gfm-mode)

  :init
  (setq markdown-command "markdown"))


;; *** PKGBUILD

(use-package pkgbuild-mode

  :mode
  "/PKGBUILD$"

  :custom
  (pkgbuild-makepkg-command "makepkg -m -c -f")
  (pkgbuild-update-sums-on-save t)

  :config
  (autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t))


;; *** yaml

(use-package yaml)

(use-package yaml-pro)


;; * Load other config files
(load-file "/home/marcel/.config/emacs/only-display-compile-on-error.el")


;;; Footer:

(provide 'init)


;;; init.el ends here
