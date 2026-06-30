;;; general-settings.el --- General settings -*- lexical-binding: t; -*-


;;; Commentary:


;;; Code:

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


;;; Footer:

(provide 'general-settings)


;;; general-settings.el ends here
