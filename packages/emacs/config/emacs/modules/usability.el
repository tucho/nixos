;;; usability.el --- Usability -*- lexical-binding: t; -*-


;;; Commentary:


;;; Code:

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


;;; Footer:

(provide 'usability)


;;; usability.el ends here
