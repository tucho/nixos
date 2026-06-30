;;; org-mode.el --- Org mode -*- lexical-binding: t; -*-


;;; Commentary:


;;; Code:

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


;;; Footer:

(provide 'org-mode)


;;; org-mode.el ends here
