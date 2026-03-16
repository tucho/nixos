;;; init.el --- Emacs initialization


;;; Commentary:

;; It's only purpose is to babel-load the org config file.


;;; Code:

(require 'org)
(org-babel-load-file
 (expand-file-name "config.org"
                   user-emacs-directory))


;;; Footer:

(provide 'init)


;;; init.el ends here
