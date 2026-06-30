;;; ancillary-macros-and-functions.el --- Ancillary macros and functions -*- lexical-binding: t; -*-


;;; Commentary:


;;; Code:

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


;;; Footer:

(provide 'ancillary-macros-and-functions)


;;; ancillary-macros-and-functions.el ends here
