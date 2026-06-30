;;; confirure-package-and-use-package.el --- Configure package and use-package  -*- lexical-binding: t; -*-


;;; Commentary:


;;; Code:

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


;;; Footer:

(provide 'configure-package-and-use-package)


;;; configure-package-and-use-package.el ends here
