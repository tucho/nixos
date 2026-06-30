;;; init.el --- Emacs initialization -*- lexical-binding: t; -*-


;;; Commentary:


;;; Code:

;; Set up paths to look inside the custom modules folder

(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

;; * Ancillary macros and functions

(require 'ancillary-macros-and-functions)

;; * General settings

(require 'general-settings)

;; * Configure package and use-package

(require 'configure-package-and-use-package)

;; * Org mode

(require 'org-mode)

;; * PDF

(require 'pdf)

;; *  Theming

(require 'theming)

;; * Usability

(require 'usability)

;; * System integration

(require 'system-integration)

;; * Search and completion

(require 'search-and-completion)

;; * Project/workspace management and navigation

(require 'project-management)

;; * Version control

(require 'version-control)

;; * Programming

(require 'programming)

;; * Load other config files

(require 'only-display-compile-on-error)


;;; Footer:

(provide 'init)


;;; init.el ends here
