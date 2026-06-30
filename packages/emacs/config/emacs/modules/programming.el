;;; programming.el --- Programming -*- lexical-binding: t; -*-


;;; Commentary:


;;; Code:
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


;;; Footer:

(provide 'programming)


;;; programming.el ends here
